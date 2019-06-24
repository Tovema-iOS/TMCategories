//
//  UILabel+TMExtend.h
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/9.
//

#import <UIKit/UIKit.h>
#import "TMCategories.h"

@interface UILabel(TMBuilder)

TM_UIVIEW_BUILDER_HEADER(UILabel);

/**
 Generate a empty UILabel
 */
+ (UILabel *)tm_label;

/**
 set text and return self
 */
- (UILabel * (^)(NSString *text))tm_text;

/**
 set attributedText and return self
 */
- (UILabel * (^)(NSAttributedString *attributedText))tm_attributedText;

/**
 set font and return self
 */
- (UILabel * (^)(UIFont *font))tm_font;

/**
 set textColor and return self
 */
- (UILabel * (^)(UIColor *color))tm_textColor;

/**
 set shadowColor and return self
 */
- (UILabel * (^)(UIColor *color))tm_shadowColor;

/**
 set shadowOffset and return self
 */
- (UILabel * (^)(CGSize shadowOffset))tm_shadowOffset;

/**
 set highlightedTextColor and return self
 */
- (UILabel * (^)(UIColor *color))tm_highlightedTextColor;

/**
 set textAlignment and return self
 */
- (UILabel * (^)(NSTextAlignment textAlignment))tm_textAlignment;

/**
 set lineBreakMode and return self
 */
- (UILabel * (^)(NSLineBreakMode lineBreakMode))tm_lineBreakMode;

/**
 set numberOfLines and return self
 */
- (UILabel * (^)(NSInteger numberOfLines))tm_numberOfLines;

/**
 set adjustsFontSizeToFitWidth and return self
 */
- (UILabel * (^)(BOOL adjustsFontSizeToFitWidth))tm_adjustsFontSizeToFitWidth;

/**
 set baselineAdjustment and return self
 */
- (UILabel * (^)(UIBaselineAdjustment baselineAdjustment))tm_baselineAdjustment;

/**
 set minimumScaleFactor and return self
 */
- (UILabel * (^)(CGFloat minimumScaleFactor))tm_minimumScaleFactor;

/**
 set preferredMaxLayoutWidth and return self
 */
- (UILabel * (^)(CGFloat preferredMaxLayoutWidth))tm_preferredMaxLayoutWidth;

@end
