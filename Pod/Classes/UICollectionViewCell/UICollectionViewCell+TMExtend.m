//
//  UICollectionViewCell+Extend.m
//  Pods
//
//  Created by LinXiaoBin on 2017/2/14.
//
//

#import "UICollectionViewCell+TMExtend.h"

@implementation UICollectionViewCell (TMExtend)

+ (NSString *)tm_reuseIdentifier
{
    return NSStringFromClass(self);
}

+ (void)tm_registerMainBundleNibToCollectionView:(UICollectionView *)collectionView
{
    NSString *identifier = [self tm_reuseIdentifier];
    UINib *cellNib = [UINib nibWithNibName:identifier bundle:[NSBundle mainBundle]];
    [collectionView registerNib:cellNib forCellWithReuseIdentifier:[self tm_reuseIdentifier]];
}

+ (void)tm_registerClassToCollectionView:(UICollectionView *)collectionView
{
    [collectionView registerClass:self forCellWithReuseIdentifier:[self tm_reuseIdentifier]];
}

+ (void)tm_registerNibToCollectionView:(UINib *)nib collectionView:(UICollectionView *)collectionView
{
    [collectionView registerNib:nib forCellWithReuseIdentifier:[self tm_reuseIdentifier]];
}

@end
