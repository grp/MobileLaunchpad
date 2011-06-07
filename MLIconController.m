//
//  MLIconController.m
//  MobileLaunchpad
//
//  Created by Grant Paul on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MLIconController.h"
#import "MLPageController.h"
#import "MLDockIconListPage.h"
#import "MLIcon.h"
#import "MLNullIcon.h"

#import "MLDragGestureRecognizer.h"

#import "MXRemote.h"

@implementation MLIconController
@synthesize icons, editing, grabbedIcon;

- (id)initWithPageController:(MLPageController *)pageController_ {
    if ((self = [super init])) {
        pageController = pageController_;

        icons = [[NSMutableArray alloc] initWithCapacity:32];
        destinationHole = [[MLNullIcon alloc] init];

        dockPage = [[MLDockIconListPage alloc] init];
        [pageController setBottomPage:dockPage];

        iconListPages = [[NSMutableArray alloc] init];

        UIGestureRecognizer *dragRecognizer = [[MLDragGestureRecognizer alloc] initWithTarget:self action:@selector(dragFromRecognizer:)];
        [dragRecognizer setDelegate:self];
        [dragRecognizer setCancelsTouchesInView:NO];
        UIWindow *target = [[pageController view] window];
        [target addGestureRecognizer:[dragRecognizer autorelease]];

        int token;
        notify_register_dispatch("com.mx.menubutton", &token, dispatch_get_main_queue(), ^(int t) { [self setEditing:NO]; });

        [self clearTarget];
        [self clearSaved];

        [self loadIcons];
        [self loadIconState];
    }

    return self;
}

- (CGPoint)convertGlobalPoint:(CGPoint)point fromIconList:(MLIconListPage *)iconList {
    if (iconList == dockPage) {
        CGPoint p = [iconList convertPoint:point toView:nil];
        NSLog(@"dock %@ -> window %@", NSStringFromCGPoint(point), NSStringFromCGPoint(p));
        return p;
    }
    return [iconList convertPoint:point toView:nil];
}

- (CGPoint)convertGlobalPoint:(CGPoint)point toIconList:(MLIconListPage *)iconList {
    if (iconList == dockPage) {
        CGPoint p = [iconList convertPoint:point fromView:nil];
        NSLog(@"window %@ -> dock %@", NSStringFromCGPoint(point), NSStringFromCGPoint(p));
        return p;
    }
    return [iconList convertPoint:point fromView:nil];
}

- (MLIconListPage *)iconListContainingIcon:(MLIcon *)icon {
    for (MLIconListPage *iconList in iconListPages) {
        if ([iconList containsIcon:icon]) return iconList;
    }

    if ([dockPage containsIcon:icon]) return dockPage;

    return nil;
}

- (MLIconListPage *)iconListAtGlobalPoint:(CGPoint)point {
    CGRect globalDockFrame = [[dockPage superview] convertRect:[dockPage frame] toView:nil];
    if (CGRectContainsPoint(globalDockFrame, point)) {
        return dockPage;
    }

    for (MLIconListPage *iconList in iconListPages) {
        CGRect globalFrame = [[iconList superview] convertRect:[iconList frame] toView:nil];
        if (CGRectContainsPoint(globalFrame, point)) {
            return iconList;
        }
    }

    return nil;
}

- (BOOL)canInsertIcon:(MLIcon *)icon intoIconList:(MLIconListPage *)targetList {
    if (index == -1) return NO;
    if (targetList == nil) return NO;
    if (icon == nil) return NO;
    if (![targetList canAddIcon:icon]) return NO;

    return YES;
}

- (void)insertIcon:(MLIcon *)icon intoIconList:(MLIconListPage *)targetList atIndex:(int)index {
    if (![self canInsertIcon:icon intoIconList:targetList]) return;

    [[self iconListContainingIcon:icon] removeIcon:icon];
    [targetList insertIcon:icon atPosition:index];
}

- (void)moveIconFromWindow:(MLIcon *)icon intoIconList:(MLIconListPage *)iconList {
    CGPoint center = [icon center];
    CGPoint local = [self convertGlobalPoint:center toIconList:iconList];
    NSLog(@"%d %@: %@ -> window %@", iconList == dockPage, [icon identifier], NSStringFromCGPoint(center), NSStringFromCGPoint(local));

    [icon removeFromSuperview];
    [icon setCenter:local];
    [iconList addSubview:icon];
}

- (void)moveIconToWindow:(MLIcon *)icon fromIconList:(MLIconListPage *)iconList {
    CGPoint center = [icon center];
    CGPoint global = [self convertGlobalPoint:center fromIconList:iconList];
    NSLog(@"%d %@: %@ -> list %@", iconList == dockPage, [icon identifier], NSStringFromCGPoint(center), NSStringFromCGPoint(global));

    [iconList removeIcon:icon];
    [icon setCenter:global];
    [[[pageController view] window] addSubview:icon];
}

- (void)beginIconAnimations {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3f];
    [UIView setAnimationBeginsFromCurrentState:YES];
}

- (void)commitIconAnimations {
    [UIView commitAnimations];
}

- (void)removeDestinationHole {
    [[self iconListContainingIcon:destinationHole] removeIcon:destinationHole];
}

- (void)updateDestinationHoleAnimated:(BOOL)animated {
    if (animated) [self beginIconAnimations];
    [self insertIcon:destinationHole intoIconList:targetIconListPage atIndex:targetIndex];
    if (animated) [self commitIconAnimations];
}

- (void)clearGrabbedIconTarget {
    targetIndex = -1;
    targetIconListPage = nil;
}

- (void)clearPageTimer {
    [pageTimer invalidate];
    pageTimer = nil;
}

- (void)updateGrabbedIconTarget {
    int oldIndex = targetIndex;
    MLIconListPage *oldIconListPage = targetIconListPage;

    CGPoint point = [grabbedIcon center];
    targetIconListPage = [self iconListAtGlobalPoint:point];
    targetIndex = [targetIconListPage iconIndexAtPoint:[self convertGlobalPoint:point toIconList:targetIconListPage]];

    if (targetIconListPage != dockPage) {
        CGRect bounds = [[[pageController view] window] bounds];
        CGFloat scrollOffset = 40.0f;
        NSTimeInterval scrollDelay = 1.0f;

        if (point.x > bounds.size.width - scrollOffset) {
            if (pageTimer == nil) pageTimer = [NSTimer scheduledTimerWithTimeInterval:scrollDelay target:self selector:@selector(pageTimerFired:) userInfo:MLPageDirectionRight repeats:NO];
        } else if (point.x < scrollOffset) {
            if (pageTimer == nil) pageTimer = [NSTimer scheduledTimerWithTimeInterval:scrollDelay target:self selector:@selector(pageTimerFired:) userInfo:MLPageDirectionLeft repeats:NO];
        } else {
            if (pageTimer != nil) [self clearPageTimer];
        }
    } else {
        if (pageTimer != nil) [self clearPageTimer];
    }

    BOOL changed = (oldIndex != targetIndex) || (oldIconListPage != targetIconListPage);
    if (changed) [self updateDestinationHoleAnimated:YES];
}

- (void)pageTimerFired:(NSTimer *)timer {
    MLPageDirection direction = (MLPageDirection) [timer userInfo];
    [pageController scrollInDirection:direction animated:YES];
    [self updateGrabbedIconTarget];

    pageTimer = nil;
}

- (void)dragFromRecognizer:(MLDragGestureRecognizer *)recognizer {
    // A drag only matters if there's a grabbed icon.
    if (!editing || grabbedIcon == nil) return;

    // The icon is expected to have moved to it's new location
    // before the target is updated, so update the grabbedIcon.
    CGPoint location = [recognizer locationInView:[recognizer view]];
    [grabbedIcon setCenter:location];

    [self updateGrabbedIconTarget];

    // XXX: Is checking for UIGestureRecognizerStateCancelled here correct behavior?
    if ([recognizer state] == UIGestureRecognizerStateEnded || [recognizer state] == UIGestureRecognizerStateCancelled) {
         [self setGrabbedIcon:nil animated:YES];
    }
}

- (void)iconShortTapEnded:(MLIcon *)icon {
    NSLog(@"tapped %@", [icon identifier]);
    if (!editing) {
        mach_port_t port;
        bootstrap_look_up(bootstrap_port, "com.mx.mx.rpcserver", &port);
        MXRLaunchApplication(port, [[icon identifier] UTF8String]);
    }
}

- (void)iconShortTapBegan:(MLIcon *)icon  {
    NSLog(@"tap began %@", [icon identifier]);
    if (editing && grabbedIcon == nil) {
        [self setGrabbedIcon:icon animated:YES];
    }
}

- (void)iconLongTapBegan:(MLIcon *)icon {
    NSLog(@"long tapped %@", [icon identifier]);
    if (grabbedIcon == nil && !editing) {
        [self setGrabbedIcon:icon animated:YES];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (void)clearTarget {
    targetIndex = -1;
    targetIconListPage = nil;
}

- (void)clearSaved {
    savedIndex = -1;
    savedIconListPage = nil;
}

- (void)setGrabbedIcon:(MLIcon *)icon animated:(BOOL)animated {
    if (icon == grabbedIcon) return;

    if (!editing) [self setEditing:YES];
    [self clearPageTimer];
    [pageController setScrollEnabled:(icon == nil)];

    if (icon != nil) {
        // Clear out any previous grabbed icons before setting this one.
        if (grabbedIcon != nil) [self setGrabbedIcon:nil animated:animated];

        grabbedIcon = icon;
        [self clearTarget];

        savedIconListPage = [self iconListContainingIcon:grabbedIcon];
        savedIndex = [savedIconListPage indexOfIcon:grabbedIcon];

        [self moveIconToWindow:grabbedIcon fromIconList:savedIconListPage];

        // Insert destination hole where the icon was before the
        // animations, so it doesn't animate in two directions.
        [self updateGrabbedIconTarget];
    } else {
        [self removeDestinationHole];

        // If we can't drop in the icon, put it back where it came from.
        if (![self canInsertIcon:grabbedIcon intoIconList:targetIconListPage]) {
            targetIndex = savedIndex;
            targetIconListPage = savedIconListPage;
        }

        NSLog(@"%@ center:%@ superview:%@", [grabbedIcon identifier], NSStringFromCGPoint([grabbedIcon center]), [grabbedIcon superview]);
        // Put it in (as a subview) of the icon list it's going to be
        // inserted into so the coordinates are correct when animating.
        [self moveIconFromWindow:grabbedIcon intoIconList:targetIconListPage];
        NSLog(@"%@ center:%@ superview:%@", [grabbedIcon identifier], NSStringFromCGPoint([grabbedIcon center]), [grabbedIcon superview]);
    }

    if (animated) [self beginIconAnimations];

    if (icon != nil) {
        [grabbedIcon setGrabbed:YES];
        [grabbedIcon setWobbling:NO];
    } else {
        NSLog(@"%d %d %@ center:%@ superview:%@", targetIconListPage == dockPage, targetIndex, [grabbedIcon identifier], NSStringFromCGPoint([grabbedIcon center]), [grabbedIcon superview]);
        [self insertIcon:grabbedIcon intoIconList:targetIconListPage atIndex:targetIndex];
        NSLog(@"%@ center:%@ superview:%@", [grabbedIcon identifier], NSStringFromCGPoint([grabbedIcon center]), [grabbedIcon superview]);
        [grabbedIcon setGrabbed:NO];
        [grabbedIcon setWobbling:YES];

        [self clearTarget];
        grabbedIcon = icon;
    }

    if (animated) [self commitIconAnimations];

    if (icon == nil) [self saveIconState];
}

- (void)setGrabbedIcon:(MLIcon *)icon {
    [self setGrabbedIcon:icon animated:NO];
}

- (void)loadIcons {
    mach_port_t port;
    mach_msg_type_number_t count;
    serialized_t serialized;
    bootstrap_look_up(bootstrap_port, "com.mx.mx.rpcserver", &port);
    MXRCopyApplicationList(port, &serialized, &count);
    NSData *data = [NSData dataWithBytes:serialized length:count];
    NSDictionary *info = [NSPropertyListSerialization propertyListFromData:data mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL];

    NSMutableArray *rpcicons = [NSMutableArray array];

    for (NSDictionary *repr in [info allValues]) {
        NSString *identifier = [repr objectForKey:@"BundleIdentifier"];

        MLIcon *icon = [[MLIcon alloc] init];
        [icon setIdentifier:identifier];
        [icon setPrerendered:[[repr objectForKey:@"HasPrerenderedIcon"] boolValue]];
        [icon setSystem:[[repr objectForKey:@"IsSystemApplication"] boolValue]];
        UIImage *image = [UIImage imageWithContentsOfFile:[repr objectForKey:@"IconPath"]];
        if (image != nil) [icon setIcon:image];
        NSString *name = [repr objectForKey:@"DisplayName"];
        if ([name hasSuffix:@"~ipad"]) name = [name substringToIndex:[name length] - [@"~ipad" length]];
        [icon setName:name];
        if (![[repr objectForKey:@"IsHidden"] boolValue]) [rpcicons addObject:icon];
    }

    [self setIcons:rpcicons];
}

- (MLIcon *)iconWithIdentifier:(NSString *)identifier {
    for (MLIcon *icon in icons) {
        if ([[icon identifier] isEqual:identifier]) {
            return icon;
        }
    }

    return nil;
}

- (void)saveIconState {
    NSMutableDictionary *state = [NSMutableDictionary dictionary];

    NSArray *dock = [dockPage icons];
    NSMutableArray *dockIcons = [NSMutableArray array];
    for (MLIcon *icon in dock) [dockIcons addObject:[icon identifier]];
    [state setObject:dockIcons forKey:@"Dock"];

    NSMutableArray *pages = [NSMutableArray array];
    for (MLIconListPage *iconListPage in iconListPages) {
        NSArray *page = [iconListPage icons];
        NSMutableArray *pageIcons = [NSMutableArray array];
        for (MLIcon *icon in page) [pageIcons addObject:[icon identifier]];
        [pages addObject:pageIcons];
    }
    [state setObject:pages forKey:@"IconLists"];

    [state writeToFile:@"/var/mobile/Library/Preferences/com.chpwn.mx.mobilelaunchpad.iconstate.plist" atomically:NO];
}

- (void)loadIconState {
    NSLog(@"loading icon state");

    NSDictionary *state = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.chpwn.mx.mobilelaunchpad.iconstate.plist"];
    NSArray *dock = [state objectForKey:@"Dock"];
    NSArray *iconLists = [state objectForKey:@"IconLists"];

    if (dock == nil || iconLists == nil) {
        [self createDefaultState];
    } else {
        NSMutableArray *dockIcons = [NSMutableArray array];
        for (NSString *identifier in dock) {
            MLIcon *icon = [self iconWithIdentifier:identifier];
            if (icon != nil) [dockIcons addObject:icon];
        }
        [dockPage setIcons:dockIcons];

        for (NSArray *iconList in iconLists) {
            if ([iconList count] == 0) continue;

            MLIconListPage *iconListPage = [[MLIconListPage alloc] init];
            NSMutableArray *listIcons = [NSMutableArray array];
            for (NSString *identifier in iconList) {
                MLIcon *icon = [self iconWithIdentifier:identifier];
                if (icon != nil) [listIcons addObject:icon];
            }
            [iconListPage setIcons:listIcons];

            [iconListPages addObject:iconListPage];
            [pageController addPage:iconListPage];
        }
    }
}

- (void)createDefaultState {
    int page = [MLIconListPage iconRowsForOrientation:[pageController orientation]] * [MLIconListPage iconColumnsForOrientation:[pageController orientation]];
    int dock = [MLDockIconListPage iconRowsForOrientation:[pageController orientation]] * [MLDockIconListPage iconColumnsForOrientation:[pageController orientation]];

    [dockPage setIcons:[icons subarrayWithRange:NSMakeRange(0, dock)]];

    for (int i = dock; i < [icons count]; i += page) {
        NSMutableArray *this = [NSMutableArray array];
        for (int j = 0; j < page && (i + j) < [icons count]; j++) 
            [this addObject:[icons objectAtIndex:j + i]];

        MLIconListPage *list = [[MLIconListPage alloc] init];
        [list setIcons:this];
        [iconListPages addObject:list];
        [pageController addPage:list];
    }
}

- (void)setIcons:(NSArray *)icons_ {
    [icons release];
    icons = [icons_ copy];

    for (MLIcon *icon in icons) {
        [icon addTarget:self action:@selector(iconShortTapEnded:) forControlEvents:UIControlEventTouchUpInside];
        [icon addTarget:self action:@selector(iconShortTapBegan:) forControlEvents:UIControlEventTouchDown];
        [icon addTarget:self action:@selector(iconLongTapBegan:) forControlEvents:MLControlEventTouchLongBegan];
    }
}

- (void)compactIconListPages {
    for (MLIconListPage *iconListPage in iconListPages) {
        if ([[iconListPage icons] count] == 0) {
            [iconListPages removeObjectIdenticalTo:iconListPage];
            [pageController removePage:iconListPage];
        }
    }
}

- (void)setEditing:(BOOL)editing_ {
    if (editing == editing_) return;
    editing = editing_;

    if (!editing) {
        if (grabbedIcon != nil) [self setGrabbedIcon:nil animated:NO];
        [self compactIconListPages];
    } else {
        MLIconListPage *iconListPage = [[MLIconListPage alloc] init];
        [iconListPages addObject:iconListPage];
        [pageController addPage:iconListPage];
    }

    for (MLIcon *icon in icons) {
        [icon setWobbling:editing];
    }
}

- (void)dealloc {
    [icons release];
    [destinationHole release];
    [super dealloc];
}

@end
