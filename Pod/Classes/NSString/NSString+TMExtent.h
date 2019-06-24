//
//  NSString+Extent.h
//  CityLife
//
//  Created by sie kensou on 11-12-3.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(TMExtent)

- (NSComparisonResult)tm_compareTo:(NSString *)str;

- (NSComparisonResult)tm_compareToIgnoreCase:(NSString *)str;

- (BOOL)tm_contains:(NSString *)str;

- (BOOL)tm_startsWith:(NSString *)prefix;

- (BOOL)tm_endsWith:(NSString *)suffix;

- (BOOL)tm_equals:(NSString *)anotherString;

- (BOOL)tm_equalsIgnoreCase:(NSString *)anotherString;

- (NSInteger)tm_indexOfChar:(unichar)ch;

- (NSInteger)tm_indexOfChar:(unichar)ch fromIndex:(NSInteger)index;

- (NSInteger)tm_indexOfString:(NSString *)str;

- (NSInteger)tm_indexOfString:(NSString *)str fromIndex:(NSInteger)index;

- (NSInteger)tm_lastIndexOfChar:(unichar)ch;

- (NSInteger)tm_lastIndexOfChar:(unichar)ch fromIndex:(NSInteger)index;

- (NSInteger)tm_lastIndexOfString:(NSString *)str;

- (NSInteger)tm_lastIndexOfString:(NSString *)str fromIndex:(NSInteger)index;

- (NSString *)tm_substringFromIndex:(NSInteger)beginIndex toIndex:(NSInteger)endIndex;

- (NSString *)tm_replaceAll:(NSString *)origin with:(NSString *)replacement;

- (NSString *)tm_trim;

- (NSArray *)tm_split:(NSString *)separator;

/**
 判断字符串是否为空
 */
+ (BOOL)tm_isEmptyString:(NSString *)string;

/**
 计算文字显示区域
 */
- (CGSize)tm_sizeWithMaxSize:(CGSize)size font:(UIFont *)font;

/**
 字符串首字母改为小写字母
 */
- (NSString *)tm_lowercaseFirstCharacterString;

/**
 字符串首字母改为大写字母
 */
- (NSString *)tm_uppercaseFirstCharacterString;

/**
 URL字符串编码
 */
- (NSString *)tm_urlEncodedUTF8String;

/**
 URL字符串解码
 */
- (NSString *)tm_urlDecodedUTF8String;

@end
