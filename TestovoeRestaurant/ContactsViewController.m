//
//  ContactsViewController.m
//  TestovoeRestaurant
//
//  Created by Uri Fuholichev on 10/8/16.
//  Copyright © 2016 Andrei Karpenia. All rights reserved.
//

#import "ContactsViewController.h"
#import "SWRevealViewController.h"

@implementation ContactsViewController

- (void) viewDidLoad {
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController ){
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

@end
