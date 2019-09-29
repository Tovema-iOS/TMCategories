//
//  NSObject+TMContainsKey.m
//  TMCategories2
//
//  Created by XiaobinLin on 2019/9/29.
//

#import "NSObject+TMContainsKey.h"
#import <objc/runtime.h>

@implementation NSObject (TMContainsKey)

- (void)tm_setValue:(id)value forKey:(NSString *)key
{
    if ([self tm_containsKey:key]) {
        return;
    }
    [self setValue:value forKey:key];
}

- (id)tm_valueForKey:(NSString *)key
{
    if ([self tm_containsKey:key]) {
        return [self valueForKey:key];
    }
    return nil;
}

- (BOOL)tm_containsKey:(NSString *)key
{
    if (key.length == 0) {
        return NO;
    }

    BOOL contains = [self.tm_allKeys containsObject:key];
    return contains;
}

- (NSSet *)tm_allKeys
{
    NSSet *set = objc_getAssociatedObject(self, _cmd);
    if (set) {
        return set;
    }
    
    NSMutableSet *result = [NSMutableSet set];
    Class cls = [self class];
    while (cls) {
        unsigned int count;
        Ivar *ivarList = class_copyIvarList(cls, &count);
        if (ivarList) {
            for (int i = 0; i < count; i++) {
                NSString *name = [NSString stringWithUTF8String:ivar_getName(ivarList[i])];
                [result addObject:name];
            }
            free(ivarList);
        }
        
        cls = [cls superclass];
    }
    
    set = result.copy;
    objc_setAssociatedObject(self, _cmd, set, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return set;
}

@end
