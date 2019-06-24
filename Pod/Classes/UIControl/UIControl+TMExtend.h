//
//  UIControl+TMExtend.h
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/8.
//

#import <UIKit/UIKit.h>

typedef void (^TMControlCallback)(__kindof UIControl *control);

@interface UIControl(TMExtend)

/**
 UIControl 事件 Block 回调封装
 注意该方法不支持注册多个不同的 UIControlEvents
 */
- (void)tm_handleControlEvents:(UIControlEvents)controlEvents callback:(TMControlCallback)block;

@end
