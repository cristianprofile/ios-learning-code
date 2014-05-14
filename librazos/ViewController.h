//
//  ViewController.h
//  librazos
//
//  Created by mariano on 11/05/14.
//  Copyright (c) 2014 cristianTestin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InformacionViewController.h"
#import "LibroFenomenal.h"
#import "NuevoLibroViewController.h"


@interface ViewController : UITableViewController<NuevoLibroViewControllerDelegate>
@property NSMutableArray *libros;
@property NSArray *searchResults;
@property LibroFenomenal *libroSeleccionado;





@end
