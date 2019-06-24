//
//  UIImage+TMExtend.h
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/8.
//

#import <UIKit/UIKit.h>

@interface UIImage(TMExtend)

@property (class, nonatomic, readonly) CGFloat tm_defaultImageScale;
@property (nonatomic, readonly) CGFloat tm_defaultImageScale;

#pragma mark - UIImage Factory

/**
 Generate image with color
 */
+ (UIImage *)tm_imageWithColor:(UIColor *)color;

/**
 Generate image with color

 @param color color
 @param size image size
 */
+ (UIImage *)tm_imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 Generate image with view
 */
+ (UIImage *)tm_imageWithView:(UIView *)view;

/**
 Generate image with image
 */
+ (UIImage *)tm_imageWithImage:(UIImage *)image;

/**
 Generate image with images
 */
+ (UIImage *)tm_imageWithImages:(NSArray *)images size:(CGSize)size;

/**
 Generate image with images
 */
+ (UIImage *)tm_imageWithImages:(NSArray *)images size:(CGSize)size scale:(CGFloat)scale;

#pragma mark -  UIImage Mask

/**
 Generate masked image
 mask image will be scale to self image size at first

 @param maskImage mask image
 */
- (UIImage *)tm_imageWithMaskImage:(UIImage *)maskImage;

/**
 Generate masked image
 mask image and self image will be scale to scaleSize at first
 
 @param maskImage mask image
 @param scaleSize scale size
 */
- (UIImage *)tm_imageWithMaskImage:(UIImage *)maskImage scaleSize:(CGSize)scaleSize;

#pragma mark -  UIImage Scale

- (UIImage *)tm_scaleImageToScreenSize;
- (UIImage *)tm_scaleImageToSize:(CGSize)size;
- (UIImage *)tm_scaleImageToSize:(CGSize)size scale:(CGFloat)scale;
- (UIImage *)tm_jpgWithCompressionQuality:(CGFloat)compressionQuality;

#pragma mark -  UIImage SubImage
- (UIImage *)tm_subImageInFrame:(CGRect)frame;

#pragma mark -  UIImage File
- (BOOL)tm_writeToFile:(NSString *)path;
- (BOOL)tm_writeJPGToFile:(NSString *)path compressionQuality:(CGFloat)compressionQuality;

+ (void)tm_downloadImage:(NSString *)url toPath:(NSString *)path completion:(void (^)(BOOL succeed))completion;

#pragma mark -  UIImage Blur
- (UIImage *)tm_blurImageWithBlur:(CGFloat)blur;

@end
