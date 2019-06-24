//
//  NSNotificationCenter+TMExtend.h
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/8.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter(TMExtend)

- (void)tm_postNotificationOnMainThread:(NSNotification *)notification;
- (void)tm_postNotificationNameOnMainThread:(NSString *)aName object:(id)anObject;
- (void)tm_postNotificationNameOnMainThread:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;
- (void)tm_postNotificationNameOnMainThread:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo waitUntilDone:(BOOL)waitUntil;

@end
