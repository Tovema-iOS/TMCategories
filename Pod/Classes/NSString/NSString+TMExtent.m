//
//  NSString+Extent.m
//  CityLife
//
//  Created by sie kensou on 11-12-3.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSString+TMExtent.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (TMExtent)

#define JavaNotFound NSNotFound

- (NSComparisonResult)tm_compareTo:(NSString *)str
{
    return [self compare:str];
}

- (NSComparisonResult)tm_compareToIgnoreCase:(NSString *)str
{
    return [self compare:str options:NSCaseInsensitiveSearch];
}

- (BOOL)tm_contains:(NSString *)str
{
    NSRange range = [self rangeOfString:str];
    return (range.location != NSNotFound);
}

- (BOOL)tm_startsWith:(NSString *)prefix
{
    return [self hasPrefix:prefix];
}

- (BOOL)tm_endsWith:(NSString *)suffix
{
    return [self hasSuffix:suffix];
}

- (BOOL)tm_equals:(NSString *)anotherString
{
    return [self isEqualToString:anotherString];
}

- (BOOL)tm_equalsIgnoreCase:(NSString *)anotherString
{
    return [[self lowercaseString] tm_equals:[anotherString lowercaseString]];
}

- (NSInteger)tm_indexOfChar:(unichar)ch
{
    return [self tm_indexOfChar:ch fromIndex:0];
}

- (NSInteger)tm_indexOfChar:(unichar)ch fromIndex:(NSInteger)index
{
    NSInteger len = self.length;
    for (NSInteger i = index; i < len; ++i) {
        if (ch == [self characterAtIndex:i]) {
            return i;
        }
    }
    return JavaNotFound;
}

- (NSInteger)tm_indexOfString:(NSString *)str
{
    NSRange range = [self rangeOfString:str];
    if (range.location == NSNotFound) {
        return JavaNotFound;
    }
    return range.location;
}

- (NSInteger)tm_indexOfString:(NSString *)str fromIndex:(NSInteger)index
{
    NSRange fromRange = NSMakeRange(index, self.length - index);
    NSRange range = [self rangeOfString:str options:NSLiteralSearch range:fromRange];
    if (range.location == NSNotFound) {
        return JavaNotFound;
    }
    return range.location;
}

- (NSInteger)tm_lastIndexOfChar:(unichar)ch
{
    NSInteger len = self.length;
    for (NSInteger i = len - 1; i >= 0; --i) {
        if ([self characterAtIndex:i] == ch) {
            return i;
        }
    }
    return JavaNotFound;
}

- (NSInteger)tm_lastIndexOfChar:(unichar)ch fromIndex:(NSInteger)index
{
    NSInteger len = self.length;
    if (index >= len) {
        index = len - 1;
    }
    for (NSInteger i = index; i >= 0; --i) {
        if ([self characterAtIndex:i] == ch) {
            return index;
        }
    }
    return JavaNotFound;
}

- (NSInteger)tm_lastIndexOfString:(NSString *)str
{
    NSRange range = [self rangeOfString:str options:NSBackwardsSearch];
    if (range.location == NSNotFound) {
        return JavaNotFound;
    }
    return range.location;
}

- (NSInteger)tm_lastIndexOfString:(NSString *)str fromIndex:(NSInteger)index
{
    NSRange fromRange = NSMakeRange(0, index);
    NSRange range = [self rangeOfString:str options:NSBackwardsSearch range:fromRange];
    if (range.location == NSNotFound) {
        return JavaNotFound;
    }
    return range.location;
}

- (NSString *)tm_substringFromIndex:(NSInteger)beginIndex toIndex:(NSInteger)endIndex
{
    if (endIndex <= beginIndex) {
        return @"";
    }
    NSRange range = NSMakeRange(beginIndex, endIndex - beginIndex);
    return [self substringWithRange:range];
}

- (NSString *)tm_trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)tm_replaceAll:(NSString *)origin with:(NSString *)replacement
{
    return [self stringByReplacingOccurrencesOfString:origin withString:replacement];
}

- (NSArray *)tm_split:(NSString *)separator
{
    return [self componentsSeparatedByString:separator];
}

+ (BOOL)tm_isEmptyString:(NSString *)string
{
    BOOL empty = YES;
    if (string) {
        NSString *tmp = [string tm_trim];
        if (tmp && tmp.length > 0) {
            empty = NO;
        }
    }
    return empty;
}

- (CGSize)tm_sizeWithMaxSize:(CGSize)size font:(UIFont *)font
{
    CGSize lbSize = CGSizeZero;
    if (CGSizeEqualToSize(size, lbSize) || font == nil) {
        return lbSize;
    }

    NSDictionary *attr = nil;
    if (font) {
        attr = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    }
    lbSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
    return lbSize;
}


- (NSString *)tm_lowercaseFirstCharacterString
{
    if ([self length] > 0) {
        NSString *firstChar = [self substringToIndex:1];
        firstChar = [firstChar lowercaseString];
        NSString *remainder = [self substringFromIndex:1];
        return [firstChar stringByAppendingString:remainder];
    }

    return self;
}

- (NSString *)tm_uppercaseFirstCharacterString
{
    if ([self length] > 0) {
        NSString *firstChar = [self substringToIndex:1];
        firstChar = [firstChar uppercaseString];
        NSString *remainder = [self substringFromIndex:1];
        return [firstChar stringByAppendingString:remainder];
    }

    return self;
}

/**
 URL字符串编码
 */
- (NSString *)tm_urlEncodedUTF8String
{
    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

/**
 URL字符串解码
 */
- (NSString *)tm_urlDecodedUTF8String
{
    return [self stringByRemovingPercentEncoding];
}

@end
