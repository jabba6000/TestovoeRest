//
//  DataCollector.h
//  TestovoeRestaurant
//
//  Created by Uri Fuholichev on 10/8/16.
//  Copyright © 2016 Andrei Karpenia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCollector : NSObject

@property (strong, nonatomic) NSArray *categoryNamesArray;
//Array contain categories and images for categories. It will be used in Category VC tableView
@property (strong, nonatomic) NSArray *categoryImagesArray;
@property (strong, nonatomic) NSArray *allDishesArray;

+(DataCollector *)sharedInstance;

@end
