//
//  CategoriesViewController.m
//  TestovoeRestaurant
//
//  Created by Uri Fuholichev on 10/8/16.
//  Copyright © 2016 Andrei Karpenia. All rights reserved.
//

#import "CategoriesViewController.h"
#import "SWRevealViewController.h"

@interface CategoriesViewController()

@property (strong, nonatomic) IBOutlet UITableView *categoriesTableView;

@end

@implementation CategoriesViewController

- (void) viewDidLoad {
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController ){
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

@end
