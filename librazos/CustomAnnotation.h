//
//  CustomAnnotation.h
//  librazos
//
//  Created by mariano on 15/05/14.
//  Copyright (c) 2014 cristianTestin. All rights reserved.
//

#import <Foundation/Foundation.h>
// Importamos el framework
#import <MapKit/MapKit.h>

@interface CustomAnnotation : NSObject  <MKAnnotation> {
    
    // Creamos un título
    NSString *title;
    // Declaramos un subtítulo
    NSString *subtitle;
    // Y una coordenada
    CLLocationCoordinate2D coordinate;
    
}
// Definimos sus propiedades
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

// Y el método de inicialización
- (id)initWithTitle:(NSString *)aTitle subtitle:(NSString*)aSubtitle andCoordinate:(CLLocationCoordinate2D)coord;

@end
