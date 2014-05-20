//
//  PopupViewController.m
//  librazos
//
//  Created by mariano on 14/05/14.
//  Copyright (c) 2014 cristianTestin. All rights reserved.
//

#import "PopupViewController.h"
#import "CustomAnnotation.h"

@interface PopupViewController ()

@end

@implementation PopupViewController

CLLocationManager *locationManager;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
   
    }
    return self;
}
 
- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
    //Creamos una coordenada inicial, en nuestro caso perteneciente a madrid.
    CLLocationCoordinate2D initialLocation;
    initialLocation.latitude = 40.33468913769062;
    initialLocation.longitude= -3.7497285227539123;
    
    
    
    // Generaremos 10 anotaciones, o las que definamos en el for.
    for(int i = 0; i < 10; i++) {
        
        // Calculamos una distancia aleatoria en latitud y longitud suficientemente corta para que se muestre en nuestra región.
        CGFloat latDelta = rand()*.035/RAND_MAX -.02;
        CGFloat longDelta = rand()*.03/RAND_MAX -.015;
        
        CGFloat newLat = initialLocation.latitude + latDelta;
        CGFloat newLon = initialLocation.longitude + longDelta;
        
        CLLocationCoordinate2D newCoord = {newLat, newLon};
        
        // Creamos la anotación
        CustomAnnotation *annotation = [[CustomAnnotation alloc]initWithTitle: @"Jenkins el amo"
                                                                     subtitle: [NSString stringWithFormat:@" pinchado anotación %d",i]
                                                                andCoordinate:newCoord];
        
        
        // Y la insertamos en el mapa
        [self.map addAnnotation:annotation];
        
        MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
        
        request.source = [MKMapItem mapItemForCurrentLocation];
        
       
        
        MKPlacemark *toPlacemark   = [[MKPlacemark alloc] initWithCoordinate:newCoord
                                                           addressDictionary:nil];
        
        MKMapItem *toItem           = [[MKMapItem alloc] initWithPlacemark:toPlacemark];

        request.destination = toItem;
        request.requestsAlternateRoutes = NO;
        MKDirections *directions =
        [[MKDirections alloc] initWithRequest:request];
        
        [directions calculateDirectionsWithCompletionHandler:
         ^(MKDirectionsResponse *response, NSError *error) {
             if (error) {
                 // Handle Error
             } else {
                 for (MKRoute *route in response.routes)
                 {
                     
                     float km= route.distance/1000;
                     NSInteger minutes = floor(route.expectedTravelTime/60);
                                                 
                     NSString *intervalString = [NSString stringWithFormat:@"%ld minutos - %.1f km", (long)minutes,km];
                     annotation.subtitle=intervalString;
                     //[self.map
                     //addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
                 }

                 
                 
                 //[self showRoute:response];
             }
         }];
        
        
    }
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];


}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
    
    //hago actualizar el zoom del mapa y paro la localización
    [self zoomToFitMapAnnotationsIosSeven:self.map];
    [locationManager stopUpdatingLocation];
    
   
}




//method to zoom map  with annotation in my map. It fits correct
- (void)zoomToFitMapAnnotationsIosSeven:(MKMapView *)mapView {
    if ([mapView.annotations count] == 0) return;
    
    [mapView showAnnotations:mapView.annotations animated:YES];
}






//Sobreescribimos el método para poder modificar elementos de la anotación como la imagen.
- (MKAnnotationView *) mapView: (MKMapView *) mapView viewForAnnotation: (id) annotation {
    
    CustomAnnotation *anotacion1 = (CustomAnnotation*)annotation;
    
    // Comprobamos si se trata de la anotación correspondiente al usuario.
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    
    MKAnnotationView *aView = [[MKAnnotationView alloc] initWithAnnotation:anotacion1 reuseIdentifier:@"pinView"];
    
    
    //\\-------------------------------------------------------------------------------///
    //Creo el nombre de la imagen
    //\\-------------------------------------------------------------------------------///
    NSString *icoName = @"jenkins.jpeg";
    
    
    //\\-------------------------------------------------------------------------------///
    // Configuramos la vista del mapa
    //\\-------------------------------------------------------------------------------///
    aView.canShowCallout = YES;
    aView.enabled = YES;
    aView.centerOffset = CGPointMake(0, -20);
    
    aView.draggable = YES;
    
    
    UIImage *imagen = [UIImage imageNamed:icoName];
    
    aView.image = imagen;
    
    
    
    //\\-------------------------------------------------------------------------------///
    // Establecemos el tamaño óptimo para el Pin
    //\\-------------------------------------------------------------------------------///
    CGRect frame = aView.frame;
    frame.size.width = 32;
    frame.size.height = 40;
    aView.frame = frame;
    
    
    
    //acceso para control de tap en la anotacion
    aView.canShowCallout = YES;
    aView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoLight];

    // Add an image to the left callout.
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icono_coche_gran-2.png"]];
    aView.leftCalloutAccessoryView = iconView;
    
    return aView;
    
    
    
}

-(void)showRoute:(MKDirectionsResponse *)response
{
    for (MKRoute *route in response.routes)
    {
        
        NSLog(@"%f",route.distance);
        NSLog(@"%f",route.expectedTravelTime);
        
        //[self.map
         //addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
    }
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id < MKOverlay >)overlay
{
    MKPolylineRenderer *renderer =
    [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    renderer.strokeColor = [UIColor blueColor];
    renderer.lineWidth = 5.0;
    return renderer;
}





- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    NSLog(@"pasandoooo por pinchado información");
    NSLog(@"pasandoooo");
 
    CustomAnnotation *anotacion1 = (CustomAnnotation*)view.annotation;
    NSLog(@"%@",anotacion1.title);
    NSLog(@"%@",anotacion1.description);
    NSLog(@"%f",anotacion1.coordinate.longitude);
    NSLog(@"%f",anotacion1.coordinate.latitude);
    MKMapItem *mapItemOrigen = [MKMapItem mapItemForCurrentLocation];
    NSLog(@"%@",mapItemOrigen.name);
    NSLog(@"%@",mapItemOrigen.description);
    
    CLLocationCoordinate2D initialLocation;
    initialLocation.latitude = anotacion1.coordinate.latitude;
    initialLocation.longitude= anotacion1.coordinate.longitude;
    
    NSLog(@"%f",anotacion1.coordinate.latitude);
    NSLog(@"%f",anotacion1.coordinate.longitude);
    
    MKPlacemark *place = [[MKPlacemark alloc]
                          initWithCoordinate:initialLocation
                          addressDictionary:nil];
    
    MKMapItem *mapItemDestino =
    [[MKMapItem alloc]initWithPlacemark:place];
    NSArray *mapItems = @[mapItemOrigen, mapItemDestino];
    
   [MKMapItem openMapsWithItems:mapItems launchOptions:@{MKLaunchOptionsDirectionsModeKey  : MKLaunchOptionsDirectionsModeDriving}];

}



@end
