//
//  CustomAnnotation.m
//  librazos
//
//  Created by mariano on 15/05/14.
//  Copyright (c) 2014 cristianTestin. All rights reserved.
//

#import "CustomAnnotation.h"

@implementation CustomAnnotation


@synthesize title, subtitle, coordinate,route;

// Implementamos el método de inicialización del objeto.
- (id)initWithTitle:(NSString *)aTitle subtitle:(NSString*)aSubtitle andCoordinate:(CLLocationCoordinate2D)coord
{
	self = [super init];
	title = aTitle;
    subtitle = aSubtitle;
	coordinate = coord;
	return self;
    
    
    
}

@end
