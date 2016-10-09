//
//  DishesViewController.m
//  TestovoeRestaurant
//
//  Created by Uri Fuholichev on 10/8/16.
//  Copyright © 2016 Andrei Karpenia. All rights reserved.
//

#import "DishesViewController.h"
#import "SWRevealViewController.h"
#import "DataCollector.h"

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
//    cell.textLabel.text = [[self.categoryDishes objectAtIndex:indexPath.row] objectForKey:@"name"];
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"Вес: %@ Цена %@", [[self.categoryDishes objectAtIndex:indexPath.row] objectForKey:@"weight"], [[self.categoryDishes objectAtIndex:indexPath.row] objectForKey:@"price"]];
////
////    cell.imageView.image = [[DataCollector sharedInstance].categoryImagesArray objectAtIndex:indexPath.row];
//    
//    return cell;
    cell.tag = indexPath.row;
//    NSLog(@"%ld", (long)indexPath.row);
    UIImage *naImage = [UIImage imageNamed:@"na.jpg"];
    NSString *currentDishName = [[_categoryDishes objectAtIndex:indexPath.row] objectForKey:@"name"];
    NSLog(@"Current name is %@", currentDishName);
    
//    if ([self.categoryDishes objectAtIndex:indexPath.row])
//    {
        if(  [[[DataCollector sharedInstance].dishesImagesDictionary objectForKey:currentDishName] isEqual:@"none"]){
            NSLog(@"contain");
            cell.imageView.image = naImage;
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
            dispatch_async(queue, ^(void) {
                
                NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[[self.categoryDishes objectAtIndex:indexPath.row] objectForKey:@"picture"]]];
                
                UIImage* image = [[UIImage alloc] initWithData:imageData];
                if (image) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (cell.tag == indexPath.row) {
                            [[DataCollector sharedInstance].dishesImagesDictionary removeObjectForKey:@"dishImage"];
                            [[DataCollector sharedInstance].dishesImagesDictionary setObject:image forKey:currentDishName];
                            NSLog(@"Img downloaded");
                            cell.imageView.image = image;
                            [cell setNeedsLayout];
                            //Это обновляет ячейки, которые уже получили данные
                            //Чтобы они начали отображать картинку
                            [self.dishesTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                        }
                    });
                }
            });
            
            cell.textLabel.text = [[self.categoryDishes objectAtIndex:indexPath.row] objectForKey:@"name"];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Вес: %@ Цена %@", [[self.categoryDishes objectAtIndex:indexPath.row] objectForKey:@"weight"], [[self.categoryDishes objectAtIndex:indexPath.row] objectForKey:@"price"]];
            
        }
        else if (![[[DataCollector sharedInstance].dishesImagesDictionary objectForKey:currentDishName ] isEqual:@"none"] ){
            
            NSLog(@"not contain");
            cell.imageView.image = [[DataCollector sharedInstance].dishesImagesDictionary objectForKey:currentDishName];
            cell.textLabel.text = [[self.categoryDishes objectAtIndex:indexPath.row] objectForKey:@"name"];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Вес: %@ Цена %@", [[self.categoryDishes objectAtIndex:indexPath.row] objectForKey:@"weight"], [[self.categoryDishes objectAtIndex:indexPath.row] objectForKey:@"price"]];
        }
//    }
    return cell;
}

@end
