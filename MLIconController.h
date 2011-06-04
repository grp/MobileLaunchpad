//
//  MLIconController.h
//  MobileLaunchpad
//
//  Created by Grant Paul on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@class MLIcon, MLNullIcon, MLPageController, MLIconListPage, MLDockIconListPage;
@interface MLIconController : NSObject <UIGestureRecognizerDelegate> {
    MLPageController *pageController;
    NSArray *icons;

    NSMutableArray *iconListPages;
    MLDockIconListPage *dockPage;

    BOOL editing;
    MLIcon *grabbedIcon;
    MLNullIcon *destinationHole;
    NSTimer *pageTimer;

    int savedIndex;
    MLIconListPage *savedIconListPage;
    int targetIndex;
    MLIconListPage *targetIconListPage;
}

@property (nonatomic, copy) NSArray *icons;
@property (nonatomic, assign, getter=isEditing) BOOL editing;
@property (nonatomic, assign) MLIcon *grabbedIcon;

- (id)initWithPageController:(MLPageController *)pageController_;

@end
