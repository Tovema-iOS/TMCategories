//
//  UIControl+TMExtend.m
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/8.
//

#import "UIControl+TMExtend.h"
#import <objc/runtime.h>

static char *TM_UIBUTTON_BLOCK_KEY = "TM_UIBUTTON_BLOCK_KEY";

@implementation UIControl (TMExtend)

- (void)tm_handleControlEvents:(UIControlEvents)controlEvents callback:(TMControlCallback)block
{
    objc_setAssociatedObject(self, TM_UIBUTTON_BLOCK_KEY, block, OBJC_ASSOCIATION_COPY);
    if ([self actionsForTarget:self forControlEvent:controlEvents]) {
        [self removeTarget:self action:@selector(tm_invokeControlEventBlock:) forControlEvents:controlEvents];
    }

    [self addTarget:self action:@selector(tm_invokeControlEventBlock:) forControlEvents:controlEvents];
}

- (void)tm_invokeControlEventBlock:(id)sender
{
    TMControlCallback block = objc_getAssociatedObject(self, TM_UIBUTTON_BLOCK_KEY);
    if (block) {
        block(sender);
    }
}

@end
