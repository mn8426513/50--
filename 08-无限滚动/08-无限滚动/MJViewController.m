//
//  MJViewController.m
//  08-无限滚动
//
//  Created by apple on 14-5-31.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJNewsCell.h"
#import "MJNews.h"
#import "MJExtension.h"

@interface MJViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *newses;
@end

@implementation MJViewController
- (NSArray *)newses
{
    if (!_newses) {
        self.newses = [MJNews objectArrayWithFilename:@"newses.plist"];
    }
    return _newses;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"MJNewsCell" bundle:nil] forCellWithReuseIdentifier:@"news"];
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:2500 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.newses.count * 1000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"news";
    MJNewsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.news = self.newses[indexPath.item % self.newses.count];
    
    return cell;
}

@end
