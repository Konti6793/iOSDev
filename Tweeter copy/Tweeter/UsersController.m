//
//  UsersController.m
//  Tweeter
//
//  Created by Alexandros Kontogiorgos-Heintz on 3/15/14.
//  Copyright (c) 2014 Alexandros Kontogiorgos-Heintz. All rights reserved.
//

#import "UsersController.h"
#import "AppModel.h"
#import "AppDelegate.h"
#import "TweetCreate.h"

@interface UsersController ()

@end

@implementation UsersController
{
    AppModel * appModel;
    __weak IBOutlet UITableView *myTableView;
    UIActivityIndicatorView *spinner;
}

-( void ) dataLoaded
{
    [ self->myTableView reloadData ];
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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)refresh:(id)sender {
    [ self->appModel refresh ];
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
    int x = [ self->appModel usersCount ];
    return x;
}

- ( UITableViewCell * ) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *simpleTableIdentifier = @"SimpleTableCell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
//    }
    UITableViewCell * cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"userCell"];

    int row = indexPath.row;
    Person * user = [ self->appModel getUserAtIndex:row ];
    
    int nt = [ self->appModel numberOfTweetsForUser:user.name ];
        
    UILabel *screeNameLabel = (UILabel *) [cell viewWithTag:200 ];
    screeNameLabel.text = user.screenName;

    UILabel *nameLabel = (UILabel *) [cell viewWithTag:400 ];
    nameLabel.text = user.name;

    
    UILabel *tweetsLabel = (UILabel *) [cell viewWithTag:300 ];
    tweetsLabel.text =  [NSString stringWithFormat:@"%d tweets", nt  ];
    
    UIImageView * photo = ( UIImageView * ) [ cell viewWithTag:100 ];
    
    photo.image = user.image;

    return cell;
}
@end
