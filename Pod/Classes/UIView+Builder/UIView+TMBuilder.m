//
//  UIView+TMExtend.m
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/9.
//

#import "UIView+TMBuilder.h"

@implementation UIView (TMBuilder)

- (UIView * (^)(CGRect frame))tm_frame
{
    return ^id(CGRect frame) {
        self.frame = frame;
        return self;
    };
}

- (UIView * (^)(UIColor *color))tm_backgroundColor
{
    return ^id(UIColor *color) {
        self.backgroundColor = color;
        return self;
    };
}

- (UIView * (^)(CGFloat radius))tm_cornerRadius
{
    return ^id(CGFloat radius) {
        self.layer.cornerRadius = radius;
        self.clipsToBounds = YES;
        return self;
    };
}

- (UIView * (^)(CGFloat borderWidth))tm_borderWidth
{
    return ^id(CGFloat borderWidth) {
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

- (UIView * (^)(UIColor *color))tm_borderColor
{
    return ^id(UIColor *color) {
        self.layer.borderColor = color.CGColor;
        return self;
    };
}

- (UIView * (^)(BOOL clip))tm_clipToTounds
{
    return ^id(BOOL clip) {
        self.clipsToBounds = clip;
        return self;
    };
}

- (UIView * (^)(BOOL clip))tm_userInteractionEnabled
{
    return ^id(BOOL userInteractionEnabled) {
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}

- (UIView * (^)(UIView *view))tm_superView
{
    return ^id(UIView *view) {
        [view addSubview:self];
        return self;
    };
}

@end
