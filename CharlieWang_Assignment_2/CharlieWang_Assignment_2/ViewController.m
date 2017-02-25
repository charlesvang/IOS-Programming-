//
//  ViewController.m
//  CharlieWang_Assignment_2
//
//  Created by Chales.W on 2/22/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSMutableArray* inventory;
@property (nonatomic) int index;
@end

@implementation ViewController


- (void)viewDidLoad {
    // Do any additional setup after loading the view, typically from nib.
    
    [super viewDidLoad];
    
    
    self.index = 0;
    NSString* hhkbproduct = @"Happy Hacking Keyboard";
    NSString* hhkbdescription = @"Happy Hacking Keyboard made in Japan";
    double hhkbcost = 250.0;
    int hhkbstock = 5;
    
    
    _productImage.image = [UIImage imageNamed:@"hhkb.png"];
    _labelProduct.text = hhkbproduct;
    _labelDescription.text = hhkbdescription;
    _labelCost.text = [NSString stringWithFormat:@"$%.02f", hhkbcost];
    _labelQuantity.text =[NSString stringWithFormat:@"%d",hhkbstock];
    
    self.inventory = [[NSMutableArray alloc] init];
    NSMutableArray *hhkb = [[NSMutableArray alloc] init];
    [hhkb addObject:hhkbproduct];
    [hhkb addObject:hhkbdescription];
    NSNumber *cost = [NSNumber numberWithFloat:hhkbcost];
    NSNumber *numonhand = [NSNumber numberWithInteger:hhkbstock];
    [hhkb addObject:cost];
    [hhkb addObject:numonhand];
    [hhkb addObject:[UIImage imageNamed:@"hhkb.png"]];
    [self.inventory addObject:hhkb];
    
    
    
    //[self.inventory addObject:[NSMutableArray arrayWithObjects:@"HHKB",@"Happy Hacking Keyboard made in Japan",245.0,10, [UIImage imageNamed:@"hhkb.png"],nil]];
    /**
    [self.inventory addObject:[NSMutableArray arrayWithObjects:@"Leopold Keyboard",@"Leopold Keyboard made in Taiwan",145.0,5,[UIImage imageNamed:@"leopold.png"],nil]];
    [self.inventory addObject:[NSMutableArray arrayWithObjects:@"IBM model M keyboard",@"IBM Keyboard made in 1984",200.0,1,[UIImage imageNamed:@"modelm.png"],nil]];
    
    
    NSMutableArray *subarry = [self.inventory objectAtIndex: (NSUInteger)index];
**/
    /**
    self.product_name = [subarry objectAtIndex:0];
    self.descrip = [subarry objectAtIndex:1];
    self.cost = [subarry objectAtIndex:2];
    self.num_on_hand = [subarry objectAtIndex:3];
    NSString* imgsource = [subarry objectAtIndex:4];
    self.product_image.image = [UIImage imageNamed:imgsource];
    **/
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addStock:(id)sender {
    NSMutableArray* tempStock = [self.inventory objectAtIndex:0];
    NSNumber* currentStock = [tempStock objectAtIndex:4];
    int val = _labelQuantity.text.intValue;
    val += 1;
    currentStock = [NSNumber numberWithInt:val];
    [tempStock replaceObjectAtIndex:4 withObject:currentStock];
    [self.inventory replaceObjectAtIndex:0 withObject:tempStock];
    _labelQuantity.text = [NSString stringWithFormat:@"%d", val];
}

- (IBAction)minusStock:(id)sender {
    NSMutableArray* tempStock = [self.inventory objectAtIndex:0];
    NSNumber* currentStock = [tempStock objectAtIndex:4];
    int val = _labelQuantity.text.intValue;
    val -= 1;
    if (val <= 0){
        val = 0;
    }
    currentStock = [NSNumber numberWithInt:val];
    [tempStock replaceObjectAtIndex:4 withObject:currentStock];
    [self.inventory replaceObjectAtIndex:0 withObject:tempStock];
    _labelQuantity.text = [NSString stringWithFormat:@"%d", val];
}
@end
