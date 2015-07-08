//
//  AppModel.h
//  Tweeter
//
//  Created by Tasos Kontogiorgos on 3/15/14.
//  Copyright (c) 2014 home. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Persons.h"
#import "Tweets.h"
#import "Twiiterer.h"


@protocol DataUser <NSObject>

-( void ) dataLoaded;
-( void ) dataLoadStarted;

@end

@interface AppModel : NSObject< DataListener >

- ( void )      reverseTweets;
- ( void )      addDataUser:( NSObject< DataUser > * ) dataUser;
- ( Tweet * )   getTweetAtIndex:( int ) index;
- ( int )       tweetsCount;
//- ( NSDate * )  lastLoad;

- ( Person * )  getUserAtIndex:( int ) index;
- ( Person * )  getUserAtName:( NSString * )name;
- ( int )       usersCount;


- ( void )      sendTweet: ( NSString * )messsage;

- ( void )      loadTweets: ( int ) howMany;
- ( void )      refresh;

- ( int )       numberOfTweetsForUser: ( NSString *) userName;

- ( id )         init;

@end
