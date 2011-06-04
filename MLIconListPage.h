//
//  MLIconListPage.h
//  MobileLaunchpad
//
//  Created by Grant Paul on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MLPage.h"

@class MLIcon;
@interface MLIconListPage : MLPage {
    NSMutableArray *icons;
}

@property (nonatomic, copy) NSArray *icons;

+ (int)iconRowsForOrientation:(UIInterfaceOrientation)orientation;
+ (int)iconColumnsForOrientation:(UIInterfaceOrientation)orientation;
+ (float)verticalInsetForOrientation:(UIInterfaceOrientation)orientation;
+ (float)horizontalInsetForOrientation:(UIInterfaceOrientation)orientation;

- (int)iconRowsForCurrentOrientation;
- (int)iconColumnsForCurrentOrientation;
- (float)verticalInsetForCurrentOrientation;
- (float)horizontalInsetForCurrentOrientation;

- (BOOL)containsIcon:(MLIcon *)icon;
- (void)removeIcon:(MLIcon *)icon;
- (void)insertIcon:(MLIcon *)icon atPosition:(int)index;
- (int)iconIndexAtPoint:(CGPoint)point;
- (BOOL)canAddIcon;

@end
