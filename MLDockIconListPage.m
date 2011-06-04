//
//  MLDockIconListPage.m
//  MobileLaunchpad
//
//  Created by Grant Paul on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MLDockIconListPage.h"

@implementation MLDockIconListPage

+ (int)iconRowsForOrientation:(UIInterfaceOrientation)orientation {
    return 1;
}

+ (int)iconColumnsForOrientation:(UIInterfaceOrientation)orientation {
    return 6;
}

+ (float)horizontalInsetForOrientation:(UIInterfaceOrientation)orientation {
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        return 30.0f;
    } else {
        return 80.0f;
    }
}

+ (float)verticalInsetForOrientation:(UIInterfaceOrientation)orientation {
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        return 0.0f;
    } else {
        return 0.0f;
    }
}

- (int)effectiveColumnsForHorizontalPadding {
    return [[self icons] count];
}

- (void)drawRect:(CGRect)rect {
    CGRect dock = [self frame];
    dock.size.height = 74.0f;
    dock.origin.y = self.frame.size.height - dock.size.height;

    CGContextClearRect(UIGraphicsGetCurrentContext(), rect);

	CGRect shelfRect = CGRectMake(0, dock.origin.y, dock.size.width, dock.size.height - 3);
	CGRect sideShelfRect = CGRectMake(0, self.frame.size.height - 3, dock.size.width, 3);
	CGRect glossRect = CGRectMake(0, dock.origin.y - (shelfRect.size.height / 2), shelfRect.size.width, shelfRect.size.height);

	CGContextSetStrokeColorWithColor(UIGraphicsGetCurrentContext(), [[UIColor colorWithRed:1 green:0 blue:0 alpha:1] CGColor]);

	CGContextSaveGState(UIGraphicsGetCurrentContext());

	// Dock Top Path
	CGContextMoveToPoint(UIGraphicsGetCurrentContext(), shelfRect.origin.x, shelfRect.origin.y + shelfRect.size.height);
	CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), shelfRect.origin.x + 30, shelfRect.origin.y);
	CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), shelfRect.origin.x + shelfRect.size.width - 30, shelfRect.origin.y);
	CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), shelfRect.origin.x + shelfRect.size.width, shelfRect.origin.y + shelfRect.size.height);
	CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), shelfRect.origin.x, shelfRect.origin.y + shelfRect.size.height);

	CGContextClip(UIGraphicsGetCurrentContext());

    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[8] = { 0.8, 0.8, 0.8, 0.5, 0.8, 0.8, 0.8, 0.5 };
    CGFloat locations[2] = { 1.0, 0.0 };
	CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, sizeof(locations) / sizeof(locations[0]));
	CGPoint start = shelfRect.origin;
    CGPoint end = CGPointMake(shelfRect.origin.x, shelfRect.origin.y + shelfRect.size.height);
	CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), gradient, start, end, 0);

	// Gloss
	CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), [[UIColor colorWithWhite:1 alpha:0.1] CGColor]);
	CGContextAddEllipseInRect(UIGraphicsGetCurrentContext(), glossRect);
	CGContextFillPath(UIGraphicsGetCurrentContext());

	CGContextRestoreGState(UIGraphicsGetCurrentContext());

    CGContextAddRect(UIGraphicsGetCurrentContext(), sideShelfRect);
	CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), [[UIColor colorWithWhite:0.6 alpha:1] CGColor]);
	CGContextFillPath(UIGraphicsGetCurrentContext());

    [super drawRect:rect];
}

@end

