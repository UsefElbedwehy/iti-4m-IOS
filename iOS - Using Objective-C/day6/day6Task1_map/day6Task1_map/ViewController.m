//
//  ViewController.m
//  day6Task1_map
//
//  Created by Uef on 24/12/2024.
//

#import "ViewController.h"
#import "Annotation.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *myMapView;
@property Annotation * prevAnnotaion;
@property Annotation * currentAnnotaion;
@property CLLocation * currentLocation;
@property CLLocationCoordinate2D cccoordinate;

@property CLLocationManager * locManger;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [_myMapView setDelegate:self];
    
    _prevAnnotaion =  [Annotation new];
    _locManger = [CLLocationManager new];
    [_locManger setDesiredAccuracy:kCLLocationAccuracyBest];
    [_locManger setDistanceFilter:kCLHeadingFilterNone];
    [_locManger setDelegate:self];
    [_locManger requestWhenInUseAuthorization]; 
    [_locManger startUpdatingLocation];

    
}
- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    printf("Will Change\n");
}
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    printf("Did change\n");
}
- (void)mapView:(MKMapView *)mapView didSelectAnnotation:(id<MKAnnotation>)annotation{
    printf("Did select annotation\n");
}
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    
}
- (IBAction)addAnnotaion:(id)sender {
    
    //CGPOINT
    CGPoint touchPoint = [sender locationInView:self.myMapView];
    //COORDNATE
    CLLocationCoordinate2D touchLocation = [_myMapView convertPoint:touchPoint toCoordinateFromView:_myMapView];
    //ANNOTAION
    [_myMapView removeAnnotation:_prevAnnotaion];
    Annotation * annotaion = [Annotation new];
    
//    [_myMapView removeAnnotation:annotaion];
    annotaion.title = @"click";
    annotaion.subtitle = @"This is ur location.";
    annotaion.coordinate = touchLocation;
    
    //ADD ANNOTATION TO THE MAPVIEW
    _prevAnnotaion = annotaion;
    [_myMapView addAnnotation:annotaion];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *location = [locations lastObject];
    NSLog(@"lat%f - lon%f", location.coordinate.latitude, location.coordinate.longitude);
    _currentLocation = [locations lastObject];
    _cccoordinate = [[locations lastObject] coordinate];
    Annotation * currentAnnotaion1 = [Annotation new];
    currentAnnotaion1.title = @"current Location";
    currentAnnotaion1.subtitle = @"This is ur location.";
    currentAnnotaion1.coordinate = [[locations lastObject] coordinate];
    [_myMapView addAnnotation:currentAnnotaion1];
    //[_myMapView ];
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
}


@end
