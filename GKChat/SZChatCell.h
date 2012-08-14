//
//  SZChatCell.h
//  GKChat
//
//  Created by admin on 8/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SZChatCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *username;
@property (strong, nonatomic) IBOutlet UITextView *message;

+ (CGFloat)cellHeightForMessage:(NSString*)messageText;

@end
