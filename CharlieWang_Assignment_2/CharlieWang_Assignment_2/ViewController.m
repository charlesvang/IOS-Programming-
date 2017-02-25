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
@property (nonatomic) NSInteger index;
@end

@implementation ViewController


- (void)viewDidLoad {
    // Do any additional setup after loading the view, typically from nib.
    
    [super viewDidLoad];
    
    
    self.index = 0;
    self.inventory = [[NSMutableArray alloc] init];
    
    
    NSString* hhkbproduct = @"Happy Hacking Keyboard";
    NSString* hhkbdescription = @"Happy Hacking Keyboard made in Japan";
    double hhkbcost = 250.0;
    int hhkbstock = 5;
    
    //------Display HHKB Image ------
    self.productImage.image = [UIImage imageNamed:@"hhkb.png"];
    self.labelProduct.text = hhkbproduct;
    self.labelDescription.text = hhkbdescription;
    self.labelCost.text = [NSString stringWithFormat:@"$%.02f", hhkbcost];
    self.labelQuantity.text =[NSString stringWithFormat:@"%d",hhkbstock];
    
    //initiate hhkb product array
    NSMutableArray *hhkb = [[NSMutableArray alloc] init];
    NSNumber *cost = [NSNumber numberWithFloat:hhkbcost];
    NSNumber *numonhand = [NSNumber numberWithInteger:hhkbstock];
    
    //adding information to the hhkb product
    [hhkb addObject:hhkbproduct];
    [hhkb addObject:hhkbdescription];
    [hhkb addObject:cost];
    [hhkb addObject:numonhand];
    [hhkb addObject:[UIImage imageNamed:@"hhkb.png"]];
    [self.inventory addObject:hhkb];
    
    //---------------New Product Leopold Keyboard --------
    NSString* leopoldproduct = @"Leopold Keyboard";
    NSString* leopold_description = @"Leopold Keyboard made in Taiwan";
    double leopoldcost = 150.0;
    int Leopoldstock = 10;
    
    //initiate leopold product array
    NSMutableArray *leopold = [[NSMutableArray alloc] init];
    
    NSNumber *leocost = [NSNumber numberWithFloat:leopoldcost];
    NSNumber *leonumonhand = [NSNumber numberWithInteger:Leopoldstock];
    
    [leopold addObject:leopoldproduct];
    [leopold addObject:leopold_description];
    [leopold addObject:leocost];
    [leopold addObject:leonumonhand];
    [leopold addObject:[UIImage imageNamed:@"leopold.png"]];
    [self.inventory addObject:leopold];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addStock:(id)sender {
    NSMutableArray* tempStock = [self.inventory objectAtIndex:self.index];
    NSNumber* currentStock = [tempStock objectAtIndex:3];
    int val = self.labelQuantity.text.intValue;
    val += 1;
    currentStock = [NSNumber numberWithInt:val];
    [tempStock replaceObjectAtIndex:3 withObject:currentStock];
    [self.inventory replaceObjectAtIndex:self.index withObject:tempStock];
    self.labelQuantity.text = [NSString stringWithFormat:@"%d", val];
}

- (IBAction)minusStock:(id)sender {
    NSMutableArray* tempStock = [self.inventory objectAtIndex:self.index];
    NSNumber* currentStock = [tempStock objectAtIndex:3];
    int val = self.labelQuantity.text.intValue;
    val -= 1;
    if (val <= 0){
        val = 0;
    }
    currentStock = [NSNumber numberWithInt:val];
    [tempStock replaceObjectAtIndex:3 withObject:currentStock];
    [self.inventory replaceObjectAtIndex:self.index withObject:tempStock];
    self.labelQuantity.text = [NSString stringWithFormat:@"%d", val];
}


- (IBAction)nextProduct:(id)sender {
    self.index += 1;
    
    if (self.index >= [self.inventory count]){
        self.index = [self.inventory count] -1;
    }
        
    NSMutableArray* tempStock = [self.inventory objectAtIndex:self.index];
    NSNumber* tempcost = [tempStock objectAtIndex:2];
    NSNumber* tempquant = [tempStock objectAtIndex:3];
    int quantval = [tempquant intValue];

    [self.productImage setImage:[tempStock objectAtIndex:4]];
    NSLog(@"sup");

    self.labelProduct.text = [tempStock objectAtIndex:0];
    self.labelDescription.text = [tempStock objectAtIndex:1];
    double costval = [tempcost doubleValue];
    self.labelCost.text = [NSString stringWithFormat:@"$%.02f", costval];
    self.labelQuantity.text = [NSString stringWithFormat:@"%d", quantval];
    
    
}

- (IBAction)previousProduct:(id)sender {
    self.index -= 1;
    
    if (self.index <= 0 ){
        self.index = 0;
    }
        
    NSMutableArray* tempStock = [self.inventory objectAtIndex:self.index];
    NSNumber* tempcost = [tempStock objectAtIndex:2];
    NSNumber* tempquant = [tempStock objectAtIndex:3];
    int quantval = [tempquant intValue];
    double costval = [tempcost doubleValue];
    
    [self.productImage setImage:[tempStock objectAtIndex:4]];
    NSLog(@"sup");
    
    self.labelProduct.text = [tempStock objectAtIndex:0];
    self.labelDescription.text = [tempStock objectAtIndex:1];
    self.labelCost.text = [NSString stringWithFormat:@"$%.02f", costval];
    self.labelQuantity.text = [NSString stringWithFormat:@"%d", quantval];

}

@end
