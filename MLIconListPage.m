//
//  MLIconListPage.m
//  MobileLaunchpad
//
//  Created by Grant Paul on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MLIconListPage.h"
#import "MLIcon.h"

@implementation MLIconListPage
@synthesize icons;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        icons = [[NSMutableArray alloc] init];
    }

    return self;
}

+ (int)iconColumnsForOrientation:(UIInterfaceOrientation)orientation {
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        return 4;
    } else {
        return 5;
    }
}

- (int)iconColumnsForCurrentOrientation {
    return [[self class] iconColumnsForOrientation:[self orientation]];
}

+ (int)iconRowsForOrientation:(UIInterfaceOrientation)orientation {
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        return 5;
    } else {
        return 4;
    }
}

- (int)iconRowsForCurrentOrientation {
    return [[self class] iconRowsForOrientation:[self orientation]];
}

+ (float)verticalInsetForOrientation:(UIInterfaceOrientation)orientation {
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        return 56.0f;
    } else {
        return 42.0f;
    }
}

+ (float)horizontalInsetForOrientation:(UIInterfaceOrientation)orientation {
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        return 42.0f;
    } else {
        return 56.0f;
    }
}

- (CGFloat)horizontalInsetForCurrentOrientation {
    return [[self class] horizontalInsetForOrientation:orientation];
}

- (CGFloat)verticalInsetForCurrentOrientation {
    return [[self class] verticalInsetForOrientation:orientation];
}

- (CGFloat)horizontalPadding {
    if ([self iconColumnsForCurrentOrientation] == 1) return 0;

    CGFloat width = [self bounds].size.width;
    width -= [self horizontalInsetForCurrentOrientation] + [self horizontalInsetForCurrentOrientation];
    CGFloat iconWidth = [MLIcon defaultIconSize].width;
    int iconCount = [self iconColumnsForCurrentOrientation];
    width -= iconCount * iconWidth;
    return width / (iconCount - 1);
}

- (CGFloat)verticalPadding {
    if ([self iconRowsForCurrentOrientation] == 1) return 0;

    CGFloat height = [self bounds].size.height;
    height -= [self verticalInsetForCurrentOrientation] + [self verticalInsetForCurrentOrientation];
    CGFloat iconHeight = [MLIcon defaultIconSize].height;
    int iconCount = [self iconRowsForCurrentOrientation];
    height -= iconCount * iconHeight;
    return height / (iconCount - 1);
}

- (CGPoint)originForIconAtX:(int)x Y:(int)y {
    CGPoint origin;
    origin.x = [self horizontalInsetForCurrentOrientation] + ([self horizontalPadding] + [MLIcon defaultIconSize].width) * x;
    origin.y = [self verticalInsetForCurrentOrientation] + ([self verticalPadding] + [MLIcon defaultIconSize].height) * y;
    return origin;
}

- (int)iconRowAtPoint:(CGPoint)point {
    point.y -= [self verticalInsetForCurrentOrientation];
    int row = point.y / ([self verticalPadding] + [MLIcon defaultIconSize].height);
    if (row > [self iconRowsForCurrentOrientation]) row = [self iconRowsForCurrentOrientation];
    return row;
}

- (int)iconColumnAtPoint:(CGPoint)point {
    point.x -= [self horizontalInsetForCurrentOrientation];
    int col = point.x / ([self horizontalPadding] + [MLIcon defaultIconSize].width);
    if (col > [self iconColumnsForCurrentOrientation]) col = [self iconColumnsForCurrentOrientation];
    return col;
}

- (int)iconIndexAtPoint:(CGPoint)point {
    int col = [self iconColumnAtPoint:point];
    int row = [self iconRowAtPoint:point];
    return (row * [self iconColumnsForCurrentOrientation]) + col;
}

- (void)layoutIconsNow {
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setOrientation:(UIInterfaceOrientation)orientation_ {
    orientation = orientation_;
    orientation = UIInterfaceOrientationLandscapeRight;
    [self layoutIconsNow];
}

- (void)setIcons:(NSArray *)icons_ {
    [icons autorelease];
    icons = [icons_ mutableCopy];
    [self setNeedsLayout];
}

- (BOOL)canAddIcon:(MLIcon *)icon {
    return ([icons count] < [self iconRowsForCurrentOrientation] * [self iconColumnsForCurrentOrientation]) || [self containsIcon:icon];
}

- (BOOL)containsIcon:(MLIcon *)icon {
    return [icons indexOfObjectIdenticalTo:icon] != NSNotFound;
}

- (int)indexOfIcon:(MLIcon *)icon {
    return [icons indexOfObjectIdenticalTo:icon];
}

- (void)removeIcon:(MLIcon *)icon {
    [icons removeObjectIdenticalTo:icon];
    [icon removeFromSuperview];
    [self layoutIconsNow];
}

- (void)insertIcon:(MLIcon *)icon atPosition:(int)index {
    NSLog(@"inserting %@ at %d", [icon identifier], index);
    if (index > [icons count]) index = [icons count];
    if (index < 0) index = 0;
    NSLog(@"inserting %@ at %d", [icon identifier], index);

    [icons insertObject:icon atIndex:index];
    [self layoutIconsNow];
}

- (void)layoutSubviews {
    for (int x = 0; x < [self iconColumnsForCurrentOrientation]; x++) {
        for (int y = 0; y < [self iconRowsForCurrentOrientation]; y++) {
            CGPoint origin = [self originForIconAtX:x Y:y];
            origin.x = floorf(origin.x);
            origin.y = floorf(origin.y);
            int index = y * [self iconColumnsForCurrentOrientation] + x;
            if (index >= [icons count]) continue;
            MLIcon *icon = [icons objectAtIndex:index];
            [self addSubview:icon];
            [icon setOrigin:origin];
        }
    }
}

@end
