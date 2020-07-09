//
//  ViewController.m
//  UICollectionViewCoverFlow
//
//  Created by Han Mingjie on 2020/7/9.
//  Copyright © 2020 MingJie Han. All rights reserved.
//

#import "CoverFlowViewController.h"
#import "CollectionViewCell.h"


@interface CoverFlowViewController (){
    UICollectionView *myCollectionView;
}

@end

@implementation CoverFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (nil == myCollectionView){
        UICollectionViewFlowLayout *collectionFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        collectionFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:collectionFlowLayout];
        myCollectionView.backgroundColor = [UIColor whiteColor];
        [myCollectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        myCollectionView.dataSource = self;
        myCollectionView.delegate = self;
        myCollectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:myCollectionView];
    }
}

@end
