//
//  RRNCollectionTableViewCellProtocol.h
//  RRNCollectionViewMenu
//
//  Created by Robert Nash on 20/09/2015.
//  Copyright © 2015 Robert Nash. All rights reserved.
//

#import "RRNCollectionTableViewCellDatasourceProtocol.h"
#import "RRNCollectionTableViewSectionItemProtocol.h"
#import "RRNCollectionViewController.h"

@protocol RRNCollectionTableViewCellDelegate;
@protocol RRNCollectionTableViewCellProtocol <NSObject>
@property (nonatomic, weak) RRNCollectionViewController *controller;
@property (weak, nonatomic) id <RRNCollectionTableViewCellDatasource> datasource;
@property (nonatomic, weak) id <RRNCollectionTableViewCellDelegate> delegate;

-(void)configureWithItem:(id <RRNCollectionTableViewSectionItemProtocol>)item
          withDatasource:(id <RRNCollectionTableViewCellDatasource>)datasource
            withDelegate:(id <RRNCollectionTableViewCellDelegate>)delegate;
@end

@protocol RRNCollectionTableViewCellDelegate <NSObject>
-(void)collectionTableViewCell:(UITableViewCell <RRNCollectionTableViewCellProtocol> *)cell didSelectItemAtCollectionViewIndexPath:(NSIndexPath *)indexPath;
-(void)collectionTableViewCell:(UITableViewCell <RRNCollectionTableViewCellProtocol> *)cell didDeselectItemAtCollectionViewIndexPath:(NSIndexPath *)indexPath;
@end
