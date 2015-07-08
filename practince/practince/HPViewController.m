//
//  HPViewController.m
//  practince
//
//  Created by Alexandros Kontogiorgos-Heintz on 2/23/14.
//  Copyright (c) 2014 Alexandros Kontogiorgos-Heintz. All rights reserved.
//

#import "HPViewController.h"
#import "HPFirstViewController.h"

@interface HPViewController ()

@end

@implementation HPViewController

- (void)viewDidLoad
{
   
    [super viewDidLoad];
    
    self.title = @"Initial";
    
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)goFirst:(id)sender {
    HPFirstViewController *fView = [[HPFirstViewController alloc] initWithNibName: @"HPFirstViewController" bundle:nil];
    
    [self.navigationController pushViewController: fView animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
