//
//  SZLoginController.m
//  GKChat
//
//  Created by admin on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SZLoginController.h"
#import "SZCreateUserController.h"

@interface SZLoginController ()

@end

@implementation SZLoginController

@synthesize usernameTextField;
@synthesize passwordTextField;
@synthesize loginButton;
@synthesize createUserButton;

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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setUsernameTextField:nil];
    [self setPasswordTextField:nil];
    [self setLoginButton:nil];
    [self setCreateUserButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)createUserAction:(id)sender {
    SZCreateUserController *createUserController = [[SZCreateUserController alloc] init];
    [self.navigationController pushViewController:createUserController animated:YES];
}

- (IBAction)loginAction:(id)sender {
}
@end
