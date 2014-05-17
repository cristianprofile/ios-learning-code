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




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.posicionInical=FALSE;
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
                                                                     subtitle: [NSString stringWithFormat:@"Has pinchado en la anotación %d",i]
                                                                andCoordinate:newCoord];
        // Y la insertamos en el mapa
        [self.map addAnnotation:annotation];
        
        
        
    }
  
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    
    return aView;
    
    
    
}



- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    
        if (self.posicion.latitude==0 && self.posicion.longitude==0)
        {
            self.posicion=[userLocation coordinate];
            self.posicionInical=TRUE;
           
        }


    
        CLLocationCoordinate2D currentLocation=[userLocation coordinate];
        //solo  lo actualizo si hemos cambiado de la latitud
        if  (self.posicion.latitude==currentLocation.latitude && self.posicion.longitude==currentLocation.longitude && self.posicionInical)
        {
            NSLog(@"pasa por actualizar la animacion");
            MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(currentLocation, 4000, 4000);
            [self.map setRegion:region animated:YES];
            
    }
    
}




@end
