//
//  ViewController.h
//  CharlieWang_Assignment_2
//
//  Created by Chales.W on 2/22/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *labelProduct;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelCost;
@property (weak, nonatomic) IBOutlet UILabel *labelQuantity;

- (IBAction)addStock:(id)sender;
- (IBAction)minusStock:(id)sender;
- (IBAction)nextProduct:(id)sender;
- (IBAction)previousProduct:(id)sender;

@end

