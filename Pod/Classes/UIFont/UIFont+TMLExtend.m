//
//  UIFont+TMExtend.m
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/9.
//

#import "UIFont+TMExtend.h"

@implementation UIFont (TMExtend)

+ (instancetype)tm_helveticaNeueMediumFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Medium" size:size];
}

+ (instancetype)tm_helveticaNeueLightFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
}

+ (instancetype)tm_helveticaNeueRegularFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue" size:size];
    //return [UIFont fontWithName:@"HelveticaNeue-Regular" size:size]; // nil
}

+ (instancetype)tm_helveticaNeueThinFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Thin" size:size];
}

//iOS-PingFangSC字体  iOS9以后支持
+ (instancetype)tm_pingFangSCUltralightFontOfSize:(CGFloat)size;
{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Ultralight" size:size];
    return font ? font : ([UIFont systemFontOfSize:size]);
}

+ (instancetype)tm_pingFangSCRegularFontOfSize:(CGFloat)size;
{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:size];
    return font ? font : ([UIFont systemFontOfSize:size]);
}

+ (instancetype)tm_pingFangSCSemiboldFontOfSize:(CGFloat)size;
{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
    return font ? font : ([UIFont systemFontOfSize:size]);
}

+ (instancetype)tm_pingFangSCThinFontOfSize:(CGFloat)size;
{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Thin" size:size];
    return font ? font : ([UIFont systemFontOfSize:size]);
}

+ (instancetype)tm_pingFangSCLightFontOfSize:(CGFloat)size;
{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Light" size:size];
    return font ? font : ([UIFont systemFontOfSize:size]);
}

+ (instancetype)tm_pingFangSCMediumFontOfSize:(CGFloat)size;
{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Medium" size:size];
    return font ? font : ([UIFont systemFontOfSize:size]);
}

@end
