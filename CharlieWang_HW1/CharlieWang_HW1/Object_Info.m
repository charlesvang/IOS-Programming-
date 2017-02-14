//
//  Object_Info.m
//  CharlieWang_HW1
//
//  Created by Chales.W on 2/12/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "Object_Info.h"


@implementation Object_Info{
    NSString *description;
    double retail_cost;
    double wholesale_cost;
    int num_hold;
    int num_sold;
}

- (void) setNum_on_Hand: (int) numonhand{
    num_hold = numonhand;
}

- (int) getNum_on_Hand{
    return num_hold;
}

- (void) setNumSold: (int) numsold{
    num_sold = numsold;
}

- (int) getNumSold{
    return num_sold;
}

- (void) setDescription: (NSString*) desc{
    description = desc;
}

- (NSString *) getDescription{
    return description;
}

- (void) setRetailValue: (double) rvalue{
    retail_cost = rvalue;
}

- (double) getRetailVal{
    return retail_cost;
}
-(void) setWholeSaleValue: (double) wvalue{
    wholesale_cost = wvalue;
}

- (double)  getWholeSaleCost{
    return wholesale_cost;
}

- (void) Print_Object {
    NSLog (@"The product is %@ and we have %i in stock and sold %i to date.", description, num_hold,num_sold);
}

@end
