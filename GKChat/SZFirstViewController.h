//
//  SZFirstViewController.h
//  GKChat
//
//  Created by admin on 8/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SZFirstViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextViewDelegate>
@property (strong, nonatomic) IBOutlet UITextView *messageTextView;
@property (strong, nonatomic) IBOutlet UITableView *chatTableView;
@property (strong, nonatomic) NSMutableArray *messages;
@property (strong, nonatomic) NSString *localPlayerName;

- (IBAction)sendAction:(id)sender;

@end
