//
//  UILabel+TMExtend.m
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/9.
//

#import "UILabel+TMBuilder.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"

@implementation UILabel (TMBuilder)

#pragma clang diagnostic pop

+ (UILabel *)tm_label
{
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    return label;
}

- (UILabel * (^)(NSString *text))tm_text
{
    return ^id(NSString *text) {
        self.text = text;
        return self;
    };
}

- (UILabel * (^)(NSAttributedString *attributedText))tm_attributedText
{
    return ^id(NSAttributedString *attributedText) {
        self.attributedText = attributedText;
        return self;
    };
}

- (UILabel * (^)(UIFont *font))tm_font
{
    return ^id(UIFont *font) {
        self.font = font;
        return self;
    };
}

- (UILabel * (^)(UIColor *color))tm_textColor
{
    return ^id(UIColor *color) {
        self.textColor = color;
        return self;
    };
}

- (UILabel * (^)(UIColor *color))tm_shadowColor
{
    return ^id(UIColor *color) {
        self.shadowColor = color;
        return self;
    };
}

- (UILabel * (^)(CGSize shadowOffset))tm_shadowOffset
{
    return ^id(CGSize shadowOffset) {
        self.shadowOffset = shadowOffset;
        return self;
    };
}

- (UILabel * (^)(UIColor *color))tm_highlightedTextColor
{
    return ^id(UIColor *color) {
        self.highlightedTextColor = color;
        return self;
    };
}

- (UILabel * (^)(NSTextAlignment textAlignment))tm_textAlignment
{
    return ^id(NSTextAlignment textAlignment) {
        self.textAlignment = textAlignment;
        return self;
    };
}

- (UILabel * (^)(NSLineBreakMode lineBreakMode))tm_lineBreakMode
{
    return ^id(NSLineBreakMode lineBreakMode) {
        self.lineBreakMode = lineBreakMode;
        return self;
    };
}

- (UILabel * (^)(NSInteger numberOfLines))tm_numberOfLines
{
    return ^id(NSInteger numberOfLines) {
        self.numberOfLines = numberOfLines;
        return self;
    };
}

- (UILabel * (^)(BOOL adjustsFontSizeToFitWidth))tm_adjustsFontSizeToFitWidth
{
    return ^id(BOOL adjustsFontSizeToFitWidth) {
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
        return self;
    };
}

- (UILabel * (^)(UIBaselineAdjustment baselineAdjustment))tm_baselineAdjustment
{
    return ^id(UIBaselineAdjustment baselineAdjustment) {
        self.baselineAdjustment = baselineAdjustment;
        return self;
    };
}

- (UILabel * (^)(CGFloat minimumScaleFactor))tm_minimumScaleFactor
{
    return ^id(CGFloat minimumScaleFactor) {
        self.minimumScaleFactor = minimumScaleFactor;
        return self;
    };
}

- (UILabel * (^)(CGFloat preferredMaxLayoutWidth))tm_preferredMaxLayoutWidth
{
    return ^id(CGFloat preferredMaxLayoutWidth) {
        self.preferredMaxLayoutWidth = preferredMaxLayoutWidth;
        return self;
    };
}

@end
