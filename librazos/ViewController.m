//
//  ViewController.m
//  librazos
//
//  Created by mariano on 11/05/14.
//  Copyright (c) 2014 cristianTestin. All rights reserved.
//

#import "ViewController.h"
#import "InformacionViewController.h"
#import "LibroFenomenal.h"
#import "CeldaFenomenal.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //hago un new del array
    self.libros = [[NSMutableArray alloc] init];
    
    LibroFenomenal *libro = [[LibroFenomenal alloc] init];
    
    libro.nombre = @"Jenkins el puto amo";
    libro.autor = @"Integrador continuo";
    libro.publicado = @"16-05";
    libro.genero = @"Parodia";
    libro.portada = [UIImage imageNamed:@"jenkins.jpeg"];
    libro.argumento = @"Esto es unos de los mejores libros de desarrollo de calidad para poder realizar aplicaciones de calidad y probadas";
    [self.libros addObject:libro];
    libro = [[LibroFenomenal alloc] init];
    libro.nombre = @"Spring rulez";
    libro.autor = @"Juan K. Hatin'";
    libro.publicado = @"20-13";
    libro.genero = @"Fantasía";
    libro.argumento = @"Sencilla el framework preferido para los que programamos en java .Una delicia de la ciencia, un monumetos a las buenas practicas para que puedas disfrutar de algo bien hecho, spring es tu referencia.";
    libro.portada = [UIImage imageNamed:@"spring.jpeg"];
    [self.libros addObject:libro];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CeldaFenomenal *celda = [tableView dequeueReusableCellWithIdentifier:@"CeldaFenomenal"];
    LibroFenomenal *libro = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        libro = [self.searchResults objectAtIndex:indexPath.row];
    } else {
        libro = [self.libros  objectAtIndex:indexPath.row];
    }
    if (celda==nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CeldaFenomenal" owner:self options:nil];
        celda = [nib objectAtIndex:0];
    }
    celda.nombre.text = libro.nombre;
    celda.autor.text = libro.autor;
    celda.imagen.image = libro.portada;
    
    celda.imagen.layer.cornerRadius = 10.0;
    celda.imagen.layer.masksToBounds = YES;
    celda.imagen.layer.borderColor = [UIColor lightGrayColor].CGColor;
    celda.imagen.layer.borderWidth = 1.0;
    
    
   
    
    
    return celda;
}





- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"nombre contains[c] %@", searchText];
    self.searchResults = [self.libros filteredArrayUsingPredicate:resultPredicate];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 71;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.searchResults count];
    } else {
        return [self.libros count];
    }
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //quito la seleccion de la celda
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //instanciar el otro formulario
    //InformacionViewController *informacionLibroViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"InformacionViewController"];
    
    //creo la barra de navegacion y la digo que se muestre
    //UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:informacionLibroViewController];
    
    self.libroSeleccionado = [self.libros objectAtIndex:indexPath.row];
    
    //[self presentViewController:navigationController animated:YES completion:nil];
    //[self performSegueWithIdentifier:@"segue2" sender:self];
    
    [self performSegueWithIdentifier:@"segueDetail" sender:self];

}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.libros removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segue"]) {
        NuevoLibroViewController *navigationController = (NuevoLibroViewController *)segue.destinationViewController;
        //navigationController.libros = self.libros;
        navigationController.delegate = self;
    }
    
    if ([segue.identifier isEqualToString:@"segueDetail"]) {
        

         InformacionViewController *navigationController = (InformacionViewController *)segue.destinationViewController;
        navigationController.libroSeleccionado = self.libroSeleccionado;
   

    }
    
    
}

-(void)nuevoLibroViewController:(NuevoLibroViewController *)controller haCreadoLibro:(LibroFenomenal *)nuevoLibro {
    NSUInteger nuevaFila = [self.libros count];
    [self.libros addObject:nuevoLibro];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:nuevaFila inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
    //create and objetct y le digo que se init
    UIAlertView *alertaRoja=[[UIAlertView alloc] initWithTitle:@"Liberia" message:@"Libro creado correctamente!" delegate:self cancelButtonTitle:@"Aceptar"  otherButtonTitles: nil];
    [alertaRoja show];

}








@end
