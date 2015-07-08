//
//  AppDelegate.h
//  Tweeter
//
//  Created by Alexandros Kontogiorgos-Heintz on 3/15/14.
//  Copyright (c) 2014 Alexandros Kontogiorgos-Heintz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppModel.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-( AppModel * ) mainModel;

@end
