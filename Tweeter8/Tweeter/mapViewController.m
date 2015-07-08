//
//  mapViewController.m
//  Tweeter
//
//  Created by Alexandros Kontogiorgos-Heintz on 3/28/14.
//  Copyright (c) 2014 home. All rights reserved.
//

#import "mapViewController.h"
#import "AppDelegate.h"

@interface mapViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation mapViewController
{
    AppModel * appModel;
    NSMutableDictionary * personMap;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    AppDelegate * ad = [ [ UIApplication sharedApplication ] delegate ];
    self->appModel = [ ad mainModel ];
    [ self->appModel addDataUser:self];
    [ self->appModel refresh ];
    [ self dataLoaded ];
    self->personMap = [[NSMutableDictionary alloc] init];
    [ self.mapView setDelegate: self ];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-( void ) dataLoaded
{
    int count = [ self->appModel usersCount ];
    for( int i = 0; i < count; i++ )
    {
        Person * p = [ self->appModel getUserAtIndex: i ];
        
        
        NSString * userName = p.screenName;
        if( [ self->personMap  objectForKey:userName ] != nil )
        {
            continue;
        }
        
        if( p.placeMark == nil )
        {
            continue;
        }
        CLLocationCoordinate2D c = p.placeMark.location.coordinate;
        NSString * title = p.screenName;
        
        UserAnnot * annot = [ [ UserAnnot alloc] initWithCoordinate:c title:title ];
        
        [ self.mapView addAnnotation:annot  ];
        
        [ self->personMap setObject:p  forKey:userName ];
    }
    
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation {
    
    if([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    static NSString *identifier = @"myAnnotation";
    MKPinAnnotationView * annotationView = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView)
    {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.pinColor = MKPinAnnotationColorPurple;
        annotationView.animatesDrop = YES;
        annotationView.canShowCallout = YES;
    }else {
        annotationView.annotation = annotation;
    }
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return annotationView;
}

-( void ) dataLoadedStarted
{
    
}

@end

@implementation UserAnnot

-( id ) initWithCoordinate:( CLLocationCoordinate2D ) coordinate title: ( NSString * ) title

{
    if( self = [ super init ])
    {
        self.coordinate = coordinate;
        self.title = title;
    }
    return self;
}

@end






