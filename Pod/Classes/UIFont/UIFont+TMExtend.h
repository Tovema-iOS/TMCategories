//
//  UIFont+TMExtend.h
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/9.
//

#import <UIKit/UIKit.h>

@interface UIFont(TMExtend)

//HelveticaNeue
+ (instancetype)tm_helveticaNeueMediumFontOfSize:(CGFloat)size;
+ (instancetype)tm_helveticaNeueLightFontOfSize:(CGFloat)size;
+ (instancetype)tm_helveticaNeueRegularFontOfSize:(CGFloat)size;
+ (instancetype)tm_helveticaNeueThinFontOfSize:(CGFloat)size;

//iOS-PingFangSC字体  iOS9以后支持
+ (instancetype)tm_pingFangSCUltralightFontOfSize:(CGFloat)size;
+ (instancetype)tm_pingFangSCRegularFontOfSize:(CGFloat)size;
+ (instancetype)tm_pingFangSCSemiboldFontOfSize:(CGFloat)size;
+ (instancetype)tm_pingFangSCThinFontOfSize:(CGFloat)size;
+ (instancetype)tm_pingFangSCLightFontOfSize:(CGFloat)size;
+ (instancetype)tm_pingFangSCMediumFontOfSize:(CGFloat)size;

@end
