//
//  UIImage+TMExtend.m
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/8.
//

#import "UIImage+TMExtend.h"
#include <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>

#ifndef isHDMachine
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#endif

@implementation UIImage (TMExtend)

+ (CGFloat)tm_defaultImageScale
{
    return [UIScreen mainScreen].scale;
}

- (CGFloat)tm_defaultImageScale
{
    return [UIImage tm_defaultImageScale];
}

#pragma mark - UIImage Factory

/**
 Generate image with color
 */
+ (UIImage *)tm_imageWithColor:(UIColor *)color
{
    return [self tm_imageWithColor:color size:CGSizeMake(1, 1)];
}

/**
 Generate image with color
 
 @param color color
 @param size image size
 */
+ (UIImage *)tm_imageWithColor:(UIColor *)color size:(CGSize)size
{
    if (CGSizeEqualToSize(size, CGSizeZero))
        return nil;

    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

/**
 Generate image with view
 */
+ (UIImage *)tm_imageWithView:(UIView *)view
{
    if (view == nil || CGSizeEqualToSize(view.frame.size, CGSizeZero))
        return nil;

    //    UIGraphicsBeginImageContext(view.frame.size);
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, self.tm_defaultImageScale);
    //====防止view缩放影响截屏区域
    CGContextConcatCTM(UIGraphicsGetCurrentContext(), view.transform);
    //===end by hm 16/9/1
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 Generate image with image
 */
+ (UIImage *)tm_imageWithImage:(UIImage *)image
{
    float scale = image.scale;
    CGSize imageSize = CGSizeMake(image.size.width * scale, image.size.height * scale);

    UIGraphicsBeginImageContext(imageSize);
    [image drawInRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return [UIImage imageWithCGImage:newImage.CGImage scale:scale orientation:UIImageOrientationUp];
}

/**
 Generate image with images
 */
+ (UIImage *)tm_imageWithImages:(NSArray *)images size:(CGSize)size
{
    return [self tm_imageWithImages:images size:size scale:self.tm_defaultImageScale];
}

/**
 Generate image with images
 */
+ (UIImage *)tm_imageWithImages:(NSArray *)images size:(CGSize)size scale:(CGFloat)scale
{
    if (!images || [images count] == 0 || CGSizeEqualToSize(size, CGSizeZero))
        return nil;

    size = CGSizeMake(size.width * scale, size.height * scale);

    UIGraphicsBeginImageContext(size);
    for (UIImage *image in images) {
        if (image && [image isKindOfClass:[UIImage class]]) {
            [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        }
    }
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return [UIImage imageWithCGImage:newImage.CGImage scale:scale orientation:UIImageOrientationUp];
}

#pragma mark -  UIImage Mask

/**
 Generate masked image
 mask image will be scale to self image size at first
 
 @param maskImage mask image
 */
- (UIImage *)tm_imageWithMaskImage:(UIImage *)maskImage
{
    return [self tm_imageWithMaskImage:maskImage scaleSize:self.size];
}

/**
 Generate masked image
 mask image and self image will be scale to scaleSize at first
 
 @param maskImage mask image
 @param scaleSize scale size
 */
- (UIImage *)tm_imageWithMaskImage:(UIImage *)maskImage scaleSize:(CGSize)scaleSize
{
    if (!maskImage || ![maskImage isKindOfClass:[UIImage class]]) {
        return self;
    }

    maskImage = [maskImage tm_scaleImageToSize:scaleSize];

    CGImageRef maskRef = [maskImage CGImage];
    CGImageRef cgMask = CGImageMaskCreate(CGImageGetWidth(maskRef), CGImageGetHeight(maskRef), CGImageGetBitsPerComponent(maskRef), CGImageGetBitsPerPixel(maskRef), CGImageGetBytesPerRow(maskRef), CGImageGetDataProvider(maskRef), NULL, true);
    CGImageRef maskedRef = CGImageCreateWithMask([self CGImage], cgMask);
    UIImage *resultImage = [UIImage imageWithCGImage:maskedRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(cgMask);
    CGImageRelease(maskedRef);

    return resultImage;
}

#pragma mark -  UIImage Scale

- (UIImage *)tm_scaleImageToScreenSize
{
    return [self tm_scaleImageToSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT) scale:self.tm_defaultImageScale];
}

- (UIImage *)tm_scaleImageToSize:(CGSize)size
{
    return [self tm_scaleImageToSize:size scale:self.scale];
}

- (UIImage *)tm_scaleImageToSize:(CGSize)size scale:(CGFloat)scale
{
    if (!self || size.width == 0 || size.height == 0)
        return nil;

    //大小未改变，返回原图
    if (CGSizeEqualToSize(self.size, size) && self.scale == scale)
        return self;

    CGSize oldSize = CGSizeMake(self.size.width * self.scale, self.size.height * self.scale);
    CGSize newSize = CGSizeMake(size.width * scale, size.height * scale);

    //得到图片的大小
    CGFloat width = oldSize.width;
    CGFloat height = oldSize.height;

    float horizontalRadio = newSize.width / width;
    float verticalRadio = newSize.height / height;
    float radio = verticalRadio > horizontalRadio ? verticalRadio : horizontalRadio;

    width = width * radio;
    height = height * radio;
    float xPos = (newSize.width - width) / 2;
    float yPos = (newSize.height - height) / 2;

    UIGraphicsBeginImageContext(newSize);
    [self drawInRect:CGRectMake(xPos, yPos, width, height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return [UIImage imageWithCGImage:scaledImage.CGImage scale:scale orientation:UIImageOrientationUp];
}

- (UIImage *)tm_jpgWithCompressionQuality:(CGFloat)compressionQuality
{
    NSData *data = UIImageJPEGRepresentation(self, compressionQuality);
    return [UIImage imageWithData:data];
}

#pragma mark -  UIImage SubImage
- (UIImage *)tm_subImageInFrame:(CGRect)frame
{
    CGSize size = frame.size;
    if (size.width == 0 || size.height == 0)
        return nil;

    float scale = self.scale;
    CGSize imageSize = CGSizeMake(frame.size.width * scale, frame.size.height * scale);
    CGRect drawFrame = CGRectMake(-frame.origin.x * scale, -frame.origin.y * scale, self.size.width * scale, self.size.height * scale);

    UIGraphicsBeginImageContext(imageSize);
    [self drawInRect:drawFrame];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    image = [UIImage imageWithCGImage:image.CGImage scale:scale orientation:self.imageOrientation];

    return image;
}

#pragma mark -  UIImage File
- (BOOL)tm_writeToFile:(NSString *)path
{
    NSData *data = nil;
    if ([[path pathExtension] compare:@"png" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
        data = UIImagePNGRepresentation(self);
    } else if ([[path pathExtension] compare:@"jpg" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
        data = UIImageJPEGRepresentation(self, 1.0);
    } else {
        data = UIImagePNGRepresentation(self);
        if (data == nil) {
            data = UIImageJPEGRepresentation(self, 1.0);
        }
    }

    return [data writeToFile:path atomically:YES];
}

- (BOOL)tm_writeJPGToFile:(NSString *)path compressionQuality:(CGFloat)compressionQuality
{
    NSData *data = nil;
    if ([[path pathExtension] compare:@"jpg" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
        data = UIImageJPEGRepresentation(self, compressionQuality);
    }

    return [data writeToFile:path atomically:YES];
}

+ (void)tm_downloadImage:(NSString *)urlString toPath:(NSString *)path completion:(void (^)(BOOL succeed))completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:urlString]];
        UIImage *image = [[UIImage alloc] initWithData:data];
        if (data != nil && image != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                BOOL result = [image tm_writeToFile:path];

                if (completion) {
                    completion(result);
                }
            });
        } else {
            if (completion) {
                completion(NO);
            }
        }
    });
}

#pragma mark -  UIImage Blur
- (UIImage *)tm_blurImageWithBlur:(CGFloat)blur
{
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 50);
    boxSize = boxSize - (boxSize % 2) + 1;

    CGImageRef img = self.CGImage;

    vImage_Buffer inBuffer, outBuffer;

    vImage_Error error;

    void *pixelBuffer;

    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);

    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);

    inBuffer.data = (void *)CFDataGetBytePtr(inBitmapData);

    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));

    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);

    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];

    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);

    free(pixelBuffer);
    CFRelease(inBitmapData);

    CGImageRelease(imageRef);

    return returnImage;
}

@end
