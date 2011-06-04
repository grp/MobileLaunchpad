//
//  MLPageView.m
//  MobileLaunchpad
//
//  Created by Grant Paul on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MLPage.h"

@implementation MLPage
@synthesize orientation;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self setOpaque:NO];
    }

    return self;
}

- (void)setOrientation:(UIInterfaceOrientation)orientation_ {
    orientation = orientation_;
    [self setNeedsLayout];
}

- (void)dealloc {
    [super dealloc];
}

@end
