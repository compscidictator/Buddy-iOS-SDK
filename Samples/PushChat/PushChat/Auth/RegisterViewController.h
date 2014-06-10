//
//  RegisterViewController.h
//  PushChat
//
//  Created by Nick Ambrose on 5/30/14.
//  Copyright (c) 2014 Buddy Platform. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface RegisterViewController : UIViewController <MBProgressHUDDelegate, UITextFieldDelegate>

@property (nonatomic,weak) IBOutlet UITextField *firstNameTextField;
@property (nonatomic,weak) IBOutlet UITextField *lastNameTextField;
@property (nonatomic,weak) IBOutlet UITextField *userNameTextField;
@property (nonatomic,weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic,weak) IBOutlet UITextField *emailTextField;

@property (nonatomic,weak) IBOutlet UIButton *registerBut;
@property (nonatomic,weak) IBOutlet UIButton *goLoginBut;

-(IBAction) doRegister:(id)sender;
-(IBAction) goLogin:(id)sender;
-(void) resignTextFields;


@end
