//
//  DishCardViewController.m
//  TestovoeRestaurant
//
//  Created by Uri Fuholichev on 10/8/16.
//  Copyright © 2016 Andrei Karpenia. All rights reserved.
//

#import "DishCardViewController.h"
#import "DataCollector.h"

@interface DishCardViewController()

@property (strong, nonatomic) IBOutlet UIImageView *dishImageView;
@property (strong, nonatomic) IBOutlet UILabel *dishName;
@property (strong, nonatomic) IBOutlet UILabel *dishWeight;
@property (strong, nonatomic) IBOutlet UILabel *dishPrice;
@property (strong, nonatomic) IBOutlet UILabel *dishDescription;

@end

@implementation DishCardViewController

-(void) viewDidLoad{
    
    NSLog(@"%@", [_dish objectForKey:@"name"]);
    NSLog(@"%@", [_dish objectForKey:@"weight"]);
    NSLog(@"%@", [_dish objectForKey:@"price"]);
    NSLog(@"%@", [_dish objectForKey:@"description"]);

    _dishName.text = [_dish objectForKey:@"name"];
    _dishWeight.text = [NSString stringWithFormat:@"Вес: %@", [_dish objectForKey:@"weight"]];
    _dishPrice.text = [NSString stringWithFormat:@"Цена: %@",[_dish objectForKey:@"price"]];
    if ([[_dish objectForKey:@"description"] isEqual:@""])
        _dishDescription.text = @"Описание отсутствует";
    else
        _dishDescription.text = [NSString stringWithFormat:@"Описание: %@",[_dish objectForKey:@"description"] ];
    
    _dishImageView.image = [[DataCollector sharedInstance].dishesImagesDictionary objectForKey:[_dish objectForKey:@"name"]];
}

- (void) viewDidAppear{
    
    _dishName.text = [_dish objectForKey:@"name"];
    _dishWeight.text = [_dish objectForKey:@"weight"];
    _dishPrice.text = [_dish objectForKey:@"price"];
    _dishDescription.text = [_dish objectForKey:@"description"];
}

@end
