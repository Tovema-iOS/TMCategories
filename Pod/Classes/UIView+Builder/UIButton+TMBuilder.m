//
//  UIButton+TMExtend.m
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/9.
//

#import "UIButton+TMBuilder.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"

@implementation UIButton (TMBuilder)

#pragma clang diagnostic pop

+ (UIButton *)tm_button
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    return button;
}

- (UIButton * (^)(UIEdgeInsets insets))tm_contentEdgeInsets
{
    return ^id(UIEdgeInsets insets) {
        self.contentEdgeInsets = insets;
        return self;
    };
}

- (UIButton * (^)(UIEdgeInsets insets))tm_titleEdgeInsets
{
    return ^id(UIEdgeInsets insets) {
        self.titleEdgeInsets = insets;
        return self;
    };
}

- (UIButton * (^)(UIEdgeInsets insets))tm_imageEdgeInsets
{
    return ^id(UIEdgeInsets insets) {
        self.imageEdgeInsets = insets;
        return self;
    };
}

- (UIButton * (^)(NSString *title))tm_normalTitle
{
    return ^id(NSString *title) {
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton * (^)(UIColor *color))tm_normalTitleColor
{
    return ^id(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton * (^)(UIColor *color))tm_normalTitleShadowColor
{
    return ^id(UIColor *color) {
        [self setTitleShadowColor:color forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton * (^)(UIImage *image))tm_normalImage
{
    return ^id(UIImage *image) {
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton * (^)(UIImage *image))tm_normalBackgroundImage
{
    return ^id(UIImage *image) {
        [self setBackgroundImage:image forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton * (^)(NSAttributedString *title))tm_normalAttributedTitle
{
    return ^id(NSAttributedString *title) {
        [self setAttributedTitle:title forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton * (^)(NSString *title))tm_highlightedTitle
{
    return ^id(NSString *title) {
        [self setTitle:title forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton * (^)(UIColor *color))tm_highlightedTitleColor
{
    return ^id(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton * (^)(UIColor *color))tm_highlightedTitleShadowColor
{
    return ^id(UIColor *color) {
        [self setTitleShadowColor:color forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton * (^)(UIImage *image))tm_highlightedImage
{
    return ^id(UIImage *image) {
        [self setImage:image forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton * (^)(UIImage *image))tm_highlightedBackgroundImage
{
    return ^id(UIImage *image) {
        [self setBackgroundImage:image forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton * (^)(NSAttributedString *title))tm_highlightedAttributedTitle
{
    return ^id(NSAttributedString *title) {
        [self setAttributedTitle:title forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton * (^)(NSString *title))tm_disabledTitle
{
    return ^id(NSString *title) {
        [self setTitle:title forState:UIControlStateDisabled];
        return self;
    };
}

- (UIButton * (^)(UIColor *color))tm_disabledTitleColor
{
    return ^id(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateDisabled];
        return self;
    };
}

- (UIButton * (^)(UIColor *color))tm_disabledTitleShadowColor
{
    return ^id(UIColor *color) {
        [self setTitleShadowColor:color forState:UIControlStateDisabled];
        return self;
    };
}

- (UIButton * (^)(UIImage *image))tm_disabledImage
{
    return ^id(UIImage *image) {
        [self setImage:image forState:UIControlStateDisabled];
        return self;
    };
}

- (UIButton * (^)(UIImage *image))tm_disabledBackgroundImage
{
    return ^id(UIImage *image) {
        [self setBackgroundImage:image forState:UIControlStateDisabled];
        return self;
    };
}

- (UIButton * (^)(NSAttributedString *title))tm_disablededAttributedTitle
{
    return ^id(NSAttributedString *title) {
        [self setAttributedTitle:title forState:UIControlStateDisabled];
        return self;
    };
}

- (UIButton * (^)(NSString *title))tm_selectedTitle
{
    return ^id(NSString *title) {
        [self setTitle:title forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton * (^)(UIColor *color))tm_selectedTitleColor
{
    return ^id(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton * (^)(UIColor *color))tm_selectedTitleShadowColor
{
    return ^id(UIColor *color) {
        [self setTitleShadowColor:color forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton * (^)(UIImage *image))tm_selectedImage
{
    return ^id(UIImage *image) {
        [self setImage:image forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton * (^)(UIImage *image))tm_selectedBackgroundImage
{
    return ^id(UIImage *image) {
        [self setBackgroundImage:image forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton * (^)(NSAttributedString *title))tm_selectededAttributedTitle
{
    return ^id(NSAttributedString *title) {
        [self setAttributedTitle:title forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton * (^)(NSString *title))tm_focusedtle
{
    return ^id(NSString *title) {
        if (@available(iOS 9.0, *)) {
            [self setTitle:title forState:UIControlStateFocused];
        }
        return self;
    };
}

- (UIButton * (^)(UIColor *color))tm_focusedtleColor
{
    return ^id(UIColor *color) {
        if (@available(iOS 9.0, *)) {
            [self setTitleColor:color forState:UIControlStateFocused];
        }
        return self;
    };
}

- (UIButton * (^)(UIColor *color))tm_focusedtleShadowColor
{
    return ^id(UIColor *color) {
        if (@available(iOS 9.0, *)) {
            [self setTitleShadowColor:color forState:UIControlStateFocused];
        }
        return self;
    };
}

- (UIButton * (^)(UIImage *image))tm_focusedage
{
    return ^id(UIImage *image) {
        if (@available(iOS 9.0, *)) {
            [self setImage:image forState:UIControlStateFocused];
        }
        return self;
    };
}

- (UIButton * (^)(UIImage *image))tm_focusedckgroundImage
{
    return ^id(UIImage *image) {
        if (@available(iOS 9.0, *)) {
            [self setBackgroundImage:image forState:UIControlStateFocused];
        }
        return self;
    };
}

- (UIButton * (^)(NSAttributedString *title))tm_focusedAttributedTitle
{
    return ^id(NSAttributedString *title) {
        if (@available(iOS 9.0, *)) {
            [self setAttributedTitle:title forState:UIControlStateFocused];
        }
        return self;
    };
}

@end
