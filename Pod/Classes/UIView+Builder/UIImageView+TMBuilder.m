//
//  UIImageView+TMBuilder.m
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/9.
//

#import "UIImageView+TMBuilder.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"

@implementation UIImageView (TMBuilder)

#pragma clang diagnostic pop

+ (instancetype)tm_imageView
{
    return [[UIImageView alloc] init];
}

- (UIImageView * (^)(UIImage *image))tm_image
{
    return ^id(UIImage *image) {
        self.image = image;
        return self;
    };
}

- (UIImageView * (^)(UIImage *image))tm_highlightedImage
{
    return ^id(UIImage *image) {
        self.highlightedImage = image;
        return self;
    };
}

@end
