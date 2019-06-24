//
//  UIColor+TMHex.m
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/9.
//

#import "UIColor+TMHex.h"
#import "UIColor+TMExtend.h"

#define ColorComponentCount 3
#define ColorComponentCountWithAlpha 4

/**
 *  Use HEX color value with 0x000000 format
 */
#define colorRGBColor(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:alphaValue]
#define colorRGB(r, g, b) [UIColor colorWithRed:(float)(r) / 255.f green:(float)(g) / 255.f blue:(float)(b) / 255.f alpha:1.0f]
#define colorRGBA(r, g, b, a) [UIColor colorWithRed:(float)(r) / 255.f green:(float)(g) / 255.f blue:(float)(b) / 255.f alpha:a]

@implementation UIColor (TMHex)

+ (instancetype)tm_colorWithRGBHexString:(NSString *)colorString
{
    return [self tm_colorWithRGBHexString:colorString alpha:1.0];
}

+ (instancetype)tm_colorWithRGBHexString:(NSString *)colorString alpha:(CGFloat)alpha
{
    NSString *cString = [[colorString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < (ColorComponentCount * 2)) {
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != (ColorComponentCount * 2)) {
        return [UIColor tm_colorWithRGBAHexString:colorString];
    }

    NSRange range;
    range.location = 0;
    range.length = 2;
    unsigned int colorComponent[ColorComponentCount] = {0};
    for (int index = 0; index < ColorComponentCount; ++index) {
        NSString *componentStr = [cString substringWithRange:range];
        [[NSScanner scannerWithString:componentStr] scanHexInt:&colorComponent[index]];
        range.location += 2;
    }
    return colorRGBA(colorComponent[0], colorComponent[1], colorComponent[2], alpha);  //colorComponent[3]
}

+ (instancetype)tm_colorWithRGBAHexString:(NSString *)colorString
{
    NSString *cString = [[colorString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < (ColorComponentCountWithAlpha * 2)) {
        return [UIColor whiteColor];
    }
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != (ColorComponentCountWithAlpha * 2)) {
        return [UIColor clearColor];
    }

    NSRange range;
    range.location = 0;
    range.length = 2;
    unsigned int colorComponent[ColorComponentCountWithAlpha] = {0};
    for (int index = 0; index < ColorComponentCountWithAlpha; ++index) {
        NSString *componentStr = [cString substringWithRange:range];
        [[NSScanner scannerWithString:componentStr] scanHexInt:&colorComponent[index]];
        range.location += 2;
    }
    return colorRGBA(colorComponent[0], colorComponent[1], colorComponent[2], colorComponent[3] / 255.0);
}

+ (instancetype)tm_colorWithARGBHexString:(NSString *)colorString
{
    NSString *cString = [[colorString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < (ColorComponentCountWithAlpha * 2)) {
        return [UIColor whiteColor];
    }
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != (ColorComponentCountWithAlpha * 2)) {
        return [UIColor clearColor];
    }

    NSRange range;
    range.location = 0;
    range.length = 2;
    unsigned int colorComponent[ColorComponentCountWithAlpha] = {0};
    for (int index = 0; index < ColorComponentCountWithAlpha; ++index) {
        NSString *componentStr = [cString substringWithRange:range];
        [[NSScanner scannerWithString:componentStr] scanHexInt:&colorComponent[index]];
        range.location += 2;
    }
    //美术提供argb的hex值
    return colorRGBA(colorComponent[1], colorComponent[2], colorComponent[3], colorComponent[0] / 255.0);
}


+ (instancetype)tm_colorWithRGBHex:(NSInteger)hexValue
{
    return [self tm_colorWithRGBHex:hexValue alpha:1.0];
}

+ (instancetype)tm_colorWithRGBHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hexValue & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hexValue & 0xFF)) / 255.0
                           alpha:alphaValue];
}

+ (instancetype)tm_colorWithRGBAHex:(NSInteger)hexValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF000000) >> 24)) / 255.0
                           green:((float)((hexValue & 0xFF0000) >> 16)) / 255.0
                            blue:((float)((hexValue & 0xFF00) >> 8)) / 255.0
                           alpha:((float)(hexValue & 0xFF)) / 255.0];
}

+ (instancetype)tm_colorWithARGBHex:(NSInteger)hexValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hexValue & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hexValue & 0xFF)) / 255.0
                           alpha:((float)((hexValue & 0xFF000000) >> 24)) / 255.0];
}


- (NSString *)tm_RGBHexString
{
    NSMutableString *hexStr = [NSMutableString stringWithString:@"#"];
    NSArray *colorComponents = [self tm_RGBAComponents];
    for (NSInteger index = 0; index < ColorComponentCount && index < colorComponents.count; ++index) {
        NSString *str = [NSString stringWithFormat:@"%02x", (unsigned int)([colorComponents[index] floatValue] * 255.0)];
        [hexStr appendString:str];
    }
    return hexStr;
}

- (NSString *)tm_RGBAHexString
{
    NSMutableString *hexStr = [NSMutableString stringWithString:@"#"];
    NSArray *colorComponents = [self tm_RGBAComponents];
    for (NSInteger index = 0; index < ColorComponentCountWithAlpha && index < colorComponents.count; ++index) {
        NSString *str = [NSString stringWithFormat:@"%02x", (unsigned int)([colorComponents[index] floatValue] * 255.0)];
        [hexStr appendString:str];
    }
    return hexStr;
}

@end
