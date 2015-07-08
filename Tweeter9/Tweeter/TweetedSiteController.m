//
//  TweetedSiteController.m
//  Tweeter
//
//  Created by Tasos Kontogiorgos on 3/16/14.
//  Copyright (c) 2014 home. All rights reserved.
//

#import "TweetedSiteController.h"

@interface TweetedSiteController ()
@property (weak, nonatomic) IBOutlet UIWebView *web;

@end

@implementation TweetedSiteController

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
    
    
    NSURL* nsUrl = [NSURL URLWithString:self.url];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:nsUrl cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30];
    
    [self.web loadRequest:request];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)returnToRecents:(id)sender {
    
    [ self dismissViewControllerAnimated:YES completion:nil];
}

@end
