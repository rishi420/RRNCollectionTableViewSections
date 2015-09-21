//
//  RRNCollectionViewController.m
//  RRNCollectionViewMenu
//
//  Created by Robert Nash on 20/09/2015.
//  Copyright © 2015 Robert Nash. All rights reserved.
//

#import "RRNCollectionViewController.h"
#import "RRNSectionItem.h"

@interface RRNCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionViewLayout *layout;
@end

@implementation RRNCollectionViewController

-(instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super init];
    if (self) {
        _layout = layout;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.layout];
    collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [self.view addSubview:collectionView];
    [self.view addConstraints:[self constraintsForCollectionViewControllerView:collectionView]];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    
    self.collectionView = collectionView;
}

-(NSArray *)constraintsForCollectionViewControllerView:(UIView *)view {
    
    NSMutableSet *collector = [NSMutableSet new];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(view);
    NSArray *constraints;
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|" options:0 metrics:nil views:views];
    [collector addObjectsFromArray:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|" options:0 metrics:nil views:views];
    [collector addObjectsFromArray:constraints];
    
    return [collector allObjects];
}

-(void)setItem:(RRNSectionItem *)item {
    _item = item;
    [self.collectionView reloadData];
    [self.collectionView setContentOffset:_item.contentOffset];
}

#pragma mark - UICollectionView

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.item.collectionItems.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //id collectionViewModelItem = self.item.collectionItems[indexPath.row];
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate collectionViewController:self didDeselectItemAtIndexPath:indexPath];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate collectionViewController:self didSelectItemAtIndexPath:indexPath];
}

#pragma mark - ScrollView

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.item.contentOffset = scrollView.contentOffset;
}

@end
