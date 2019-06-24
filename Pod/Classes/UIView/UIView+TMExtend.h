//
//  UIView+TMExtend.h
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/9.
//

#import <UIKit/UIKit.h>

@interface UIView(TMExtend)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign, readonly) CGFloat tm_safeTop;
@property (nonatomic, assign, readonly) CGFloat tm_safeBottom;

@end
