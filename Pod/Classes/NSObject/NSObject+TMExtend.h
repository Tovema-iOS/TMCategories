//
//  NSObject+TMExtend.h
//  TMCategories
//
//  Created by Xiaobin Lin on 2018/8/8.
//

#import <Foundation/Foundation.h>

@interface NSObject(TMExtend)

@property (class, nonatomic, copy, readonly) NSString *tm_className;

@property (nonatomic, copy, readonly) NSString *tm_className;


/**
 perform selector with more parameters ignore return value
 
 @param selector selector
 @param objects parameters
 */
- (void)tm_performSelector:(SEL)selector withObjects:(NSArray *)objects;

/**
 perform selector with more parameters

 @param selector selector
 @param objects parameters
 @param retLoc return value location
 */
- (void)tm_performSelector:(SEL)selector withObjects:(NSArray *)objects returnLoc:(void *)retLoc;

@end
