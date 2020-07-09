//
//  UIFlowLayout.m
//  UICollectionViewCoverFlow
//
//  Created by Han Mingjie on 2020/7/9.
//  Copyright © 2020 MingJie Han. All rights reserved.
//

#import "UICollectionViewFlowLayout_CoverFlow.h"
@implementation UICollectionViewFlowLayout_CoverFlow
- (void)prepareLayout {
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGFloat margin = (self.collectionView.frame.size.width - self.itemSize.width) / 2;
    self.collectionView.contentInset = UIEdgeInsetsMake(0, margin, 0, margin);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attributesArray = [super layoutAttributesForElementsInRect:rect];
    CGFloat ceterX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    for (UICollectionViewLayoutAttributes *attributes in attributesArray) {
        CGFloat delta = ABS(attributes.center.x - ceterX);
        CGFloat scale = 1.1 - delta / self.collectionView.frame.size.width;
        attributes.transform = CGAffineTransformMakeScale(scale, scale);
    }
    return attributesArray;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    CGRect rect;
    rect.origin.y = 0;
    rect.origin.x = proposedContentOffset.x;
    rect.size = self.collectionView.frame.size;

    NSArray *arr = [super layoutAttributesForElementsInRect:rect];
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;

    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in arr) {
        if (ABS(minDelta) > ABS(attrs.center.x - centerX)) {
            minDelta = attrs.center.x - centerX;
        }
    }
    proposedContentOffset.x += minDelta;
    return proposedContentOffset;
}

@end
