//
//  DishesViewController.m
//  TestovoeRestaurant
//
//  Created by Uri Fuholichev on 10/8/16.
//  Copyright © 2016 Andrei Karpenia. All rights reserved.
//

#import "DishesViewController.h"
#import "SWRevealViewController.h"

@interface DishesViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *dishesTableView;

@end

@implementation DishesViewController

- (void) viewDidLoad {
    
    self.dishesTableView.delegate = self;
    self.dishesTableView.dataSource= self;
    
//    SWRevealViewController *revealViewController = self.revealViewController;
//    if ( revealViewController ){
//        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
//    }
    
    NSLog(@"%lu",(unsigned long)[self.categoryDishes count]);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.categoryDishes count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
        cell.accessoryType = UITableViewCellAccessoryNone;
        //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [[self.categoryDishes objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Вес: %@ Цена %@", [[self.categoryDishes objectAtIndex:indexPath.row] objectForKey:@"weight"], [[self.categoryDishes objectAtIndex:indexPath.row] objectForKey:@"price"]];
//
//    cell.imageView.image = [[DataCollector sharedInstance].categoryImagesArray objectAtIndex:indexPath.row];
    
    return cell;
}

@end
