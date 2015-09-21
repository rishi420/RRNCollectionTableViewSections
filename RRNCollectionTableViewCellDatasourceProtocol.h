//
//  RRNCollectionTableViewCellDatasourceProtocol.h
//  RRNCollectionViewMenu
//
//  Created by Robert Nash on 20/09/2015.
//  Copyright © 2015 Robert Nash. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RRNCollectionTableViewCellProtocol;
@protocol RRNCollectionTableViewCellDatasource <NSObject>
-(UIViewController *)rrnCollectionTableViewCell:(UITableViewCell <RRNCollectionTableViewCellProtocol> *)cell parentControllerForController:(UIViewController *)controller;
-(UICollectionViewLayout *)rrnCollectionViewLayoutForTableViewSection:(NSUInteger)section;
@end
