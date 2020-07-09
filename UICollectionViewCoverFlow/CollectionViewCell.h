//
//  CollectionViewCell.h
//  UICollectionViewCoverFlow
//
//  Created by Han Mingjie on 2020/7/9.
//  Copyright © 2020 MingJie Han. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewCell : UICollectionViewCell{
    NSString *name;
}
@property (nonatomic) NSString *name;
- (void)loadWithModel:(NSDictionary *)model;
@end

NS_ASSUME_NONNULL_END
