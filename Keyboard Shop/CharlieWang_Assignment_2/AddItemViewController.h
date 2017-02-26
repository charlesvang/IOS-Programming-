//
//  AddItemViewController.h
//  CharlieWang_Assignment_2
//
//  Created by Chales.W on 2/25/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddItemViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *product_field;
@property (weak, nonatomic) IBOutlet UITextField *product_description;
@property (weak, nonatomic) IBOutlet UITextField *product_cost;
@property (weak, nonatomic) IBOutlet UITextField *product_quantity;

//@property (strong, nonatomic)  NSMutableArray* itemtoadd;

@end
