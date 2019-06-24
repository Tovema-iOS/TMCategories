//
//  UIColor+TMHex.h
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/9.
//

#import <UIKit/UIKit.h>

#ifndef TMRGB
#define TMRGB
#define RGB(r, g, b) [UIColor colorWithRed:(float)(r) / 255.f green:(float)(g) / 255.f blue:(float)(b) / 255.f alpha:1.0f]
#define RGBA(r, g, b, a) [UIColor colorWithRed:(float)(r) / 255.f green:(float)(g) / 255.f blue:(float)(b) / 255.f alpha:a]

#define RGB_HEX(rgb) [UIColor tm_colorWithRGBHex:(rgb)]
#define RGB_HEX_ALPHA(rgb, a) [UIColor tm_colorWithRGBHex:(rgb) alpha:a]
#define RGBA_HEX(rgba) [UIColor tm_colorWithRGBAHex:(rgba)]
#define ARGB_HEX(argb) [UIColor tm_colorWithARGBHex:(argb)]

#define RGB_HEX_STR(rgb) [UIColor tm_colorWithRGBHexString:(rgb)]
#define RGB_HEX_STR_ALPHA(rgb, a) [UIColor tm_colorWithRGBHexString:(rgb) alpha:a]
#define RGBA_HEX_STR(rgba) [UIColor tm_colorWithRGBAHexString:(rgba)]
#define ARGB_HEX_STR(argb) [UIColor tm_colorWithARGBHexString:(argb)]
#endif

@interface UIColor(TMHex)

+ (instancetype)tm_colorWithRGBHexString:(NSString *)colorString;
+ (instancetype)tm_colorWithRGBHexString:(NSString *)colorString alpha:(CGFloat)alpha;
+ (instancetype)tm_colorWithRGBAHexString:(NSString *)colorString;
+ (instancetype)tm_colorWithARGBHexString:(NSString *)colorString;

+ (instancetype)tm_colorWithRGBHex:(NSInteger)hexValue;
+ (instancetype)tm_colorWithRGBHex:(NSInteger)hexValue alpha:(CGFloat)alpha;
+ (instancetype)tm_colorWithRGBAHex:(NSInteger)hexValue;
+ (instancetype)tm_colorWithARGBHex:(NSInteger)hexValue;

/*
 * @brief 返回16进制的颜色(不带Alpha值) #FFFFFF
 * 只对UIDeviceRGBColorSpace有效，对UIDeviceWhiteColorSpace的颜色无法生成正确的颜色值,
 * 例如[UIColor blackColor]、[UIColor whiteColor]无法生成正确的颜色值
 * 解决办法是用RGB(0,0,0)替换blackColor，RGB(1,1,1)替换whiteColor
 */
- (NSString *)tm_RGBHexString;
- (NSString *)tm_RGBAHexString;

@end
