//
//  Persons.m
//  T2
//
//  Created by Alexandros Kontogiorgos-Heintz on 3/13/14.
//  Copyright (c) 2014 Alexandros Kontogiorgos-Heintz. All rights reserved.
//

#import "Persons.h"
#import "Person.h"

@implementation Persons
{
    NSMutableArray * personsList;
    NSMutableDictionary * personsMap;
}


+( Persons *) createFromPlist:(NSString *)fileName
{
    Persons * p = [[ Persons alloc] init ];
    if( p != nil)
    {
        p->personsList = [ [ NSMutableArray alloc ] init ];
        p->personsMap = [[ NSMutableDictionary alloc ] init ];
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
        NSArray * rawData = [[NSArray alloc]initWithContentsOfFile:filePath];
        int count = [ rawData count];
        for( int i = 0; i < count; i++ )
        {
            NSDictionary * o = [ rawData objectAtIndex:i ];
            
            NSString * userName = [ o valueForKey:@"user" ];
            NSString * photo = [ o valueForKey:@"photo" ];
            
            
            Person * person = [ Person newPersonWithName:userName screenName:@"unknown" photo:photo ];
            
            [ p->personsList addObject:person ];
            [ p->personsMap  setObject:person forKey:userName ];
            
        }
    }
    return p;
}
- ( void )     sortBySortNameAscending: (BOOL ) isAsc
{
    [ self sortBy:@"sortName" ascending:isAsc ];
}

- ( void ) sortBy: ( NSString * ) member ascending:( BOOL ) isAsc
{
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:member ascending:isAsc ];
    [ personsList sortUsingDescriptors:[ NSArray arrayWithObject:sortDescriptor ]];
}

- ( BOOL ) addUnknownPerson: ( Person * ) p
{
    Person * existing = [ self getPersonAtName: p.name ];
    if( existing == nil )
    {
        [ personsMap setObject:p  forKey:p.name];
        [ personsList addObject:p ];
        return YES;
    }
    return NO;
}

-( id ) init
{
    self = [ super init ];
    if( self != nil )
    {
        self->personsList = [ [ NSMutableArray alloc ] init ];
        self->personsMap = [[ NSMutableDictionary alloc ] init ];
    }
    return self;
}

-( Person * ) getPersonAtIndex:(int)index
{
    Person * p = [ personsList objectAtIndex:index ];
    return p;
}

- ( Person * ) getPersonAtName:(NSString *)name
{
    Person * p = [ personsMap objectForKey:name ];
    return p;
}

- (int)count
{
    int c = [ personsList count ];
    return  c;
}

@end
