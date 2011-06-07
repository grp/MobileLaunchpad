//
//  MLIcon.h
//  MobileLaunchpad
//
//  Created by Grant Paul on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@class CAFilter;

enum {
    MLControlEventTouchLongBegan = 1 << 24
};

@interface MLIcon : UIControl {
    NSString *name;
    NSString *identifier;
    UIImage *icon;
    BOOL prerendered;
    BOOL wobbling;
    BOOL grabbed;
    BOOL system;

    UIView *containerView;
	UIImageView *iconView;
	UILabel *nameLabel;
}

@property (nonatomic, assign, getter=isPrerendered) BOOL prerendered;
@property (nonatomic, assign, getter=isWobbling) BOOL wobbling;
@property (nonatomic, assign, getter=isGrabbed) BOOL grabbed;
@property (nonatomic, assign, getter=isSystem) BOOL system;
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, retain) UIImage *icon;
@property (nonatomic, copy) NSString *name;

+ (CGSize)defaultIconSize;
- (void)setOrigin:(CGPoint)origin;
- (BOOL)drawsShadow;

@end

