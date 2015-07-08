//
//  Person.h
//  T2
//
//  Created by Alexandros Kontogiorgos-Heintz on 3/13/14.
//  Copyright (c) 2014 Alexandros Kontogiorgos-Heintz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString * sortName;
@property NSString * screenName;
@property NSString * name;
@property NSString * photo;
@property UIImage  * image;

+ ( Person * ) newPersonWithName:( NSString *) name screenName: ( NSString * ) sn photo:( NSString * ) photo;

- ( id ) initWithName:( NSString * ) myName  screenName: ( NSString * ) sn photo:( NSString * ) myPhoto;
- ( NSString * ) description;

@end
