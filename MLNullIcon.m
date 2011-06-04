//
//  MLNullIcon.m
//  MobileLaunchpad
//
//  Created by Grant Paul on 5/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MLNullIcon.h"

@implementation MLIcon (MLNullIcon)

- (BOOL) isNullIcon {
    return NO;
}

@end

@implementation MLNullIcon

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self setUserInteractionEnabled:NO];
        [self setIcon:nil];
    }

    return self;
}

- (BOOL)isNullIcon {
    return YES;
}

- (void)setName:(NSString *)name {
    [super setName:nil];
}

- (void)setIcon:(UIImage *)icon {
    [super setIcon:nil];
}

- (BOOL)drawsShadow {
    return NO;
}

@end
