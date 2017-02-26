//
//  AddItemViewController.m
//  CharlieWang_Assignment_2
//
//  Created by Chales.W on 2/25/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "AddItemViewController.h"
#import "DataClass.h"
#import "ViewController.h"

@interface AddItemViewController ()
@end


@implementation AddItemViewController

- (IBAction)addItem:(id)sender {
    
    DataClass *obj = [DataClass getInstance];
    if ([obj.itemToAdd count] == 0){
        obj.itemToAdd = [[NSMutableArray alloc] init];
    }
    NSMutableArray* tempproduct = [[NSMutableArray alloc] init];
    NSString* product = self.product_field.text;
    
    //NSLog(@"new Product is %@", product);
    
    NSString* description = self.product_description.text;
   
    //NSLog(@"new Product descript is %@", description);
    
    NSString* cost = self.product_cost.text;
    //NSLog(@"new Product costs %@", cost);
    double itemcost = [cost doubleValue];
    NSString* quantity = self.product_quantity.text;
    //NSLog(@"We have %@ units", quantity);
    int item_on_hand = [quantity intValue];
    
    NSNumber *newItemCost = [NSNumber numberWithFloat:itemcost];
    NSNumber *newItemonhand = [NSNumber numberWithInteger:item_on_hand];
    
    [tempproduct addObject:product];
    [tempproduct addObject:description];
    [tempproduct addObject:newItemCost];
    [tempproduct addObject:newItemonhand];
    [tempproduct addObject:[UIImage imageNamed:@"modelm.png"]];
    
    [obj.itemToAdd addObject:tempproduct];

}


@end

