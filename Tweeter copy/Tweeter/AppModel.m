//
//  AppModel.m
//  Tweeter
//
//  Created by Alexandros Kontogiorgos-Heintz on 3/15/14.
//  Copyright (c) 2014 Alexandros Kontogiorgos-Heintz. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel
{
    
    Twiiterer   * engine;
    Persons     * users;
    Tweets      * tweets;
    NSDate      * lastLoadTime;
    
    NSMutableArray * dataUsers;
    
}



- ( void )      addDataUser:( NSObject< DataUser > * ) dataUser
{
    [ self->dataUsers addObject:dataUser ];
}

-( void )didStart
{
    NSObject< DataUser > * u;
    for( u in self->dataUsers )
    {
        [ u dataLoadedStarted ];
    }
}

-( void ) receive:(NSArray *)data
{
    int count = [ data count ];
    for( int i = 0; i < count; i++ )
    {
        id o  = [ data objectAtIndex: i ];
        
        NSString * userName = [ Twiiterer getUserName:o ];
        NSString * userScreenName = [ Twiiterer getUserScreenName:o ];
        NSString * userImageUrl = [ Twiiterer getUserImageUrl:o ];
        NSString * userText = [ Twiiterer getUserText:o ];
        NSString * tweetDate = [ Twiiterer getTweetDate:o ];
        

        if( [ self getUserAtName: userName ] == nil )
        {
            Person * user = [ [ Person alloc] initWithName:userName screenName: userScreenName photo:userImageUrl ];
            [ self->users addUnknownPerson:user ];
        }
        
        if( [ self->tweets getTweetAtUser:userName andDate:tweetDate] == nil )
        {
            Tweet * t = [[ Tweet alloc] initWithUser:userName text:userText date:tweetDate];
            [ self->tweets addTweet:t ];
            
        }
    }
    self->lastLoadTime = [ NSDate date ];
    [ self->users sortBySortNameAscending:YES ];
    [ self notifyUsers];
}

-( void ) notifyUsers
{
    NSObject< DataUser > * u;
    for( u in self->dataUsers )
    {
        [ u dataLoaded ];
    }

}

- ( void )      reverseTweets
{
    [ self->tweets reverse ];
    [ self notifyUsers ];
}


- ( int ) numberOfTweetsForUser: ( NSString *) userName;
{
    int numOfTweets = 0;
    int count = [ self tweetsCount ];
    for( int i = 0; i < count; i++ )
    {
        Tweet * t = [ self getTweetAtIndex:i ];
        if( [ t.user isEqualToString:userName ] )
        {
            numOfTweets++;
        }
    }
    return numOfTweets;
}

-( void ) refresh
{
    [ self loadTweets:1000 ];
}

- ( void ) loadTweets:(int)howMany
{
    [ self->engine execWithCount:howMany ];
}

- ( void ) sendTweet:(NSString *)message
{
    [self->engine sendTeet:message];
}

- ( id ) init
{
    self = [ super init ];
    if( self != nil )
    {
        self->users      = [[ Persons alloc ] init];
        self->tweets     = [[ Tweets alloc] init];
        self->engine     = [[ Twiiterer alloc] initWithListener:self];
        self->dataUsers  = [[ NSMutableArray alloc] init ];
    }
    return  self;
}


- ( Tweet * )   getTweetAtIndex:( int ) index
{
    return [ self->tweets getTweetAtIndex:index ];
}


- ( int )       tweetsCount
{
    return [ self->tweets count];
}

- ( Person * )  getUserAtIndex:( int ) index
{
    return [ self->users getPersonAtIndex:index];
}

- ( Person * )  getUserAtName:( NSString * )name
{
    return [ self->users getPersonAtName:name];
}

- ( int )  usersCount
{
    return [ self->users count ];
}




@end
