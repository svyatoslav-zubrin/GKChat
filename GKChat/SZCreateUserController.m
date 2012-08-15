//
//  SZNewUserController.m
//  GKChat
//
//  Created by admin on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SZCreateUserController.h"


@interface SZCreateUserController ()

@end

@implementation SZCreateUserController
@synthesize usernameTextField;
@synthesize passwordTextField;
@synthesize ageTextField;
@synthesize imageButton;
@synthesize avatarImage;

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
    [self setAgeTextField:nil];
    [self setImageButton:nil];
    [self setAvatarImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Actions

- (IBAction)selectImageAction:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self.navigationController presentModalViewController:imagePicker animated:YES];
}

- (IBAction)createAction:(id)sender {
    
    
}

#pragma mark - UIImagePickerControllerDelegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSLog(@"didFinishPickingMediaWithInfo");
    self.avatarImage = (UIImage*)[info valueForKey:@"UIImagePickerControllerOriginalImage"];
    [self.imageButton setImage:self.avatarImage forState:UIControlStateNormal];
    [self.imageButton setTitle:@"" forState:UIControlStateNormal];
    [self.navigationController dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self.navigationController dismissModalViewControllerAnimated:YES];
    NSLog(@"didFinishPickingMediaWithInfo");
}

#pragma mark - UITextFieldDelegate methods

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
}

@end
