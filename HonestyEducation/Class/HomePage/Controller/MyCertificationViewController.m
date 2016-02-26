//
//  MyCertificationViewController.m
//  HonestyEducation
//
//  Created by bocweb on 16/2/25.
//  Copyright © 2016年 bocweb. All rights reserved.
//

#import "MyCertificationViewController.h"
#import "MyCertificateCollectionViewCell.h"
@interface MyCertificationViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *contentCollectionView;
@end
static NSString * const reuseIdentifier = @"MyCertificateCollectionViewCell";
@implementation MyCertificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的证书";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(kUIScreenWidth/2 -10, kUIScreenWidth/3);
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 5, 5, 5);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.contentCollectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    _contentCollectionView.backgroundColor = kGlobalBg;
    _contentCollectionView.delegate = self;
    _contentCollectionView.dataSource = self;
    [self.view addSubview:self.contentCollectionView];
    [self.contentCollectionView registerNib:[UINib nibWithNibName:reuseIdentifier bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCertificateCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.photoView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"my_avartView"]];
    cell.titleLabel.text = @"我的证书啊";
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];

}


@end
