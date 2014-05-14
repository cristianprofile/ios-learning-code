//
//  InformacionViewController.h
//  librazos
//
//  Created by mariano on 11/05/14.
//  Copyright (c) 2014 cristianTestin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibroFenomenal.h"

@interface InformacionViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *nombre;
@property (weak, nonatomic) IBOutlet UILabel *autor;

@property (weak, nonatomic) IBOutlet UILabel *fechaPub;
@property (weak, nonatomic) IBOutlet UILabel *genero;

@property (weak, nonatomic) IBOutlet UIImageView *portada;

@property LibroFenomenal *libroSeleccionado;
@property (weak, nonatomic) IBOutlet UITextView *argumento;




- (IBAction)compartirBoton:(id)sender;



@end
