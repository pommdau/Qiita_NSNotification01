//
//  PreferencesController.m
//  NSNotificationSample
//
//  Created by Hiroki Ikeuchi on 2019/11/16.
//  Copyright © 2019 ikeh1024. All rights reserved.
//

#import "PreferencesController.h"

NSString *const IKESendingMailChangedNotification = @"IKESendingMailChanged";
NSString *const IKEMailAddressChangedNotification = @"IKEMailAddressChanged";
NSString *const IKENeedsSendingMailKey            = @"needsSending";
NSString *const IKEMailAddressKey                 = @"mailAddress";

@interface PreferencesController () <NSTextFieldDelegate>
@property (weak) IBOutlet NSTextField *mailAddressTF;

@end

@implementation PreferencesController

- (id)init {
    if (self = [super initWithWindowNibName:[self className] owner:self]) {
    }
    
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
}

- (IBAction)sendingMailCheckBoxClicked:(NSButton *)sender {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSLog(@"(POST)メール有無の変更通知");
    NSNumber     *needsSendingMail = [NSNumber numberWithBool: sender.state];
    NSDictionary *userinfoDic      = @{IKENeedsSendingMailKey : needsSendingMail};
    [notificationCenter postNotificationName:IKESendingMailChangedNotification
                                      object:self
                                    userInfo:userinfoDic];
}

// MARK:- NSTextField Notification Methods
- (void)controlTextDidChange:(NSNotification *)aNotification {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSLog(@"(POST)メールアドレスの変更通知");
    NSDictionary *userinfoDic = @{IKEMailAddressKey : _mailAddressTF.stringValue};
    [notificationCenter postNotificationName:IKEMailAddressChangedNotification
                                      object:self
                                    userInfo:userinfoDic];
}
@end
