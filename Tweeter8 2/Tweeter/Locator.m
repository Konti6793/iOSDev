//
//  Locator.m
//  Tweeter
//
//  Created by Alexandros Kontogiorgos-Heintz on 3/30/14.
//  Copyright (c) 2014 home. All rights reserved.
//

#import "Locator.h"
#import <CoreLocation/CoreLocation.h>
#import "Person.h"

@implementation Locator

-( void ) processPerson: ( Person * ) p
{
    NSLog(@"%@,%@", p.address, p.screenName);
    CLGeocoder * geocode = [[CLGeocoder alloc] init];
    [geocode geocodeAddressString:p.address completionHandler:^(NSArray *placemarks, NSError *error) {
        
        int count = [placemarks count];
        
        if (count > 0) {
            CLPlacemark * plMark = [placemarks objectAtIndex:0];
            p.placeMark = plMark;
        }
        
     }];
}

@end
