//
//  ViewController.m
//  UICollectionViewCoverFlow
//
//  Created by Han Mingjie on 2020/7/9.
//  Copyright © 2020 MingJie Han. All rights reserved.
//

#import "CoverFlowViewController.h"
#import "CollectionViewCell.h"
#import "UICollectionViewFlowLayout_CoverFlow.h"
@interface CoverFlowViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>{
    UICollectionView *myCollectionView;
    NSMutableArray * colorArray;
    NSMutableArray <NSString *>* sources_array;
}

@end

@implementation CoverFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CoverFlow Demo";
    colorArray = [[NSMutableArray alloc] init];
    sources_array = [[NSMutableArray alloc] init];
    for (int i = 0; i < 50; i ++) {
        int R = (arc4random() % 256);
        int G = (arc4random() % 256);
        int B = (arc4random() % 256) ;
        NSDictionary *dic = @{@"color":[UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1]};
        [colorArray addObject:dic];
        [sources_array addObject:[NSString stringWithFormat:@"Block %d\nRed:%d\nGreen:%d\nBlue:%d",i,R,G,B]];
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (nil == myCollectionView){
        UICollectionViewFlowLayout_CoverFlow *collectionFlowLayout = [[UICollectionViewFlowLayout_CoverFlow alloc] init];
        collectionFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        collectionFlowLayout.itemSize = CGSizeMake(167, 167);
        
        myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height-300.f)/2.f, self.view.frame.size.width, 300.f) collectionViewLayout:collectionFlowLayout];
        myCollectionView.backgroundColor = [UIColor whiteColor];
        [myCollectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        myCollectionView.dataSource = self;
        myCollectionView.delegate = self;
        myCollectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
        [self.view addSubview:myCollectionView];
    }
}



#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    id objc = [colorArray objectAtIndex:sourceIndexPath.item];
    [colorArray removeObject:objc];
    [colorArray insertObject:objc atIndex:destinationIndexPath.item];
    
    objc = [sources_array objectAtIndex:sourceIndexPath.item];
    [sources_array removeObject:objc];
    [sources_array insertObject:objc atIndex:destinationIndexPath.item];
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(167, 167);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 15;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 13, 15, 13);
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return colorArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell loadWithModel:colorArray[indexPath.row]];
    cell.name = [sources_array objectAtIndex:indexPath.row];
    return cell;
}

@end
