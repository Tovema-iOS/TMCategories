//
//  UIView+TMExtend.m
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/9.
//

#import "UIView+TMExtend.h"

@implementation UIView (TMExtend)


- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)tm_safeTop
{
    if (@available(iOS 11, *)) {
        return self.safeAreaInsets.top;
    }
    return 0;
}

- (CGFloat)tm_safeBottom
{
    if (@available(iOS 11, *)) {
        return self.safeAreaInsets.bottom;
    }
    return 0;
}

@end
