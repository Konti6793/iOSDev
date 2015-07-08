//
//  TweetCreate.m
//  Tweeter
//
//  Created by Alexandros Kontogiorgos-Heintz on 3/29/14.
//  Copyright (c) 2014 home. All rights reserved.
//

#import "TweetCreate.h"
#import "AppModel.h"
#import "AppDelegate.h"

@interface TweetCreate ()

@property (weak, nonatomic) IBOutlet UITextView *textField;

@end

@implementation TweetCreate
{
    AppModel * appModel;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)tweetButton:(id)sender {
    
    NSString * text = [self.textField text];
    [appModel sendTweet:text];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancleButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    AppDelegate * ad = [ [ UIApplication sharedApplication ] delegate ];
    self->appModel = [ ad mainModel ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
