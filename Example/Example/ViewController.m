//
//  ViewController.m
//  Example
//
//  Created by Robert Nash on 20/09/2015.
//  Copyright © 2015 Robert Nash. All rights reserved.
//

#import "ViewController.h"
#import "FakeModelBuilder.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *menu;
@end

@implementation ViewController

-(NSArray *)menu {
    if (_menu == nil) {
        _menu = [FakeModelBuilder buildMenu];
    }
    return _menu;
}

-(NSArray *)model {
    return self.menu;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    switch (section) {
            
        default:
            return [NSString stringWithFormat:@"Section %li", section];
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0f;
}

-(UICollectionViewLayout *)rrnCollectionViewLayoutForTableViewSection:(NSUInteger)section {
    
    //id <RRNCollectionTableViewSectionItemProtocol> item = [self model][section];
    
//    switch (section) {
//            
//        default:
//            return [[UICollectionViewFlowLayout alloc] init];
//            break;
//    }
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return flowLayout;
}

#pragma mark - RRNCollectionTableViewCell Delegate

-(void)collectionTableViewCell:(UITableViewCell <RRNCollectionTableViewCellProtocol> *)cell didSelectItemAtCollectionViewIndexPath:(NSIndexPath *)indexPath {
    
    NSUInteger section = cell.tag;
    
    id <RRNCollectionTableViewSectionItemProtocol> tableSectionItem = [self model][section];
    id collectionViewModelItem = tableSectionItem.collectionItems[indexPath.row];
    
    [self responseAtCollectionViewLevelWithModel:collectionViewModelItem
                       atCollectionViewIndexPath:indexPath];
    
    [self responseAtTableViewLevelWithModel:tableSectionItem
                          atTableViewIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
}

-(void)collectionTableViewCell:(UITableViewCell <RRNCollectionTableViewCellProtocol> *)cell didDeselectItemAtCollectionViewIndexPath:(NSIndexPath *)indexPath {
    
    NSUInteger section = cell.tag;
    
    id <RRNCollectionTableViewSectionItemProtocol> tableSectionItem = [self model][section];
    id collectionViewModelItem = tableSectionItem.collectionItems[indexPath.row];
    
    [self responseAtCollectionViewLevelWithModel:collectionViewModelItem
                       atCollectionViewIndexPath:indexPath];
    
    [self responseAtTableViewLevelWithModel:tableSectionItem
                          atTableViewIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
}

-(void)responseAtTableViewLevelWithModel:(id <RRNCollectionTableViewSectionItemProtocol>)item atTableViewIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"responseAtTableViewLevelWithModel indexPathRow = %ld", (long)indexPath.row);
}

-(void)responseAtCollectionViewLevelWithModel:(id)item atCollectionViewIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"responseAtCollectionViewLevelWithModel indexPathRow = %ld", (long)indexPath.row);
}

@end
