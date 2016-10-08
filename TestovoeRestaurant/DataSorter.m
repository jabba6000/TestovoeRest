//
//  DataSorter.m
//  TestovoeRestaurant
//
//  Created by Uri Fuholichev on 10/8/16.
//  Copyright © 2016 Andrei Karpenia. All rights reserved.
//

#import "DataSorter.h"
#import "DataCollector.h"
#import "ArrayOfCategoryImages.h"

@implementation DataSorter

- (void)createArrayOfCategoriesAndImagesFromImgArray: (NSArray *)arr{

    NSMutableArray *arrayOfCategoriesNamesWithImages = [NSMutableArray new];
    for(int x=0; x<=13; x++)
    {
        NSMutableDictionary *dict = [NSMutableDictionary new];
        [dict setObject:[arr objectAtIndex:x] forKey:@"Image"];
        [dict setObject:[[DataCollector sharedInstance] temporaryArrayOfCategoriesNames] forKey:@"Name"];
        [arrayOfCategoriesNamesWithImages insertObject:dict atIndex:x];
    }
    //Assigning of filled array to singleton's object property.
    [DataCollector sharedInstance].arrayOfCategoriesAndImages = arrayOfCategoriesNamesWithImages;
}

@end
