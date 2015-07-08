//
//  mapViewController.h
//  Tweeter
//
//  Created by Alexandros Kontogiorgos-Heintz on 3/28/14.
//  Copyright (c) 2014 home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "AppModel.h"

@interface mapViewController : UIViewController <MKMapViewDelegate, DataUser>



@end

@interface UserAnnot : NSObject< MKAnnotation >

@property ( copy, nonatomic ) NSString * title;
@property ( nonatomic, assign ) CLLocationCoordinate2D coordinate;

-( id ) initWithCoordinate:( CLLocationCoordinate2D ) coordinate title: ( NSString * ) title;

@end
