//
//  NSNotificationCenter+TMExtend.m
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/8.
//

#import "NSNotificationCenter+TMExtend.h"

@implementation NSNotificationCenter (TMExtend)

- (void)tm_postNotificationOnMainThread:(NSNotification *)notification
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self postNotification:notification];
    });
}

- (void)tm_postNotificationNameOnMainThread:(NSString *)aName object:(id)anObject
{
    [self tm_postNotificationNameOnMainThread:aName object:anObject userInfo:nil waitUntilDone:NO];
}

- (void)tm_postNotificationNameOnMainThread:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
    [self tm_postNotificationNameOnMainThread:aName object:anObject userInfo:aUserInfo waitUntilDone:NO];
}

- (void)tm_postNotificationNameOnMainThread:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo waitUntilDone:(BOOL)waitUntil
{
    SEL sel = @selector(tm_postNotificationNameOnMainThreadImpl:object:userInfo:);
    NSMethodSignature *sig = [self methodSignatureForSelector:sel];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
    [invocation setTarget:self];
    [invocation setSelector:sel];
    [invocation setArgument:&aName atIndex:2];
    [invocation setArgument:&anObject atIndex:3];
    [invocation setArgument:&aUserInfo atIndex:4];
    [invocation performSelectorOnMainThread:@selector(invoke)
                                 withObject:nil
                              waitUntilDone:waitUntil];
}

- (void)tm_postNotificationNameOnMainThreadImpl:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
    [self postNotificationName:aName object:anObject userInfo:aUserInfo];
}

@end
