//
//  RRNCollectionTableViewCell.m
//  RRNCollectionViewMenu
//
//  Created by Robert Nash on 20/09/2015.
//  Copyright © 2015 Robert Nash. All rights reserved.
//

#import "RRNCollectionTableViewCell.h"
#import "RRNCollectionViewController.h"
#import "RRNSectionItem.h"

@interface RRNCollectionTableViewCell () <RRNCollectionViewControllerDelegate>
@end

@implementation RRNCollectionTableViewCell

@synthesize datasource = _datasource;
@synthesize delegate = _delegate;
@synthesize controller = _controller;

-(void)setDatasource:(id<RRNCollectionTableViewCellDatasource>)datasource {
    
    if (![_datasource isEqual:datasource]) {
        
        [self.controller removeFromParentViewController];
        [self.controller didMoveToParentViewController:nil];
        [self.controller.view removeFromSuperview];
        
        _datasource = datasource;
        
        UICollectionViewLayout *layout = [datasource rrnCollectionViewLayoutForTableViewSection:self.tag];
        
        RRNCollectionViewController *controller = [[RRNCollectionViewController alloc] initWithCollectionViewLayout:layout];
        controller.delegate = self;
        controller.view.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addSubview:controller.view];
        [self addConstraints:[self constraintsForCollectionViewControllerView:controller.view]];
        
        UIViewController *parent = [datasource rrnCollectionTableViewCell:self parentControllerForController:controller];
        [parent addChildViewController:controller];
        [controller didMoveToParentViewController:parent];
        
        self.controller = controller;
    }
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

-(void)configureWithItem:(id <RRNCollectionTableViewSectionItemProtocol>)item
          withDatasource:(id<RRNCollectionTableViewCellDatasource>)datasource
            withDelegate:(id<RRNCollectionTableViewCellDelegate>)delegate {
    self.delegate = delegate;
    self.datasource = datasource;
    self.controller.item = item;
}

#pragma mark - RRNCollectionViewControllerDelegate

-(void)collectionViewController:(RRNCollectionViewController *)controller didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate collectionTableViewCell:self didSelectItemAtCollectionViewIndexPath:indexPath];
}

-(void)collectionViewController:(RRNCollectionViewController *)controller didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate collectionTableViewCell:self didDeselectItemAtCollectionViewIndexPath:indexPath];
}

@end
