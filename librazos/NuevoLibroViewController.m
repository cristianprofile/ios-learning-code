//
//  NuevoLibroViewController.m
//  librazos
//
//  Created by mariano on 11/05/14.
//  Copyright (c) 2014 cristianTestin. All rights reserved.
//

#import "NuevoLibroViewController.h"

@implementation NuevoLibroViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

    
    
    //round corners
    self.foto.layer.cornerRadius = 10.0;
    self.foto.layer.masksToBounds = YES;
    self.foto.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.foto.layer.borderWidth = 1.0;
    
}



- (IBAction)anadirImagen:(id)sender {
    UIAlertView *alertaRoja=[[UIAlertView alloc] initWithTitle:@"Liberia" message:@"Libro creado correctamente!" delegate:self cancelButtonTitle:@"Cancelar"  otherButtonTitles: @"Camera",@"Galeria" ,nil];
    [alertaRoja show];

    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    if (buttonIndex==1)
        [imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
    else
        if (buttonIndex==2)
            [imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    if ((buttonIndex==1) || (buttonIndex==2))
         [self presentViewController:imagePickerController animated:YES completion:nil];
}





- (IBAction)anadirLibro:(id)sender {
    
    LibroFenomenal *nuevoLibro = [[LibroFenomenal alloc] init];
    nuevoLibro.nombre = self.titulo.text;
    nuevoLibro.autor = self.autor.text;
    nuevoLibro.publicado = self.fecha.text;
    nuevoLibro.genero = self.genero.text;
    nuevoLibro.argumento = self.argumento.text;
    nuevoLibro.portada = self.foto.image;
    [self.delegate nuevoLibroViewController:self haCreadoLibro:nuevoLibro];
   
    NSLog(@"holaaaaa");
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [picker dismissViewControllerAnimated:YES completion:^{
        self.foto.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }];
 }






//hidden keyboard when  push done button
-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

//hidden keyboard after touch outside uitexfiled
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}



@end
