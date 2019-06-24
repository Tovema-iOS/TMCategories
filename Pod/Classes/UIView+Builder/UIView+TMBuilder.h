//
//  UIView+TMExtend.h
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/9.
//

#import <UIKit/UIKit.h>

#define TM_UIVIEW_BUILDER_HEADER(TM_CLASSNAME)                 \
    -(TM_CLASSNAME * (^)(CGRect frame)) tm_frame;              \
    -(TM_CLASSNAME * (^)(UIColor * color)) tm_backgroundColor; \
    -(TM_CLASSNAME * (^)(CGFloat radius)) tm_cornerRadius;     \
    -(TM_CLASSNAME * (^)(CGFloat borderWidth)) tm_borderWidth; \
    -(TM_CLASSNAME * (^)(UIColor * color)) tm_borderColor;     \
    -(TM_CLASSNAME * (^)(BOOL clip)) tm_clipToTounds;          \
    -(TM_CLASSNAME * (^)(UIView * view)) tm_superView;

@interface UIView(TMBuilder)

/**
 set frame and return self
 */
- (UIView * (^)(CGRect frame))tm_frame;

/**
 set backgroundColor and return self
 */
- (UIView * (^)(UIColor *color))tm_backgroundColor;

/**
 set cornerRadius and return self
 */
- (UIView * (^)(CGFloat radius))tm_cornerRadius;

/**
 set borderWidth and return self
 */
- (UIView * (^)(CGFloat borderWidth))tm_borderWidth;

/**
 set borderColor and return self
 */
- (UIView * (^)(UIColor *color))tm_borderColor;

/**
 set clipToTounds and return self
 */
- (UIView * (^)(BOOL clip))tm_clipToTounds;

/**
 set userInteractionEnabled and return self
 */
- (UIView * (^)(BOOL userInteractionEnabled))tm_userInteractionEnabled;

/**
 add self to super view and return self
 */
- (UIView * (^)(UIView *view))tm_superView;

@end
