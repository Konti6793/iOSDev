//
//  Locator.h
//  Tweeter
//
//  Created by Tasos Kontogiorgos on 3/30/14.
//  Copyright (c) 2014 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreLocation/CoreLocation.h"

@class Person;


@interface Locator : NSObject
- ( void ) processPerson: ( Person * ) p;
@end
