//
//  Person.h
//  T2
//
//  Created by Tasos Kontogiorgos on 3/13/14.
//  Copyright (c) 2014 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Locator.h"

@interface Person : NSObject

@property NSString *    sortName;
@property NSString *    screenName;
@property NSString *    address;
@property NSString *    name;
@property NSString *    photo;
@property UIImage  *    image;
@property CLPlacemark * placeMark;

+ ( Person * ) newPersonWithName:( NSString *) name screenName: ( NSString * ) sn photo:( NSString * ) photo address:( NSString * ) address;

- ( id ) initWithName:( NSString * ) myName  screenName: ( NSString * ) sn photo:( NSString * ) myPhoto address:( NSString * ) address;
- ( NSString * ) description;

@end
