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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)llamarTelefono:(id)sender {
    
       
    
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://+"]];
    
    
}
@end
