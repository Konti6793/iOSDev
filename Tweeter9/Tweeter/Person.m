//
//  Person.m
//  T2
//
//  Created by Tasos Kontogiorgos on 3/13/14.
//  Copyright (c) 2014 home. All rights reserved.
//

#import "Person.h"

@implementation Person

+ ( Person * ) newPersonWithName:( NSString *) name screenName:(NSString * )sn photo:( NSString * ) photo address:( NSString * ) address
{
    Person * p = [[Person alloc ] initWithName:name screenName:sn photo:photo address:address ];
    return p;
}

-( id ) initWithName:( NSString * ) myName screenName:(NSString * )sn  photo:( NSString * ) myPhoto address:( NSString * ) address
{
    self = [ self init ];
    if( self != nil )
    {
        self.name       = myName;
        self.address    = address;
        self.sortName   = [ sn capitalizedString ];
        self.screenName = [NSString stringWithFormat:@"@%@", sn ];
        self.photo      = myPhoto;
        NSURL* aURL     = [NSURL URLWithString:self.photo];
        NSData* data    = [[NSData alloc] initWithContentsOfURL:aURL];
        self.image      = [UIImage imageWithData:data];
    }
    return  self;
}

- ( NSString * ) description
{
    return [ NSString stringWithFormat:@"name: %@, photo: %@ loc: %@", self.name, self.photo, self.placeMark ];
}


@end
