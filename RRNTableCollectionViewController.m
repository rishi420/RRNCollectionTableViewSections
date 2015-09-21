//
//  RRNTableCollectionViewController.m
//  Example
//
//  Created by Robert Nash on 20/09/2015.
//  Copyright © 2015 Robert Nash. All rights reserved.
//

#import "RRNTableCollectionViewController.h"
#import "RRNCollectionTableViewSectionItemProtocol.h"
#import "RRNCollectionTableViewCellProtocol.h"

@interface RRNTableCollectionViewController ()
@end

@implementation RRNTableCollectionViewController

-(NSArray *)model {
    return nil;
}

#pragma mark - UITableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self model].count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id <RRNCollectionTableViewSectionItemProtocol> item = [self model][indexPath.section];
    
    UITableViewCell <RRNCollectionTableViewCellProtocol> *cell = (UITableViewCell <RRNCollectionTableViewCellProtocol> *)[tableView dequeueReusableCellWithIdentifier:@"RRNCollectionTableViewCellID"];
    cell.tag = indexPath.section;
    [cell configureWithItem:item withDatasource:self withDelegate:self];
    return cell;
}

#pragma mark - RRNCollectionViewController Datasource

-(UIViewController *)rrnCollectionTableViewCell:(UITableViewCell <RRNCollectionTableViewCellProtocol> *)cell parentControllerForController:(UIViewController *)controller {
    return self;
}

-(UICollectionViewLayout *)rrnCollectionViewLayoutForTableViewSection:(NSUInteger)section {
    UICollectionViewLayout *defaultLayout = [[UICollectionViewFlowLayout alloc] init];
    return defaultLayout;
}

#pragma mark - RRNCollectionTableViewCell Delegate

-(void)collectionTableViewCell:(UITableViewCell <RRNCollectionTableViewCellProtocol> *)cell didSelectItemAtCollectionViewIndexPath:(NSIndexPath *)indexPath {

}

-(void)collectionTableViewCell:(UITableViewCell <RRNCollectionTableViewCellProtocol> *)cell didDeselectItemAtCollectionViewIndexPath:(NSIndexPath *)indexPath {
    
}

@end
