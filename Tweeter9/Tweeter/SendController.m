//
//  SendController.m
//  Tweeter
//
//  Created by Tasos Kontogiorgos on 3/29/14.
//  Copyright (c) 2014 home. All rights reserved.
//

#import "SendController.h"
#import "AppModel.h"
#import "AppDelegate.h"

@interface SendController ()

@property (weak, nonatomic) IBOutlet UITextView *text;
@end

@implementation SendController
{
    AppModel * appModel;
}

- (IBAction)sendit:(id)sender {
    [ self->appModel sendTweet:self.text.text ];
}

- (IBAction)done:(id)sender {
    [ self dismissViewControllerAnimated:YES completion:nil];
}

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
    AppDelegate * ad = [ [ UIApplication sharedApplication ] delegate ];
    self->appModel = [ ad mainModel ];
 
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
