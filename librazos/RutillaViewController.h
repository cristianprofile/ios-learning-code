//
//  RutillaViewController.h
//  librazos
//
//  Created by mariano on 17/05/14.
//  Copyright (c) 2014 cristianTestin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>

@interface RutillaViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *calle;
@property (weak, nonatomic) IBOutlet UITextField *ciudad;
@property (weak, nonatomic) IBOutlet UITextField *pais;
@property (weak, nonatomic) IBOutlet UITextField *codigoPostal;

- (IBAction)verRuta:(id)sender;

@end
