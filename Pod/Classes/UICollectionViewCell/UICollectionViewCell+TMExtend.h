//
//  UICollectionViewCell+Extend.h
//  Pods
//
//  Created by LinXiaoBin on 2017/2/14.
//
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell(TMExtend)

+ (NSString *)tm_reuseIdentifier;
+ (void)tm_registerMainBundleNibToCollectionView:(UICollectionView *)collectionView;
+ (void)tm_registerClassToCollectionView:(UICollectionView *)collectionView;
+ (void)tm_registerNibToCollectionView:(UINib *)nib collectionView:(UICollectionView *)collectionView;

@end
