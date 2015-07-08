//
//  Tweet.h
//  T2
//
//  Created by Alexandros Kontogiorgos-Heintz on 3/13/14.
//  Copyright (c) 2014 Alexandros Kontogiorgos-Heintz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : NSObject

@property NSString * user;
@property NSString * text;
@property NSString * date;
@property NSDate *   nsdate;


+ ( Tweet * ) newTweetWithUser:( NSString *) user text:( NSString * ) text date:( NSString * ) date;

+ ( NSString * ) keyByUser:( NSString *) userName andDate: ( NSString *) date;

- ( id ) initWithUser:( NSString *) user text:( NSString * ) text date:( NSString * ) date;

- ( NSString * ) embededUrl;
- ( NSString * ) description;

- ( NSString * )  key;

@end
