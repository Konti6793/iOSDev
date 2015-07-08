//
//  Tweets.m
//  T2
//
//  Created by Tasos Kontogiorgos on 3/13/14.
//  Copyright (c) 2014 home. All rights reserved.
//

#import "Tweets.h"
#import "Tweet.h"

@implementation Tweets
{
    NSMutableArray * tweetsList;
    NSMutableDictionary * tweetsMap;
}


+( Tweets * ) createFromPlist:(NSString *)fileName
{
    Tweets * ts = [ [ Tweets alloc] init ];
    if( ts != nil )
    {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
        NSArray * rawData = [[NSArray alloc]initWithContentsOfFile:filePath];
        int count = [ rawData count];
        for( int i = 0; i < count; i++ )
        {
            NSDictionary * o = [ rawData objectAtIndex:i ];
            
            NSString * user = [ o valueForKey:@"user" ];
            NSString * text = [ o valueForKey:@"text" ];
            NSString * date = [ o valueForKey:@"date" ];
            
            
            
            
            Tweet * tweet = [ Tweet newTweetWithUser:user text:text date:date ];
            
            [ ts->tweetsList addObject:tweet ];
            
        }

        
    }
    return ts;
}


-( void) reverse
{
    int i = 0;
    int j = [ self->tweetsList count]-1;
    
    while( i < j )
    {
        [ self->tweetsList exchangeObjectAtIndex:i withObjectAtIndex:j ];
        i++;
        j--;
    }
    
}

-( id ) init
{
    self = [ super init ];
    if( self != nil )
    {
        self->tweetsList = [[ NSMutableArray  alloc  ] init ];
        self->tweetsMap = [[ NSMutableDictionary alloc] init ];
    }
    return self;
}


-( BOOL ) addTweet: ( Tweet * ) t
{
    NSString * key = [ t key ];
    Tweet * existing = [tweetsMap objectForKey:key ];
    if( existing == nil)
    {
        [ tweetsMap setObject:t forKey:key ];
        [ tweetsList addObject:t ];
        return YES;
    }
    return NO;
}

- ( Tweet * ) getTweetAtKey:( NSString * ) key
{
    return [ tweetsMap objectForKey:key   ];
}

- ( Tweet * ) getTweetAtUser:( NSString * ) userName andDate:( NSString * ) date
{
    NSString * key = [ Tweet keyByUser:userName andDate:date];
    return [ self getTweetAtKey:key ];
}

- ( Tweet * ) getTweetAtIndex:(int)index
{
    Tweet * t = [ tweetsList objectAtIndex:index ];
    return t;
}

- ( int ) count
{
    int c = [ tweetsList count ];
    return c;
}
@end
