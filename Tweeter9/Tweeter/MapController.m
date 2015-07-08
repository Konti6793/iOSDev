//
//  MapController.m
//  Tweeter
//
//  Created by Tasos Kontogiorgos on 3/29/14.
//  Copyright (c) 2014 home. All rights reserved.
//

#import "MapController.h"
#import "AppDelegate.h"




@interface MapController ()
//@property (weak, nonatomic) IBOutlet MKMapView *theMap;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapController
{
    AppModel * appModel;
    NSMutableDictionary * personsMap;
}

-( void ) dataLoaded
{
    int count = [ self->appModel usersCount ];
    for( int i = 0; i < count; i++ )
    {
        Person * p = [ self->appModel getUserAtIndex: i ];
        
        NSString * userName = p.screenName;
        if( [ self->personsMap  objectForKey:userName ] != nil )
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
        
        [ self->personsMap setObject:p  forKey:userName ];
    }
    
}

//6
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation {
    //7
    if([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    //8
    static NSString *identifier = @"myAnnotation";
    MKPinAnnotationView * annotationView = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView)
    {
        //9
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

-( void ) dataLoadStarted
{
    
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
    [ self dataLoaded ];
    
    [ self.mapView setDelegate: self ];
    self->personsMap = [[ NSMutableDictionary alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

