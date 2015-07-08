//
//  Person.m
//  T2
//
//  Created by Alexandros Kontogiorgos-Heintz on 3/13/14.
//  Copyright (c) 2014 Alexandros Kontogiorgos-Heintz. All rights reserved.
//

#import "Person.h"

@implementation Person

+ ( Person * ) newPersonWithName:( NSString *) name screenName:(NSString * )sn photo:( NSString * ) photo address: (NSString * ) address
{
    Person * p = [[Person alloc ] initWithName:name screenName:sn photo:photo address:address];
    return p;
}

-( id ) initWithName:( NSString * ) myName screenName:(NSString * )sn  photo:( NSString * ) myPhoto address: (NSString * ) address
{
    self = [ self init ];
    if( self != nil )
    {
        self.name = myName;
        self.sortName = [ sn capitalizedString ];
        self.screenName = [NSString stringWithFormat:@"@%@", sn ];
        self.photo = myPhoto;
        NSURL* aURL = [NSURL URLWithString:self.photo];
        NSData* data = [[NSData alloc] initWithContentsOfURL:aURL];
        self.image = [UIImage imageWithData:data];
        self.address = address;
    }
    return  self;
}

- ( NSString * ) description
{
    return [ NSString stringWithFormat:@"name: %@, photo: %@", self.name, self.photo ];
}


@end
