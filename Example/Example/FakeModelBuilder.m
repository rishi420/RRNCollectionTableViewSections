//
//  FakeModelBuilder.m
//  RRNCollectionViewMenu
//
//  Created by Robert Nash on 20/09/2015.
//  Copyright © 2015 Robert Nash. All rights reserved.
//

#import "FakeModelBuilder.h"

@implementation FakeModelBuilder

+(NSArray *)buildMenu {
    
    NSMutableArray *collector = [@[] mutableCopy];
    
    RRNSectionItem *sectionItem;
    
    for (NSInteger i = 0; i < 10; i++) {
        sectionItem = [[RRNSectionItem alloc] init];
        sectionItem.collectionItems = @[[NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null]];
        [collector addObject:sectionItem];
    }
    return [collector copy];
}

@end
