//
//  AppDelegate.h
//  Tweeter
//
//  Created by Tasos Kontogiorgos on 3/15/14.
//  Copyright (c) 2014 home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppModel.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-( AppModel * ) mainModel;

@end
