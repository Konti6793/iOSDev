//
//  Tweets.h
//  T2
//
//  Created by Tasos Kontogiorgos on 3/13/14./Users/tdk/Desktop/Tweeter/Tweeter/Tweet.m
//  Copyright (c) 2014 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tweet.h"

@interface Tweets : NSObject

+ ( Tweets * ) createFromPlist:( NSString * ) fileName;

- ( Tweet * ) getTweetAtIndex:( int ) index;
- ( Tweet * ) getTweetAtKey:( NSString * ) key;
- ( Tweet * ) getTweetAtUser:( NSString * ) userName andDate:( NSString * ) date;
- ( int ) count;

- ( BOOL ) addTweet: ( Tweet * ) t;
- ( void)  reverse;


@end
