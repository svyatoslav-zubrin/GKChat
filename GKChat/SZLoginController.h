//
//  SZLoginController.h
//  GKChat
//
//  Created by admin on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SZLoginController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UIButton *createUserButton;

- (IBAction)loginAction:(id)sender;
- (IBAction)createUserAction:(id)sender;

@end
