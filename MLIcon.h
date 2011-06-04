//
//  MLIcon.h
//  MobileLaunchpad
//
//  Created by Grant Paul on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

CG_INLINE void CGContextAddRoundedRect(CGContextRef c, CGRect rect, int corner_radius) {
    CGFloat x_left = rect.origin.x;
    CGFloat x_left_center = rect.origin.x + corner_radius;
    CGFloat x_right_center = rect.origin.x + rect.size.width - corner_radius;
    CGFloat x_right = rect.origin.x + rect.size.width;
    CGFloat y_top = rect.origin.y;
    CGFloat y_top_center = rect.origin.y + corner_radius;
    CGFloat y_bottom_center = rect.origin.y + rect.size.height - corner_radius;
    CGFloat y_bottom = rect.origin.y + rect.size.height;
    CGContextBeginPath(c);
    CGContextMoveToPoint(c, x_left, y_top_center);
    CGContextAddArcToPoint(c, x_left, y_top, x_left_center, y_top, corner_radius);
    CGContextAddLineToPoint(c, x_right_center, y_top);
    CGContextAddArcToPoint(c, x_right, y_top, x_right, y_top_center, corner_radius);
    CGContextAddLineToPoint(c, x_right, y_bottom_center);
    CGContextAddArcToPoint(c, x_right, y_bottom, x_right_center, y_bottom, corner_radius);
    CGContextAddLineToPoint(c, x_left_center, y_bottom);
    CGContextAddArcToPoint(c, x_left, y_bottom, x_left, y_bottom_center, corner_radius);
    CGContextAddLineToPoint(c, x_left, y_top_center);
    CGContextClosePath(c);
}


@interface MLIcon : UIView {
    NSString *name;
    NSString *identifier;
    UIImage *icon;
    BOOL prerendered;
    BOOL wobbling;
    BOOL grabbed;
    BOOL system;

    UIView *containerView;
	UIImageView *iconView;
    UIImageView *shadowView;
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
+ (UIImage *)shadowImage;
- (void)setOrigin:(CGPoint)origin;
- (BOOL)drawsShadow;

@end

