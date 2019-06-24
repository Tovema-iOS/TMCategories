//
//  UIColor+TMExtend.h
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/8.
//

#import <UIKit/UIKit.h>

@interface UIColor(TMExtend)

@property (nonatomic, readonly) CGColorSpaceModel tm_colorSpaceModel;
@property (nonatomic, readonly) BOOL tm_canProvideRGBComponents;

// With the exception of -alpha, these properties will function
// correctly only if this color is an RGB or white color.
// In these cases, canProvideRGBComponents returns YES.
// values 0 ~ 1.0
@property (nonatomic, readonly) CGFloat red;
@property (nonatomic, readonly) CGFloat green;
@property (nonatomic, readonly) CGFloat blue;
@property (nonatomic, readonly) CGFloat white;
@property (nonatomic, readonly) CGFloat hue;
@property (nonatomic, readonly) CGFloat saturation;
@property (nonatomic, readonly) CGFloat brightness;
@property (nonatomic, readonly) CGFloat alpha;
@property (nonatomic, readonly) CGFloat luminance;
@property (nonatomic, readonly) UInt32 tm_rgbHex;

@property (nonatomic, readonly) NSString *tm_colorSpaceString;
@property (nonatomic, readonly) NSArray *tm_RGBAComponents;  // value 0 ~ 1.0

// Return a grey-scale representation of the color
@property (nonatomic, readonly) UIColor *tm_colorByLuminanceMapping;

// Arithmetic operations on the color
- (UIColor *)tm_colorByMultiplyingByRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
- (UIColor *)tm_colorByAddingRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
- (UIColor *)tm_colorByLighteningToRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
- (UIColor *)tm_colorByDarkeningToRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

- (UIColor *)tm_colorByMultiplyingBy:(CGFloat)f;
- (UIColor *)tm_colorByAdding:(CGFloat)f;
- (UIColor *)tm_colorByLighteningTo:(CGFloat)f;
- (UIColor *)tm_colorByDarkeningTo:(CGFloat)f;

- (UIColor *)tm_colorByMultiplyingByColor:(UIColor *)color;
- (UIColor *)tm_colorByAddingColor:(UIColor *)color;
- (UIColor *)tm_colorByLighteningToColor:(UIColor *)color;
- (UIColor *)tm_colorByDarkeningToColor:(UIColor *)color;

// Related colors
- (UIColor *)tm_contrastingColor;  // A good contrasting color: will be either black or white
- (UIColor *)tm_complementaryColor;  // A complementary color that should look good with this color
- (NSArray *)tm_triadicColors;  // Two colors that should look good with this color
- (NSArray *)tm_analogousColorsWithStepAngle:(CGFloat)stepAngle pairCount:(int)pairs;  // Multiple pairs of colors

// String representations of the color
- (NSString *)tm_stringFromColor;
- (NSString *)tm_stringFromColor2;
- (NSString *)tm_hexStringFromColor;

// The named color that matches this one most closely
- (NSString *)tm_closestColorName;
- (NSString *)tm_closestCrayonName;

// Color builders
+ (UIColor *)tm_randomColor;
+ (UIColor *)tm_colorWithString:(NSString *)stringToConvert;
+ (UIColor *)tm_colorWithString2:(NSString *)stringToConvert;
+ (UIColor *)tm_colorWithRGBHex:(UInt32)hex;
+ (UIColor *)tm_colorWithHexString:(NSString *)stringToConvert;
+ (UIColor *)tm_colorWithName:(NSString *)cssColorName;
+ (UIColor *)tm_crayonWithName:(NSString *)crayonColorName;

// Return a dictionary mapping color names to colors.
// The named are from the css3 color specification.
+ (NSDictionary *)tm_namedColors;

// Return a dictionary mapping color names to colors
// The named are standard Crayola style colors
+ (NSDictionary *)tm_namedCrayons;

// Low level conversions between RGB and HSL spaces
+ (void)tm_hue:(CGFloat)h saturation:(CGFloat)s brightness:(CGFloat)v toRed:(CGFloat *)r green:(CGFloat *)g blue:(CGFloat *)b;
+ (void)tm_red:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b toHue:(CGFloat *)h saturation:(CGFloat *)s brightness:(CGFloat *)v;

@end
