//
//  MLIcon.m
//  MobileLaunchpad
//
//  Created by Grant Paul on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MLIcon.h"

@interface UIImage (Private)
- (UIImage *)_applicationIconImageForFormat:(int)format precomposed:(BOOL)precomposed scale:(CGFloat)scale;
@end


@implementation MLIcon
@synthesize icon, name, prerendered, wobbling, grabbed, identifier;

+ (CGSize)defaultIconSize {
    return CGSizeMake(150, 130);
}

+ (UIImage *)shadowImage {
    return [UIImage imageNamed:@"iconshadow.png"];
}

+ (UIImage *)defaultIconImage {
    return [UIImage imageNamed:@"defaulticon.png"];
}

- (id)init {
	if ((self = [super initWithFrame:CGRectZero])) {
        CGRect frame;
        frame.size = [[self class] defaultIconSize];
        frame.origin = CGPointZero;
        [self setFrame:frame];

        [self setOpaque:NO];
        [self setBackgroundColor:[UIColor clearColor]];

        containerView = [[UIView alloc] initWithFrame:[self bounds]];
        [self addSubview:containerView];

        float captionHeight = 18;
        float captionOffset = 10;
        float szH = 76;
		float szW = 74;

        iconView = [[UIImageView alloc] init];
	    [iconView setFrame:CGRectMake(lroundf(self.frame.size.width / 2 - szW / 2),
            lroundf((self.frame.size.height / 2 - szH / 2)),
            szW,
            szH
        )];
	    [containerView addSubview:iconView];

        shadowView = [[UIImageView alloc] init];
        [shadowView setFrame:[iconView bounds]];
        [shadowView setImage:[[self class] shadowImage]];
        [shadowView setHidden:YES];
        [iconView addSubview:shadowView];

        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(captionOffset, self.frame.size.height - captionHeight, self.frame.size.width - captionOffset - captionOffset, 14)];
        [nameLabel setBackgroundColor:[UIColor clearColor]];
        [nameLabel setTextColor:[UIColor whiteColor]];
        [nameLabel setShadowColor:[UIColor blackColor]];
        [nameLabel setLineBreakMode:UILineBreakModeMiddleTruncation];
        [nameLabel setNumberOfLines:1];
        [nameLabel setFont:[UIFont boldSystemFontOfSize:12.0f]];
        [nameLabel setTextAlignment:UITextAlignmentCenter];
        [nameLabel setShadowOffset:CGSizeMake(0, 1)];
	    [containerView addSubview:nameLabel];

        [self setPrerendered:YES];
        [self setIcon:[[self class] defaultIconImage]];

	    [self setNeedsDisplay];
    }

	return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    [shadowView setHidden:!highlighted];
}

- (void)setWobbling:(BOOL)wobbling_ {
    if (wobbling == wobbling_) return;
    wobbling = wobbling_;

    [[containerView layer] removeAllAnimations];
    [containerView setTransform:CGAffineTransformIdentity];

    if (wobbling) {
        CGAffineTransform leftWobble = CGAffineTransformRotate(CGAffineTransformIdentity, (-2.0 * M_PI) / 180.0);
        CGAffineTransform rightWobble = CGAffineTransformRotate(CGAffineTransformIdentity, (2.0 * M_PI) / 180.0);

        [containerView setTransform:leftWobble];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationRepeatAutoreverses:YES];
        [UIView setAnimationRepeatCount:CGFLOAT_MAX];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView setAnimationDuration:0.1f];
        [UIView setAnimationDelegate:containerView];
        [containerView setTransform:rightWobble];
        [UIView commitAnimations];
    }
}

- (void)setGrabbed:(BOOL)grabbed_ {
    if (grabbed == grabbed_) return;
    grabbed = grabbed_;

    [self setTransform:CGAffineTransformIdentity];
    [self setAlpha:1.0f];

    if (grabbed) {
        [self setAlpha:0.6f];
        [self setTransform:CGAffineTransformScale([self transform], 1.25, 1.25)];
    }
}

- (BOOL)drawsShadow {
    return YES;
}

- (void)updateIcon {
    UIImage *rendered = nil;
    if (system) rendered = icon;
    else rendered = [icon _applicationIconImageForFormat:2 precomposed:prerendered scale:1.0];
    [iconView setImage:rendered];
}

- (void)setSystem:(BOOL)system_ {
    system = system_;

    [self updateIcon];
}

- (void)setPrerendered:(BOOL)prerendered_ {
    prerendered = prerendered_;

    [self updateIcon];
}

- (void)setName:(NSString *)name_ {
    [name autorelease];
    name = [name_ copy];

    [nameLabel setText:name];
}

- (void)setIcon:(UIImage *)icon_ {
    [icon autorelease];
    icon = [icon_ retain];

    [self updateIcon];
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame;
    frame.origin = origin;
    frame.size = [[self class] defaultIconSize];
	[super setFrame:frame];
}

@end

