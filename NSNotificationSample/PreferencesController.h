//
//  PreferencesController.h
//  NSNotificationSample
//
//  Created by Hiroki Ikeuchi on 2019/11/16.
//  Copyright © 2019 ikeh1024. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

// 通知名には衝突を避けるためにPrefixをつけると良い。
extern NSString *const IKESendingMailChangedNotification;
extern NSString *const IKEMailAddressChangedNotification;

// userinfo用のキー
extern NSString *const IKENeedsSendingMailKey;  // メール有無
extern NSString *const IKEMailAddressKey;       // メールアドレス

@interface PreferencesController : NSWindowController
@end

NS_ASSUME_NONNULL_END
