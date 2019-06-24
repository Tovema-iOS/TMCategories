//
//  NSString+TMURL.h
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/8.
//

#import <Foundation/Foundation.h>

@interface NSString(TMURL)

/**
 Generate new url by set url param

 @param value new value, NSString or NSNumber
 @param key key
 @return new url
 */
- (NSString *)tm_stringBySetURLValue:(NSObject *)value forKey:(NSString *)key;

/**
 Generate new url by appending url param
 
 @param value new value, NSString or NSNumber
 @param key key
 @return new url
 */
- (NSString *)tm_stringByAppendingURLValue:(NSObject *)value forKey:(NSString *)key;

/**
 Generate new url by delete url param
 
 @param key key
 @return new url
 */
- (NSString *)tm_stringByDeleteURLValueForKey:(NSString *)key;

/**
 Get url param
 
 @param key key
 */
- (NSString *)tm_URLValueForKey:(NSString *)key;

@end
