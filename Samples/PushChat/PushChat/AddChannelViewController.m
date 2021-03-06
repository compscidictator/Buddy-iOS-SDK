//
//  AddChannelViewController.m
//  PushChat
//
//  Created by Nick Ambrose on 5/30/14.
//  Copyright (c) 2014 Buddy Platform. All rights reserved.
//

#import <BuddySDK/Buddy.h>

#import "Constants.h"
#import "AppDelegate.h"
#import "ChannelList.h"

#import "AddChannelViewController.h"

@interface AddChannelViewController ()

@end

@implementation AddChannelViewController

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

-(IBAction)addChannel:(id)sender
{
    BPUserList *list = [BPUserList new];
    
    list.name = self.channelName.text;
    list.readPermissions =BPPermissionsApp;
    list.writePermissions = BPPermissionsApp;
    
    [Buddy.userLists addUserList:list callback:^(NSError *error) {
        
        if(error!=nil)
        {
            
            UIAlertView *alert =
            [[UIAlertView alloc] initWithTitle: @"Server error"
                                       message: [error localizedDescription]
                                      delegate: self
                             cancelButtonTitle: @"OK"
                             otherButtonTitles: nil];
            [alert show];
            return;
        }
        
        [[CommonAppDelegate channels] addChannel:list];
        
        [list addUser:Buddy.user callback:^(BOOL result, NSError *error)
        {
            [[CommonAppDelegate navController] popViewControllerAnimated:YES];
        }];
        
        
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
