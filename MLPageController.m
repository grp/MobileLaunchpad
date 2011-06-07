//
//  MLPageController.m
//  MobileLaunchpad
//
//  Created by Grant Paul on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MLPageController.h"
#import "MLPage.h"

#define kMLPageControllerDockHeight 136
#define kMLPageControllerPageControlOffset 30

@interface MLPageController (Internal)
- (void)relayout;
@end

@implementation MLPageController
@synthesize currentPageIndex, pageScrollView=scrollView, view=containerView, orientation, bottomPage;

- (id)init {
    if ((self = [super init])) {
        containerView = [[UIView alloc] init];
        [containerView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];

        pageControl = [[UIPageControl alloc] init];
        [containerView addSubview:pageControl];

        scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        [scrollView setDelaysContentTouches:NO];
        [scrollView setCanCancelContentTouches:YES];
        [scrollView setAlwaysBounceHorizontal:YES];
        [scrollView setAlwaysBounceVertical:NO];
		[scrollView setPagingEnabled:YES];
        [scrollView setShowsHorizontalScrollIndicator:NO];
        [scrollView setShowsVerticalScrollIndicator:NO];
        [scrollView setDelegate:self];
        [containerView addSubview:scrollView];

        pages = [[NSMutableArray alloc] init];
        currentPageIndex = 0;
        [self relayout];
    }

    return self;
}

- (void)updateCurrentPage {
    currentPageIndex = [scrollView contentOffset].x / [scrollView bounds].size.width;
    [pageControl setCurrentPage:currentPageIndex];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView_ willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        [self updateCurrentPage];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView_ {
    [self updateCurrentPage];
}

- (void)scrollInDirection:(MLPageDirection)direction animated:(BOOL)animated {
    CGPoint target = [scrollView contentOffset];

    if ([direction isEqual:MLPageDirectionLeft]) {
        if (target.x - [scrollView bounds].size.width >= 0) target.x -= [scrollView bounds].size.width;
    } else if ([direction isEqual:MLPageDirectionRight]) {
        if (target.x + [scrollView bounds].size.width <= [scrollView contentSize].width) target.x += [scrollView bounds].size.width;
    }

    [scrollView setContentOffset:target animated:animated];
}

- (void)scrollToPage:(MLPage *)page animated:(BOOL)animated {
    [scrollView setContentOffset:CGPointMake([page frame].origin.x, 0) animated:animated];
}

- (void)setBottomPage:(MLPage *)bottomPage_ {
    [bottomPage removeFromSuperview];
    [bottomPage autorelease];

    bottomPage = [bottomPage_ retain];
    [bottomPage setOrientation:UIInterfaceOrientationPortrait];
    [containerView addSubview:bottomPage];
    [self relayout];
}

- (void)addPage:(MLPage *)page {
    [pages addObject:page];
    [page setOrientation:UIInterfaceOrientationPortrait];
    [self relayout];
}

- (void)removePage:(MLPage *)page {
    [pages removeObjectIdenticalTo:page];
    [self relayout];
}

- (MLPage *)currentPage {
    return [pages objectAtIndex:currentPageIndex];
}

- (void)setOrientation:(UIInterfaceOrientation)orientation_ {
    orientation = orientation_;

    for (MLPage *page in pages) {
        [page setOrientation:orientation];
    }

    [self relayout];
}

- (BOOL)isScrollEnabled {
    return [scrollView isScrollEnabled];
}

- (void)setScrollEnabled:(BOOL)scrollingEnabled {
    [scrollView setScrollEnabled:scrollingEnabled];
}

- (void)relayout {
	CGRect scrollFrame = [containerView bounds];
    scrollFrame.size.height -= kMLPageControllerDockHeight;
    [scrollView setFrame:scrollFrame];

    CGFloat offset = 0.0f;
    for (MLPage *page in pages) {
        CGRect frame;
        frame.origin.x = offset;
        frame.origin.y = 0.0f;
        frame.size.height = scrollFrame.size.height;
        frame.size.width = scrollFrame.size.width;
        [page setFrame:frame];
        [page setNeedsLayout];

        [scrollView addSubview:page];

        offset += frame.size.width;
    }

    CGSize scrollSize = scrollFrame.size;
    scrollSize.width = offset;
    [scrollView setContentSize:scrollSize];

    CGRect frame = [containerView bounds];
    frame.origin.y = [containerView bounds].size.height - kMLPageControllerDockHeight;
    frame.size.height = kMLPageControllerDockHeight;
    [bottomPage setFrame:frame];
    [bottomPage setNeedsLayout];

    [pageControl setNumberOfPages:[pages count]];
    [pageControl sizeToFit];
    CGRect pageFrame = [pageControl frame];
    pageFrame.size.width = [containerView bounds].size.width;
    pageFrame.origin.x = 0;
    pageFrame.origin.y = [containerView bounds].size.height - kMLPageControllerDockHeight - kMLPageControllerPageControlOffset;
    [pageControl setFrame:pageFrame];
}

@end
