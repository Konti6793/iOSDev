//
//  Locator.m
//  Tweeter
//
//  Created by Tasos Kontogiorgos on 3/30/14.
//  Copyright (c) 2014 home. All rights reserved.
//

#import "Locator.h"
#import "CoreLocation/CoreLocation.h"
#import "Person.h"

@implementation Locator



- ( void ) completion: ( CLPlacemark * ) placemark forPerson: ( Person * ) person
{
    person.placeMark = placemark;
}


- ( void ) processPerson: ( Person * ) person
{
    CLGeocoder * geocoder = [ [ CLGeocoder alloc ] init ];
    [geocoder geocodeAddressString:person.address completionHandler:^(NSArray *placemarks, NSError *error) {
        //[ geocoder release ];
        //NSLog(@"ERROR - %@", error);
        if ([placemarks count] > 0)
        {
            //NSLog(@"--------------- > %d", [placemarks count]);
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            [ self completion:placemark forPerson:person ];
            
        } else {
                //NSLog( @"No Area of Interest Was Found" );
        }
    }];

}


@end
