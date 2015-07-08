//
//  Tweets.h
//  T2
//
//  Created by Alexandros Kontogiorgos-Heintz on 3/13/14.
//  Copyright (c) 2014 Alexandros Kontogiorgos-Heintz. All rights reserved.
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
