//
//  Tweet.m
//  T2
//
//  Created by Alexandros Kontogiorgos-Heintz on 3/13/14.
//  Copyright (c) 2014 Alexandros Kontogiorgos-Heintz. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

+ ( NSDate * ) dateOf: ( NSString * )str
{
    NSArray * tokens = [ str componentsSeparatedByString:@" "];
    int month = 1;
    NSString * monthstr = [ tokens objectAtIndex:1];
    if( [ monthstr isEqualToString:@"Feb"])
    {
        month = 2;
    } else
        if( [ monthstr isEqualToString:@"Mar"])
        {
            month = 3;
        } else
            if( [ monthstr isEqualToString:@"Apr"])
            {
                month = 4;
            } else
                if( [ monthstr isEqualToString:@"May"])
                {
                    month = 5;
                } else
                    if( [ monthstr isEqualToString:@"Jun"])
                    {
                        month = 6;
                    } else
                        if( [ monthstr isEqualToString:@"Jul"])
                        {
                            month = 7;
                        } else
                            if( [ monthstr isEqualToString:@"Aug"])
                            {
                                month = 8;
                            } else
                                if( [ monthstr isEqualToString:@"Sep"])
                                {
                                    month = 9;
                                } else
                                    if( [ monthstr isEqualToString:@"Oct"])
                                    {
                                        month = 10;
                                    } else
                                        if( [ monthstr isEqualToString:@"Nov"])
                                        {
                                            month = 11;
                                        } else
                                            if( [ monthstr isEqualToString:@"Dec"])
                                            {
                                                month = 12;
                                            }
    
    
    NSString * dayStr = [ tokens objectAtIndex:2];
    int day = [ dayStr intValue ];
    NSString * yearStr = [ tokens objectAtIndex:5];
    int year = [ yearStr intValue ];
    
    NSString * timeStr = [ tokens objectAtIndex:3 ];
    NSArray * timeTokens =  [ timeStr componentsSeparatedByString:@":"];
    
    NSString * hourStr = [ timeTokens objectAtIndex:0];
    int hour = [ hourStr intValue ];
    NSString * minuteStr = [ timeTokens objectAtIndex:1];
    int minute = [ minuteStr intValue ];
    NSString * secStr = [ timeTokens objectAtIndex:2];
    int sec = [ secStr intValue ];
    
    
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    
    [components setDay:day];
    [components setHour:hour];
    [components setMinute:minute];
    [components setSecond:sec];
    
    
    
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

+ ( Tweet * ) newTweetWithUser:( NSString *) user text:( NSString * ) text date:( NSString * ) date;
{
    Tweet * p = [[Tweet alloc] initWithUser:user text:text date:date];
    return p;
}

- ( id ) initWithUser:( NSString *) user text:( NSString * ) text date:( NSString * ) date;
{
    self = [ self init ];
    if( self != nil )
    {
        self.user = user;
        self.text = text;
        self.date = date;
        self.nsdate = [ Tweet dateOf:self.date ];
    }
    return  self;
}

- ( NSString * ) description
{
    return [ NSString stringWithFormat:@"user: %@, text: %@ date:%@", self.user, self.text, self.date ];
}


+ ( NSString * ) keyByUser:( NSString *) userName andDate: ( NSString *) date;
{
    return [ NSString stringWithFormat:@"%@::%@", userName, date ];
}

- ( NSString * ) key
{
    return [ Tweet keyByUser:self.user andDate: self.date ];
}

- ( NSString * ) embededUrl
{
    NSString *tweet = self.text;   // assume already initialized to hold tweet
    NSRange r;
    NSString *regEx = @"http://\\S*";
    r = [tweet rangeOfString:regEx options:NSRegularExpressionSearch];
    NSString *url = nil;
    if (r.location != NSNotFound) {
        // URL was found
        url = [tweet substringWithRange:r];
        if( [ url characterAtIndex:[ url length ]-1] == 0x2026 ) // URL ends in ellipsis ( ... ) 0x2026 is the code
        {
            url = nil;
        }
    } else {
        // no URL was found
    }
    return url;
}


@end
