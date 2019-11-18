//
//  AppDelegate.m
//  NSNotificationSample
//
//  Created by Hiroki Ikeuchi on 2019/11/16.
//  Copyright © 2019 ikeh1024. All rights reserved.
//

#import "AppDelegate.h"
#import "PreferencesController.h"
@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@property PreferencesController *preferencesController;
// 本来はAppDelegateに書かず、MainMenuウィンドウのためのWindowControllerを建てる
@property (weak) IBOutlet NSTextField *needsSendingMailLabel;
@property (weak) IBOutlet NSTextField *mailAddressLabel;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self
                           selector:@selector(handleSendingMailChange:)
                               name:IKESendingMailChangedNotification
                             object:nil];
    
    [notificationCenter addObserver:self
                           selector:@selector(handleMailAddressChange:)
                               name:IKEMailAddressChangedNotification
                             object:nil];
    
    PreferencesController *preferencesController = [PreferencesController new];
    [preferencesController showWindow:self];
    _preferencesController = preferencesController;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


// Notification Receive Methods
- (void)handleSendingMailChange:(NSNotification *)notification {
    NSLog(@"(RECEIVE)メール送信有無の変更通知");
    BOOL needsSendingMail = [notification.userInfo[IKENeedsSendingMailKey] boolValue];
    if (needsSendingMail) {
        [_needsSendingMailLabel setStringValue:@"必要"];
    } else {
        [_needsSendingMailLabel setStringValue:@"不要"];
    }
}

- (void)handleMailAddressChange:(NSNotification *)notification {
    NSLog(@"(RECEIVE)メールアドレスの変更通知");
    [_mailAddressLabel setStringValue:notification.userInfo[IKEMailAddressKey]];
}

@end
