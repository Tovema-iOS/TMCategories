//
//  NSObject+TMContainsKey.h
//  TMCategories2
//
//  Created by XiaobinLin on 2019/9/29.
//

#import <Foundation/Foundation.h>

@interface NSObject (TMContainsKey)

@property (nonatomic, copy, readonly) NSSet<NSString *> *tm_allKeys;

- (id)tm_valueForKey:(NSString *)key;

- (void)tm_setValue:(id)value forKey:(NSString *)key;

- (BOOL)tm_containsKey:(NSString *)key;

@end
