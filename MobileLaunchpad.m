//
//  MobileLaunchpadAppDelegate.m
//  MobileLaunchpad
//
//  Created by Grant Paul on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MobileLaunchpad.h"
#import "MLPage.h"
#import "MLIcon.h"
#import "MLNullIcon.h"
#import "MLIconListPage.h"
#import "MLDockIconListPage.h"

@implementation MobileLaunchpad
@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [window makeKeyAndVisible];
    
    wallpaperView = [[MLWallpaperView alloc] init];
    [wallpaperView setImage:[UIImage imageNamed:@"wallpaper.jpg"]];
    [wallpaperView setFrame:[window bounds]];
    [window addSubview:wallpaperView];
    
    pageController = [[MLPageController alloc] init];
    [pageController setOrientation:UIInterfaceOrientationPortrait];
    [[pageController view] setFrame:[window bounds]];
    [window addSubview:[pageController view]];
    
    iconController = [[MLIconController alloc] initWithPageController:pageController];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

- (void)dealloc {
    [window release];
    
    [super dealloc];
}

@end
