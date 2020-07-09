//
//  CollectionViewCell.m
//  UICollectionViewCoverFlow
//
//  Created by Han Mingjie on 2020/7/9.
//  Copyright © 2020 MingJie Han. All rights reserved.
//

#import "CollectionViewCell.h"


@interface CollectionViewCell(){
    UIImageView *img;
}

@end


@implementation CollectionViewCell
@synthesize name;


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor clearColor];
        
        img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        img.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        img.contentMode = UIViewContentModeScaleAspectFill;
        img.layer.masksToBounds = YES;
        [img.layer setCornerRadius:5];
        [self.contentView addSubview:img];
    }
    return self;
}

- (void)loadWithModel:(NSDictionary *)model{
    img.backgroundColor = model[@"color"];
}
@end
