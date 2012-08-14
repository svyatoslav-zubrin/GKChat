//
//  SZFirstViewController.m
//  GKChat
//
//  Created by admin on 8/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SZFirstViewController.h"
#import "SZChatCell.h"

@interface SZFirstViewController ()

@end

@implementation SZFirstViewController

@synthesize messageTextView;
@synthesize chatTableView;
@synthesize messages;
@synthesize localPlayerName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Chat", @"Chat");
        self.tabBarItem.image = [UIImage imageNamed:@"chat"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.messages = [[NSMutableArray alloc] init];
    self.localPlayerName = [[NSString alloc] init];
    // GameKit session
    [self authenticateLocalPlayer];
}

- (void)viewDidUnload
{
    [self setMessageTextView:nil];
    [self setChatTableView:nil];
    [self setMessages:nil];
    [self setLocalPlayerName:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.messages count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseID = @"Cell";
    SZChatCell *cell = [[SZChatCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseID];
    if (cell != nil) {
        NSLog(@"Local player name: %@", self.localPlayerName);
        // username
        cell.username.text = ([self.localPlayerName length] > 0) ? self.localPlayerName : @"Unknown player";
        cell.username.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        // message
        cell.message.text = [self.messages objectAtIndex:[indexPath row]];
        CGSize constSize = CGSizeMake(280, 1000);
        CGSize messageSize = [cell.message.text sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:constSize lineBreakMode:UILineBreakModeWordWrap];
        NSLog(@"messageSize: %f", messageSize.height);
        CGRect messageframe = cell.message.frame;
        messageframe.size.height = messageSize.height + 10;
        cell.message.frame = messageframe;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [SZChatCell cellHeightForMessage:[self.messages objectAtIndex:indexPath.row]];
}

#pragma mark - Actions

- (IBAction)sendAction:(id)sender {
    [self.messages addObject:self.messageTextView.text];
    self.messageTextView.text = @"";
    [self.messageTextView resignFirstResponder];
    [self reloadChatTable];
}

#pragma mark - GameKit logic

- (void)authenticateLocalPlayer {
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    [localPlayer authenticateWithCompletionHandler:^(NSError *error){
        if (localPlayer.isAuthenticated) {
            self.localPlayerName = localPlayer.alias;
        }
    }];
}

#pragma mark - Custom logic

- (void)reloadChatTable {
    [self.chatTableView reloadData];
    [self scrollChatToLastMessage];
}

- (void)scrollChatToLastMessage {
    [self.chatTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:([self.messages count]-1) inSection:0] 
                              atScrollPosition:UITableViewScrollPositionBottom
                                      animated:YES];
}

@end
