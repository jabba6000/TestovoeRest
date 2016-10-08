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

@interface CategoriesViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *categoriesTableView;

@end

@implementation CategoriesViewController

- (void) viewDidLoad {
    
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

@end
