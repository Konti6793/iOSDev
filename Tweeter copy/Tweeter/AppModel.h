//
//  AppModel.h
//  Tweeter
//
//  Created by Alexandros Kontogiorgos-Heintz on 3/15/14.
//  Copyright (c) 2014 Alexandros Kontogiorgos-Heintz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Persons.h"
#import "Tweets.h"
#import "Twiiterer.h"


@protocol DataUser <NSObject>

-( void ) dataLoaded;
-( void ) dataLoadedStarted;

@end

@interface AppModel : NSObject< DataListener >

- ( void )      reverseTweets;
- ( void )      addDataUser:( NSObject< DataUser > * ) dataUser;
- ( Tweet * )   getTweetAtIndex:( int ) index;
- ( int )       tweetsCount;
//- ( NSDate * )  lastLoadTime;

- ( Person * )  getUserAtIndex:( int ) index;
- ( Person * )  getUserAtName:( NSString * )name;
- ( int )       usersCount;


- ( void )      loadTweets: ( int ) howMany;
- ( void )      sendTweet: ( NSString* ) message;
- ( void )      refresh;

- ( int )       numberOfTweetsForUser: ( NSString *) userName;

- ( id )         init;

@end
