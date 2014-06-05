//
//  InformacionViewController.m
//  librazos
//
//  Created by mariano on 11/05/14.
//  Copyright (c) 2014 cristianTestin. All rights reserved.
//

#import "InformacionViewController.h"

@implementation InformacionViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.nombre.text = self.libroSeleccionado.nombre;
    self.autor.text = self.libroSeleccionado.autor;
    self.fechaPub.text = self.libroSeleccionado.publicado;
    self.genero.text = self.libroSeleccionado.genero;
    self.argumento.text= self.libroSeleccionado.argumento;
    
    self.portada.image = self.libroSeleccionado.portada;
    
    
    //round corners
    self.portada.layer.cornerRadius = 10.0;
    self.portada.layer.masksToBounds = YES;
    self.portada.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.portada.layer.borderWidth = 1.0;
    
}


//- (IBAction)atrasBoton:(id)sender {
  //  [self dismissViewControllerAnimated:YES completion:nil];
//}

- (IBAction)compartirBoton:(id)sender {
    NSString *textoPorCompartir = [NSString stringWithFormat:@"¡Mira este fenomenal libro llamado %@! #DesarrollarAppsEsFenomenal", _libroSeleccionado.nombre];
    NSArray *cosasPorCompartir  = @[textoPorCompartir, _libroSeleccionado.portada];
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:cosasPorCompartir applicationActivities:nil];
    [self presentViewController:activityViewController animated:YES completion:nil];
}
@end
