//
//  RutillaViewController.m
//  librazos
//
//  Created by mariano on 17/05/14.
//  Copyright (c) 2014 cristianTestin. All rights reserved.
//

#import "RutillaViewController.h"

@interface RutillaViewController ()

@end

@implementation RutillaViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)verRuta:(id)sender {
    
    NSDictionary *address = @{
                              (NSString *)kABPersonAddressStreetKey: self.calle.text,
                              (NSString *)kABPersonAddressCityKey: self.ciudad.text,
                              (NSString *)kABPersonAddressStateKey: self.pais.text,
                              (NSString *)kABPersonAddressZIPKey: self.codigoPostal.text
                              };
    
    CLLocationCoordinate2D initialLocation;
    initialLocation.latitude = 40.33468913769062;
    initialLocation.longitude= -3.7497285227539123;
    MKPlacemark *place = [[MKPlacemark alloc]
                          initWithCoordinate:initialLocation
                          addressDictionary:address];
    
    MKMapItem *mapItem =
    [[MKMapItem alloc]initWithPlacemark:place];
    
    NSDictionary *options = @{
                              MKLaunchOptionsDirectionsModeKey:
                                  MKLaunchOptionsDirectionsModeDriving
                              };
    
    [mapItem openInMapsWithLaunchOptions:@{MKLaunchOptionsDirectionsModeKey  : MKLaunchOptionsDirectionsModeDriving}];
}

//hidden keyboard after touch outside uitexfiled
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}
@end
