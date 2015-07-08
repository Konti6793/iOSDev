//
//  ViewController.m
//  Tweeter
//
//  Created by Tasos Kontogiorgos on 3/15/14.
//  Copyright (c) 2014 home. All rights reserved.
//

#import "ViewController.h"
#import "AppModel.h"

@interface ViewController ()

@end

@implementation ViewController
{
    AppModel * model;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self->model = [[AppModel alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
