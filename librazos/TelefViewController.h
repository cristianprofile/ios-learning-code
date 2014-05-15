//
//  TelefViewController.h
//  librazos
//
//  Created by mariano on 14/05/14.
//  Copyright (c) 2014 cristianTestin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TelefViewController : UIViewController

- (IBAction)llamarTelefono:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *numero;

- (IBAction)unwindToTelef:(UIStoryboardSegue *)unwindSegue;


@end
