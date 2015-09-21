//
//  RRNCollectionViewController.h
//  RRNCollectionViewMenu
//
//  Created by Robert Nash on 20/09/2015.
//  Copyright © 2015 Robert Nash. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RRNCollectionViewController;
@protocol RRNCollectionViewControllerDelegate <NSObject>
-(void)collectionViewController:(RRNCollectionViewController *)controller didDeselectItemAtIndexPath:(NSIndexPath *)indexPath;
-(void)collectionViewController:(RRNCollectionViewController *)controller didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
@end

@class RRNSectionItem;
@interface RRNCollectionViewController : UIViewController
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) RRNSectionItem *item;
@property (nonatomic, weak) id <RRNCollectionViewControllerDelegate> delegate;
-(instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout;
@end
