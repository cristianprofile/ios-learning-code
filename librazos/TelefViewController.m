//
//  TelefViewController.m
//  librazos
//
//  Created by mariano on 14/05/14.
//  Copyright (c) 2014 cristianTestin. All rights reserved.
//

#import "TelefViewController.h"

@interface TelefViewController ()

@end

@implementation TelefViewController

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


- (IBAction)unwindToTelef:(UIStoryboardSegue *)unwindSegue;
{
    UIViewController *modalGoingAway = unwindSegue.sourceViewController;

    // string1 is "A string: string, a float: 31415.93"
    
    NSNumber *number = @1234;
    NSDictionary *dictionary = @{@"date": [NSDate date]};
    NSString *baseString = @"Base string.";
    NSString *string2 = [baseString stringByAppendingFormat:
                         @" A number: %@, a dictionary: %@", number, dictionary];
    // string2 is "Base string. A number: 1234, a dictionary: {date = 2005-10-17 09:02:01 -0700; }"

    // Do something (like get data) from modalGoingAway if you need to...
    NSLog(@"pasa por unwind %@",string2);
    NSLog(@"pasa por unwind y viene del controlador %@",modalGoingAway);
}



- (IBAction)llamarTelefono:(id)sender {
    
    NSString *baseStringTelephoneCall = @"telprompt://+";
    NSString *numberToCall = [baseStringTelephoneCall stringByAppendingFormat:
                         @"%@", self.numero.text];
    
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:numberToCall]];
    
    
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
