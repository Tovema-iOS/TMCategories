//
//  UICollectionReusableView+Extend.h
//  Pods
//
//  Created by LinXiaoBin on 2017/2/14.
//
//

#import <UIKit/UIKit.h>

@interface UICollectionReusableView(TMExtend)

+ (NSString *)tm_reuseIdentifier;
+ (void)tm_registerMainBundleNibToCollectionView:(UICollectionView *)collectionView forSupplementaryViewOfKind:(NSString *)kind;
+ (void)tm_registerClassToCollectionView:(UICollectionView *)collectionView forSupplementaryViewOfKind:(NSString *)kind;
+ (void)tm_registerNibToCollectionView:(UINib *)nib collectionView:(UICollectionView *)collectionView forSupplementaryViewOfKind:(NSString *)kind;

@end
