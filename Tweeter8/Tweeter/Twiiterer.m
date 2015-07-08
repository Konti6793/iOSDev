//
//  Twiiterer.m
//  TT2
//
//  Created by Alexandros Kontogiorgos-Heintz on 3/13/14.
//  Copyright (c) 2014 Alexandros Kontogiorgos-Heintz. All rights reserved.
//

#import "Twiiterer.h"
#import <Accounts/Accounts.h>
#import <Accounts/ACAccountType.h>
#import <Accounts/ACAccountStore.h>
#import <Social/SLRequest.h>

@implementation Twiiterer
{
    //ACAccount *                     account;
    ACAccountType *                 aType;
    ACAccountStore *                aStore;
    NSArray *                       dataSource;
    NSObject< DataListener > *      listener;
    ACAccount *                     twitterAccount;
}


+( NSString * ) getUserName: ( NSDictionary * ) raw
{
    NSDictionary * user =  [ raw objectForKey:@"user"];
    return [ user objectForKey:@"name"];
}

+( NSString * ) getUserScreenName: ( NSDictionary * ) raw
{
    NSDictionary * user =  [ raw objectForKey:@"user"];
    return [ user objectForKey:@"screen_name"];
}

+( NSString * ) getUserText: ( NSDictionary * ) raw
{
    return [ raw objectForKey:@"text"];
}

+( NSString * ) getTweetDate: ( NSDictionary * ) raw
{
    return [ raw objectForKey:@"created_at"];
}

+( NSString * ) getUserImageUrl: ( NSDictionary * ) raw
{
    NSDictionary * user =  [ raw objectForKey:@"user"];
    return [ user objectForKey:@"profile_image_url"];
}

+( NSString * ) getUserLocation:(NSDictionary *) raw
{
    NSDictionary * user =  [ raw objectForKey:@"user"];
    return [ user objectForKey:@"location"];
}


-( void ) completion:( BOOL ) granted error: ( NSError * ) err
{
    if( granted == NO )
    {
        NSLog(@"Error: %@", err );
        return;
    }
    
    NSArray *arrayOfAccounts = [ aStore accountsWithAccountType:aType];
    if( [ arrayOfAccounts count ] <= 0 )
    {
        NSLog(@"Error: Can't get any twiiter accounts ");
        return;
    }
    twitterAccount = [arrayOfAccounts lastObject];
}


-( void ) execWithCount:( int) count
{
    [ self->listener didStart ];
    NSURL *requestURL = [NSURL URLWithString:@"https://api.twitter.com/1/statuses/home_timeline.json"];
    
    NSString * countStr = [ NSString stringWithFormat:@"%d", count ];
    
    NSMutableDictionary *parameters =
    [[NSMutableDictionary alloc] init];
    [parameters setObject:countStr forKey:@"count"];
    [parameters setObject:@"1" forKey:@"include_entities"];
    
    

    SLRequest *postRequest = [SLRequest
                              requestForServiceType:SLServiceTypeTwitter
                              requestMethod:SLRequestMethodGET
                              URL:requestURL parameters:parameters];

    postRequest.account = twitterAccount;
    
    [postRequest performRequestWithHandler:
     ^(NSData *responseData, NSHTTPURLResponse * urlResponse, NSError * error)
     {
         [ self requestHandler:responseData responce:urlResponse error:error];
     }];
    
}

-( void ) sendTeet: (NSString*) message
{
    NSURL *requestURL = [NSURL URLWithString:@"https://api.twitter.com/1/statuses/update.json"];
    NSString * msg = [ NSString stringWithFormat:@"Prog test : %@", message ];
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:msg forKey:@"status"];
    
    SLRequest *postRequest = [SLRequest
                              requestForServiceType:SLServiceTypeTwitter
                              requestMethod:SLRequestMethodPOST
                              URL:requestURL parameters:parameters];
    
    postRequest.account = twitterAccount;
    
    [postRequest performRequestWithHandler:
     ^(NSData *responseData, NSHTTPURLResponse * urlResponse, NSError * error)
     {
         [ self requestHandlerPost:responseData responce:urlResponse error:error];
     }];
}

-( void ) requestHandler:( NSData * )data responce: ( NSHTTPURLResponse * ) resp error: ( NSError * ) err
{
    self->dataSource = [ NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&err];
    if (self->dataSource.count != 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            //NSLog( @"Count = %d Data Source --- %@", self->dataSource.count, nil ); //self->dataSource );
            
            [ self->listener receive:self->dataSource ];
        });
    }
}

-( void ) requestHandlerPost:( NSData * )data responce: ( NSHTTPURLResponse * ) resp error: ( NSError * ) err
{
    self->dataSource = [ NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&err];
    if (self->dataSource.count != 0)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog( @"Count = %d Data Source --- %@", self->dataSource.count, self->dataSource );
        });
    }
}

-( id ) initWithListener: ( NSObject< DataListener > * ) l;
{
    if( self = [ super init ])
    {
        listener = l;
        aStore = [[ ACAccountStore alloc ] init ];
        aType = [ aStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        [ aStore requestAccessToAccountsWithType:aType options:nil completion:^(BOOL granted, NSError *error) {
            [ self completion:granted error: error];
        }];
    }
    return self;
}

@end
