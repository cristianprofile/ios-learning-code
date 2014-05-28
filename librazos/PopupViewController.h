//
//  PopupViewController.h
//  librazos
//
//  Created by mariano on 14/05/14.
//  Copyright (c) 2014 cristianTestin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>


@interface PopupViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>



@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControle;

- (IBAction)segmentValueChage:(id)sender;


@end
