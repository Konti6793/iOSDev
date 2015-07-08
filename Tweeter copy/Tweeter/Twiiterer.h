//
//  Twiiterer.h
//  TT2
//
//  Created by Alexandros Kontogiorgos-Heintz on 3/13/14.
//  Copyright (c) 2014 Alexandros Kontogiorgos-Heintz. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol DataListener <NSObject>

-( void ) receive:( NSArray * ) data;
-( void ) didStart;

@end

@interface Twiiterer : NSObject


-( id ) initWithListener: ( NSObject< DataListener > * ) listener;
-( void ) execWithCount:( int ) count;
-( void ) sendTeet: (NSString*) message;

+( NSString * ) getUserName: ( NSDictionary * ) raw;
+( NSString * ) getUserScreenName: ( NSDictionary * ) raw;
+( NSString * ) getUserText: ( NSDictionary * ) raw;
+( NSString * ) getTweetDate: ( NSDictionary * ) raw;
+( NSString * ) getUserImageUrl: ( NSDictionary * ) raw;

@end
