//
//  TweetsController.m
//  Tweeter
//
//  Created by Alexandros Kontogiorgos-Heintz on 3/15/14.
//  Copyright (c) 2014 Alexandros Kontogiorgos-Heintz. All rights reserved.
//

#import "TweetsController.h"
#import "AppModel.h"
#import "AppDelegate.h"
#import "TweetedSiteController.h"

@interface TweetsController ()
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation TweetsController
{
    AppModel * appModel;
    UIActivityIndicatorView *spinner;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)reverse:(id)sender {
    [ self->appModel reverseTweets ];
}
- (IBAction)refresh:(id)sender {
    [ self->appModel refresh ];
}

-( void ) dataLoaded
{
    [ self.myTableView reloadData ];
    [ spinner stopAnimating ];
}

-( void ) dataLoadedStarted
{
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center = CGPointMake(160, 240);
    spinner.hidesWhenStopped = YES;
    [self.view addSubview:spinner];
    [spinner startAnimating];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    AppDelegate * ad = [ [ UIApplication sharedApplication ] delegate ];
    self->appModel = [ ad mainModel ];
    [ self->appModel addDataUser:self];
    [ self->appModel refresh ];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-( int ) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int x = [ self->appModel tweetsCount ];
    return x;
}

- ( UITableViewCell * ) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"tweetCell"];
    
    int row = indexPath.row;
    
    Tweet * tweet = [ self->appModel getTweetAtIndex:row ];
    Person * user = [ self->appModel getUserAtName:tweet.user ];
    
    UIImageView * photo = ( UIImageView * ) [ cell viewWithTag:100 ];
    UITextView  * text  = ( UITextView * ) [ cell viewWithTag:200 ];
    UILabel *     time  = ( UILabel * ) [ cell viewWithTag:300 ];
    
    photo.image = user.image;
    text.text = tweet.text;
    int secs = [ tweet.nsdate timeIntervalSinceNow ]  * -1;
    time.text = [ NSString stringWithFormat:@"%d", secs ];
    
    return cell;
}

- ( void ) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = indexPath.row;
    Tweet * tweet = [ self->appModel getTweetAtIndex:row ];
    NSString * url = [ tweet embededUrl ];
    if( url == nil )
    {
        return;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TweetedSiteController *tViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TweetedSiteController"];
    tViewController.selectedRow = row;
    tViewController.url = url;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tViewController];
    [self presentViewController:navigationController animated:YES completion:nil];

}

@end
