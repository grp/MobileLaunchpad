//
//  MLPageController.h
//  MobileLaunchpad
//
//  Created by Grant Paul on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MLPageDirectionLeft @"left"
#define MLPageDirectionRight @"right"
typedef NSString *MLPageDirection;

@class MLPage;
@interface MLPageController : NSObject {
    NSMutableArray *pages;
    int currentPageIndex;
    UIScrollView *scrollView;
    UIView *containerView;
    UIInterfaceOrientation orientation;
    MLPage *bottomPage;
}

@property (nonatomic, assign) int currentPageIndex;
@property (nonatomic, readonly) UIScrollView *pageScrollView;
@property (nonatomic, readonly) UIView *view;
@property (nonatomic, retain) MLPage *bottomPage;
@property (nonatomic, assign) UIInterfaceOrientation orientation;
@property (nonatomic, assign, getter=isScrollEnabled) BOOL scrollEnabled;

- (MLPage *)currentPage;
- (void)addPage:(MLPage *)page;
- (void)removePage:(MLPage *)page;
- (void)scrollInDirection:(MLPageDirection)direction animated:(BOOL)animated;
- (void)scrollToPage:(MLPage *)page animated:(BOOL)animated;

@end
