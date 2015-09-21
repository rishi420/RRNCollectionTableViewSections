//
//  RRNTableCollectionViewController.h
//  Example
//
//  Created by Robert Nash on 20/09/2015.
//  Copyright © 2015 Robert Nash. All rights reserved.
//

#import "RRNCollectionTableViewCellProtocol.h"

@interface RRNTableCollectionViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, RRNCollectionTableViewCellDatasource, RRNCollectionTableViewCellDelegate>

-(NSArray *)model;
-(UICollectionViewLayout *)rrnCollectionViewLayoutForTableViewSection:(NSUInteger)section;

@end
