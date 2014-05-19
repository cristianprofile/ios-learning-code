//
//  NuevoLibroViewController.h
//  librazos
//
//  Created by mariano on 11/05/14.
//  Copyright (c) 2014 cristianTestin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibroFenomenal.h"



//*******************************************************************************

@interface NuevoLibroViewController :UIViewController <UIImagePickerControllerDelegate>


@property (weak, nonatomic) IBOutlet UITextField *titulo;
@property (weak, nonatomic) IBOutlet UITextField *autor;

@property (weak, nonatomic) IBOutlet UITextField *fecha;

@property (weak, nonatomic) IBOutlet UITextField *genero;

@property (weak, nonatomic) IBOutlet UITextView *argumento;
@property (weak, nonatomic) IBOutlet UIImageView *foto;

//delegate method

@property NSMutableArray *libros;


- (IBAction)anadirImagen:(id)sender;
-(IBAction)textFieldReturn:(id)sender;

@end
