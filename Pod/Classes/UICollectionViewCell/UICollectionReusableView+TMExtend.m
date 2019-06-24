//
//  UICollectionReusableView+Extend.m
//  Pods
//
//  Created by LinXiaoBin on 2017/2/14.
//
//

#import "UICollectionReusableView+TMExtend.h"

@implementation UICollectionReusableView (TMExtend)

+ (NSString *)tm_reuseIdentifier
{
    return NSStringFromClass(self);
}

+ (void)tm_registerMainBundleNibToCollectionView:(UICollectionView *)collectionView forSupplementaryViewOfKind:(NSString *)kind
{
    NSString *identifier = [self tm_reuseIdentifier];
    UINib *cellNib = [UINib nibWithNibName:identifier bundle:[NSBundle mainBundle]];
    [collectionView registerNib:cellNib forSupplementaryViewOfKind:kind withReuseIdentifier:[self tm_reuseIdentifier]];
}

+ (void)tm_registerClassToCollectionView:(UICollectionView *)collectionView forSupplementaryViewOfKind:(NSString *)kind
{
    [collectionView registerClass:self forSupplementaryViewOfKind:kind withReuseIdentifier:[self tm_reuseIdentifier]];
}

+ (void)tm_registerNibToCollectionView:(UINib *)nib collectionView:(UICollectionView *)collectionView forSupplementaryViewOfKind:(NSString *)kind
{
    [collectionView registerNib:nib forSupplementaryViewOfKind:kind withReuseIdentifier:[self tm_reuseIdentifier]];
}

@end
