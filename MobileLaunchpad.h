//
//  MobileLaunchpadAppDelegate.h
//  MobileLaunchpad
//
//  Created by Grant Paul on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MLPageController.h"
#import "MLIconController.h"
#import "MLWallpaperView.h"

@interface MobileLaunchpad : NSObject <UIApplicationDelegate> {
    MLWallpaperView *wallpaperView;
    MLPageController *pageController;
    MLIconController *iconController;
}

@property (nonatomic, retain) UIWindow *window;

@end
