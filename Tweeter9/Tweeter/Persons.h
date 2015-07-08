//
//  Persons.h
//  T2
//
//  Created by Tasos Kontogiorgos on 3/13/14.
//  Copyright (c) 2014 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


@interface Persons : NSObject


+ ( Persons * ) createFromPlist:( NSString * ) fileName;

- ( void )     sortBySortNameAscending: (BOOL ) isAsc;
- ( BOOL )     addUnknownPerson: ( Person * ) p;
- ( Person * ) getPersonAtIndex:( int ) index;
- ( Person * ) getPersonAtName:( NSString * )name;
- ( int ) count;

@end
