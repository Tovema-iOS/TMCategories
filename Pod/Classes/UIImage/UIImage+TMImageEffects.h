//
//  UIImage+TMImageEffects.h
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/9.
//

#import <UIKit/UIKit.h>

@interface UIImage(TMImageEffects)

- (UIImage *)tm_applyLightEffect;
- (UIImage *)tm_applyExtraLightEffect;
- (UIImage *)tm_applyDarkEffect;
- (UIImage *)tm_applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)tm_applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

@end
