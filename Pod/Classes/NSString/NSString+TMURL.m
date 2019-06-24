//
//  NSString+TMURL.m
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/8.
//

#import "NSString+TMURL.h"
#import "NSString+TMExtent.h"

@implementation NSString (TMURL)

- (NSString *)tm_stringBySetURLValue:(NSObject *)value forKey:(NSString *)key
{
    if ([NSString tm_isEmptyString:self] || [NSString tm_isEmptyString:key]) {
        return self;
    }

    NSString *result = [self tm_stringByDeleteURLValueForKey:key];
    result = [result tm_stringByAppendingURLValue:value forKey:key];
    return result;
}

- (NSString *)tm_stringByAppendingURLValue:(NSObject *)value forKey:(NSString *)key
{
    if ([NSString tm_isEmptyString:self] || [NSString tm_isEmptyString:key]) {
        return self;
    }

    NSString *result = [NSString stringWithString:self];
    if ([result rangeOfString:@"?"].location == NSNotFound) {
        result = [result stringByAppendingFormat:@"?%@=%@", key, value ?: @""];
    } else if ([result hasSuffix:@"?"]) {
        result = [result stringByAppendingFormat:@"%@=%@", key, value ?: @""];
    } else {
        result = [result stringByAppendingFormat:@"&%@=%@", key, value ?: @""];
    }
    return result;
}

- (NSString *)tm_stringByDeleteURLValueForKey:(NSString *)key
{
    if ([NSString tm_isEmptyString:self] || [NSString tm_isEmptyString:key]) {
        return self;
    }

    NSInteger location = [self rangeOfString:@"?&"].location;
    if (location != NSNotFound) {
        location++;
    } else {
        location = [self rangeOfString:@"?"].location;
    }
    while (location != NSNotFound && self.length > ++location) {
        NSRange range = [self rangeOfString:@"=" options:NSCaseInsensitiveSearch range:NSMakeRange(location, self.length - location)];
        if (location == range.location) {
            location++;
            continue;
        } else if (range.location != NSNotFound) {
            NSString *curKey = [self substringWithRange:NSMakeRange(location, range.location - location)];

            NSCharacterSet *pairSet = [NSCharacterSet characterSetWithCharactersInString:@"\"\'"];
            unichar separator = '&';
            NSMutableArray *pairs = [NSMutableArray array];
            NSInteger valueBegin = range.location + range.length;
            NSInteger valueEnd = valueBegin;
            while (valueEnd < self.length) {
                unichar c = [self characterAtIndex:valueEnd];
                if ([pairSet characterIsMember:c]) {
                    NSString *cs = [NSString stringWithFormat:@"%c", c];
                    if (pairs.count > 0 && [pairs.lastObject isEqual:cs]) {
                        [pairs removeLastObject];
                    } else {
                        [pairs addObject:cs];
                    }
                    valueEnd++;
                } else if (c == separator && pairs.count == 0) {
                    break;
                } else {
                    valueEnd++;
                }
            }

            if ([curKey isEqualToString:key]) {
                NSInteger begin = location;
                NSInteger length = valueEnd >= self.length ? self.length - begin : valueEnd - begin;

                if (begin >= 1 && [self characterAtIndex:begin - 1] == separator) {
                    begin--;
                    length++;
                } else if (begin + length < self.length && [self characterAtIndex:begin + length] == separator) {
                    length++;
                }

                NSRange range = NSMakeRange(begin, length);
                return [self stringByReplacingCharactersInRange:range withString:@""];
            } else {
                location = valueEnd;
            }
        } else {
            break;
        }
    }
    return self;
}

- (NSString *)tm_URLValueForKey:(NSString *)key
{
    if (self.length == 0 || key == nil || key.length == 0) {
        return nil;
    }

    NSString *result = nil;

    NSInteger location = [self rangeOfString:@"?&"].location;
    if (location != NSNotFound) {
        location++;
    } else {
        location = [self rangeOfString:@"?"].location;
    }
    while (location != NSNotFound && self.length > ++location) {
        NSRange range = [self rangeOfString:@"=" options:NSCaseInsensitiveSearch range:NSMakeRange(location, self.length - location)];
        if (location == range.location) {
            location++;
            continue;
        } else if (range.location != NSNotFound) {
            NSString *curKey = [self substringWithRange:NSMakeRange(location, range.location - location)];
            NSString *curValue = nil;

            NSCharacterSet *pairSet = [NSCharacterSet characterSetWithCharactersInString:@"\"\'"];
            unichar separator = '&';
            NSMutableArray *pairs = [NSMutableArray array];
            NSInteger valueBegin = range.location + range.length;
            NSInteger valueEnd = valueBegin;
            while (valueEnd < self.length) {
                unichar c = [self characterAtIndex:valueEnd];
                if ([pairSet characterIsMember:c]) {
                    NSString *cs = [NSString stringWithFormat:@"%c", c];
                    if (pairs.count > 0 && [pairs.lastObject isEqual:cs]) {
                        [pairs removeLastObject];
                    } else {
                        [pairs addObject:cs];
                    }
                    valueEnd++;
                } else if (c == separator && pairs.count == 0) {
                    break;
                } else {
                    valueEnd++;
                }
            }

            if (valueBegin == valueEnd) {
                curValue = @"";
            } else if (valueEnd >= self.length) {
                curValue = [self substringWithRange:NSMakeRange(valueBegin, self.length - valueBegin)];
                curValue = [curValue tm_stringByTrimmingEqualCharactersInSet:pairSet];
            } else {
                curValue = [self substringWithRange:NSMakeRange(valueBegin, valueEnd - valueBegin)];
                curValue = [curValue tm_stringByTrimmingEqualCharactersInSet:pairSet];
            }

            if ([curKey isEqualToString:key]) {
                result = curValue;
                break;
            } else {
                location = valueEnd;
            }
        } else {
            break;
        }
    }

    return result;
}

- (NSString *)tm_stringByTrimmingEqualCharactersInSet:(NSCharacterSet *)set
{
    NSString *result = [NSString stringWithString:self];
    while (result.length > 0) {
        unichar first = [result characterAtIndex:0];
        unichar last = [result characterAtIndex:result.length - 1];
        if (first == last && [set characterIsMember:first]) {
            if (result.length >= 2) {
                result = [result substringWithRange:NSMakeRange(1, result.length - 2)];
            } else {
                result = @"";
            }
        } else {
            break;
        }
    }
    return result;
}

@end
