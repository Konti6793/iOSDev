//
//  HPFirstViewController.m
//  practince
//
//  Created by Alexandros Kontogiorgos-Heintz on 2/23/14.
//  Copyright (c) 2014 Alexandros Kontogiorgos-Heintz. All rights reserved.
//

#import "HPFirstViewController.h"
#import "HPSecondViewController.h"


@interface HPFirstViewController ()

@end

@implementation HPFirstViewController

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
    
    self.title = @"First";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)goSecond:(id)sender {
    HPSecondViewController *fView = [[HPSecondViewController alloc] initWithNibName: @"HPSecondViewController" bundle:nil];
    
    [self.navigationController pushViewController: fView animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
