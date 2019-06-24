//
//  UIButton+TMExtend.h
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/9.
//

#import <UIKit/UIKit.h>
#import "TMCategories.h"

@interface UIButton(TMBuilder)

TM_UIVIEW_BUILDER_HEADER(UIButton);

+ (UIButton *)tm_button;

- (UIButton * (^)(UIEdgeInsets insets))tm_contentEdgeInsets;
- (UIButton * (^)(UIEdgeInsets insets))tm_titleEdgeInsets;
- (UIButton * (^)(UIEdgeInsets insets))tm_imageEdgeInsets;

- (UIButton * (^)(NSString *title))tm_normalTitle;
- (UIButton * (^)(UIColor *color))tm_normalTitleColor;
- (UIButton * (^)(UIColor *color))tm_normalTitleShadowColor;
- (UIButton * (^)(UIImage *image))tm_normalImage;
- (UIButton * (^)(UIImage *image))tm_normalBackgroundImage;
- (UIButton * (^)(NSAttributedString *title))tm_normalAttributedTitle;

- (UIButton * (^)(NSString *title))tm_highlightedTitle;
- (UIButton * (^)(UIColor *color))tm_highlightedTitleColor;
- (UIButton * (^)(UIColor *color))tm_highlightedTitleShadowColor;
- (UIButton * (^)(UIImage *image))tm_highlightedImage;
- (UIButton * (^)(UIImage *image))tm_highlightedBackgroundImage;
- (UIButton * (^)(NSAttributedString *title))tm_highlightedAttributedTitle;

- (UIButton * (^)(NSString *title))tm_disabledTitle;
- (UIButton * (^)(UIColor *color))tm_disabledTitleColor;
- (UIButton * (^)(UIColor *color))tm_disabledTitleShadowColor;
- (UIButton * (^)(UIImage *image))tm_disabledImage;
- (UIButton * (^)(UIImage *image))tm_disabledBackgroundImage;
- (UIButton * (^)(NSAttributedString *title))tm_disablededAttributedTitle;

- (UIButton * (^)(NSString *title))tm_selectedTitle;
- (UIButton * (^)(UIColor *color))tm_selectedTitleColor;
- (UIButton * (^)(UIColor *color))tm_selectedTitleShadowColor;
- (UIButton * (^)(UIImage *image))tm_selectedImage;
- (UIButton * (^)(UIImage *image))tm_selectedBackgroundImage;
- (UIButton * (^)(NSAttributedString *title))tm_selectededAttributedTitle;

- (UIButton * (^)(NSString *title))tm_focusedtle;
- (UIButton * (^)(UIColor *color))tm_focusedtleColor;
- (UIButton * (^)(UIColor *color))tm_focusedtleShadowColor;
- (UIButton * (^)(UIImage *image))tm_focusedage;
- (UIButton * (^)(UIImage *image))tm_focusedckgroundImage;
- (UIButton * (^)(NSAttributedString *title))tm_focusedAttributedTitle;

@end
