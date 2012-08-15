//
//  SZNewUserController.h
//  GKChat
//
//  Created by admin on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SZCreateUserController : UIViewController <UIImagePickerControllerDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *ageTextField;
@property (strong, nonatomic) IBOutlet UIButton *imageButton;
@property (strong, nonatomic) UIImage *avatarImage;

- (IBAction)selectImageAction:(id)sender;
- (IBAction)createAction:(id)sender;

@end
