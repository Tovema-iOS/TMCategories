//
//  NSObject+TMExtend.m
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/8.
//

#import "NSObject+TMExtend.h"

@implementation NSObject (TMExtend)

+ (NSString *)tm_className
{
    return NSStringFromClass(self);
}

- (NSString *)tm_className
{
    return NSStringFromClass([self class]);
}

- (void)tm_performSelector:(SEL)selector withObjects:(NSArray *)objects
{
    [self tm_performSelector:selector withObjects:objects returnLoc:NULL];
}

- (void)tm_performSelector:(SEL)selector withObjects:(NSArray *)objects returnLoc:(void *)retLoc
{
    NSMethodSignature *signature = [self methodSignatureForSelector:selector];
    if (signature) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:selector];
        for (int i = 0; i < [objects count]; i++) {
            id object = [objects objectAtIndex:i];
            const char *type = [invocation.methodSignature getArgumentTypeAtIndex:2 + i];
            if (strcmp(type, "@") == 0) {
                [invocation setArgument:&object atIndex:(i + 2)];
            } else if (strcmp(type, "i") == 0) {
                NSInteger value = [(NSNumber *)object integerValue];
                [invocation setArgument:&value atIndex:(i + 2)];
            } else if (strcmp(type, "s") == 0) {
                NSInteger value = [(NSNumber *)object shortValue];
                [invocation setArgument:&value atIndex:(i + 2)];
            } else if (strcmp(type, "l") == 0) {
                long value = [(NSNumber *)object longValue];
                [invocation setArgument:&value atIndex:(i + 2)];
            } else if (strcmp(type, "q") == 0) {
                long long value = [(NSNumber *)object longLongValue];
                [invocation setArgument:&value atIndex:(i + 2)];
            } else if (strcmp(type, "I") == 0) {
                NSUInteger value = [(NSNumber *)object unsignedIntegerValue];
                [invocation setArgument:&value atIndex:(i + 2)];
            } else if (strcmp(type, "S") == 0) {
                NSUInteger value = [(NSNumber *)object unsignedShortValue];
                [invocation setArgument:&value atIndex:(i + 2)];
            } else if (strcmp(type, "L") == 0) {
                unsigned long value = [(NSNumber *)object unsignedLongValue];
                [invocation setArgument:&value atIndex:(i + 2)];
            } else if (strcmp(type, "Q") == 0) {
                unsigned long long value = [(NSNumber *)object unsignedLongLongValue];
                [invocation setArgument:&value atIndex:(i + 2)];
            } else if (strcmp(type, "f") == 0) {
                CGFloat value = [(NSNumber *)object floatValue];
                [invocation setArgument:&value atIndex:(i + 2)];
            } else if (strcmp(type, "d") == 0) {
                double value = [(NSNumber *)object doubleValue];
                [invocation setArgument:&value atIndex:(i + 2)];
            } else if (strcmp(type, "B") == 0) {
                BOOL value = [(NSNumber *)object boolValue];
                [invocation setArgument:&value atIndex:(i + 2)];
            }
        }
        [invocation retainArguments];
        [invocation invoke];
        if (signature.methodReturnLength && retLoc != NULL) {
            [invocation getReturnValue:retLoc];
        }
    }
}

@end
