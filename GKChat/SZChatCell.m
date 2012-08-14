//
//  SZChatCell.m
//  GKChat
//
//  Created by admin on 8/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SZChatCell.h"

@implementation SZChatCell
@synthesize username;
@synthesize message;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"ZSChatCell" owner:self options:nil];
    self = [array objectAtIndex:0];
    if (self) {
        // Initialization code
        NSLog(@"SZChatCell initWithStyle");
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Height of the cell
+ (float)cellHeightForMessage:(NSString*)messageText {
    const float baseMessageY = 40;
    CGSize constSize = CGSizeMake(280, 1000);
    CGSize messageSize = [messageText sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:constSize lineBreakMode:UILineBreakModeWordWrap];
    NSLog(@"cellHeight: %f for message: %@", messageSize.height, messageText);
    float result = messageSize.height + baseMessageY;
    NSLog(@"result: %f", result);
    return result;
}

@end
