//
//  NuevoLibroViewController.h
//  librazos
//
//  Created by mariano on 11/05/14.
//  Copyright (c) 2014 cristianTestin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibroFenomenal.h"


//delegate method to add new book
@class NuevoLibroViewController;

//estos son mis metodos delegados
@protocol NuevoLibroViewControllerDelegate <NSObject>

-(void)nuevoLibroViewController:(NuevoLibroViewController *)controller haCreadoLibro:(LibroFenomenal *)nuevoLibro;

@end

//*******************************************************************************

@interface NuevoLibroViewController :UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>



@property (weak, nonatomic) IBOutlet UITextField *titulo;
@property (weak, nonatomic) IBOutlet UITextField *autor;

@property (weak, nonatomic) IBOutlet UITextField *fecha;

@property (weak, nonatomic) IBOutlet UITextField *genero;

@property (weak, nonatomic) IBOutlet UITextView *argumento;
@property (weak, nonatomic) IBOutlet UIImageView *foto;

//delegate method
@property (weak, nonatomic) id <NuevoLibroViewControllerDelegate> delegate;
@property NSMutableArray *libros;


- (IBAction)anadirImagen:(id)sender;
- (IBAction)anadirLibro:(id)sender;

-(IBAction)textFieldReturn:(id)sender;

@end
