//
//  CategoriesViewController.m
//  TestovoeRestaurant
//
//  Created by Uri Fuholichev on 10/8/16.
//  Copyright © 2016 Andrei Karpenia. All rights reserved.
//

#import "CategoriesViewController.h"
#import "SWRevealViewController.h"
#import "DataCollector.h"
#import "DishesViewController.h"
#import "DefineID.h"

@interface CategoriesViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *categoriesTableView;
@property (strong, nonatomic) DishesViewController *dishesVC;
@property (strong, nonatomic) NSMutableArray  *arrayToPass;

@end

@implementation CategoriesViewController

- (void) viewDidLoad {
    
    _arrayToPass = [NSMutableArray new];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController ){
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    self.categoriesTableView.delegate = self;
    self.categoriesTableView.dataSource = self;
    NSLog(@"LOADED!");
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[DataCollector sharedInstance].categoryImagesArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
        cell.accessoryType = UITableViewCellAccessoryNone;
        //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [[DataCollector sharedInstance].categoryNamesArray objectAtIndex:indexPath.row] ;
    cell.imageView.image = [[DataCollector sharedInstance].categoryImagesArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // When we touch a cell in tableView we will call DetailVC with archieve data of some past request
    
    NSString *selectedCategoryName = [NSString stringWithString:[[DataCollector sharedInstance].categoryNamesArray  objectAtIndex:indexPath.row]];
    DefineID *definitor = [DefineID new];
    NSString *selectedCategoryID = [definitor getIDFromCategoryName:selectedCategoryName];
//    NSLog(@"%@", selectedCategoryID);

    //here will be code to extract of dishes of current category (based on ID) and pass it to next VC

    self.dishesVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Dishes"];
    
    [_arrayToPass removeAllObjects];
    for (NSMutableDictionary *dict in [DataCollector sharedInstance].allDishesArray){
        if ([[dict objectForKey:@"categoryId"] isEqualToString:selectedCategoryID]){
            [_arrayToPass addObject:dict];
        }
    }
    NSLog(@"%lu", (unsigned long)[_arrayToPass count]);

    self.dishesVC.categoryDishes = _arrayToPass;
    
    // To pass the data between these two view  controllers, we use DetailVC's property "note"
    [self.navigationController pushViewController:self.dishesVC animated:YES];
}


@end
