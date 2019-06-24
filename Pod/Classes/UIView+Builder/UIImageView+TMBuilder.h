//
//  UIImageView+TMBuilder.h
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/9.
//

#import <UIKit/UIKit.h>
#import "TMCategories.h"

@interface UIImageView(TMBuilder)

TM_UIVIEW_BUILDER_HEADER(UIImageView);

+ (instancetype)tm_imageView;

- (UIImageView * (^)(UIImage *image))tm_image;

- (UIImageView * (^)(UIImage *image))tm_highlightedImage;

@end
