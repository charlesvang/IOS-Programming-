//
//  ViewController.m
//  CharlieWang_Assignment_2
//
//  Created by Chales.W on 2/22/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "ViewController.h"
#import "DataClass.h"
#import "AddItemViewController.h"
@interface ViewController (){
    NSMutableArray *inventory;
}
@property (nonatomic) NSInteger index;

@end

@implementation ViewController


- (void)viewDidLoad {
    // Do any additional setup after loading the view, typically from nib.
    
    [super viewDidLoad];
    
    self.index = 0;
    inventory = [[NSMutableArray alloc] init];
    
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
    [inventory addObject:hhkb];
    
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
    
    [inventory addObject:leopold];
    
    DataClass *obj = [DataClass getInstance];
    
    NSUInteger length = [obj.itemToAdd count];
    int index = (int) length;
    
    if ([obj.itemToAdd count] > 0){
        for (int i = 0; i < index; i++){
            [inventory addObject: [obj.itemToAdd objectAtIndex:i]];
        }
        //NSLog(@"WE MADE THIS FAR!!!");
    }
    
    
    
    
    
}

- (IBAction)addStock:(id)sender {
    NSMutableArray* tempStock = [inventory objectAtIndex:self.index];
    NSNumber* currentStock = [tempStock objectAtIndex:3];
    int val = self.labelQuantity.text.intValue;
    val += 1;
    currentStock = [NSNumber numberWithInt:val];
    [tempStock replaceObjectAtIndex:3 withObject:currentStock];
    [inventory replaceObjectAtIndex:self.index withObject:tempStock];
    self.labelQuantity.text = [NSString stringWithFormat:@"%d", val];
}

- (IBAction)minusStock:(id)sender {
    NSMutableArray* tempStock = [inventory objectAtIndex:self.index];
    NSNumber* currentStock = [tempStock objectAtIndex:3];
    int val = self.labelQuantity.text.intValue;
    val -= 1;
    if (val <= 0){
        val = 0;
    }
    currentStock = [NSNumber numberWithInt:val];
    [tempStock replaceObjectAtIndex:3 withObject:currentStock];
    [inventory replaceObjectAtIndex:self.index withObject:tempStock];
    
    self.labelQuantity.text = [NSString stringWithFormat:@"%d", val];
}


- (IBAction)nextProduct:(id)sender {
    
    NSLog(@"Got Here!");
    self.index += 1;
    if (self.index >= [inventory count]){
        self.index = [inventory count] -1;
    }
    
    
    NSMutableArray* tempStock = [inventory objectAtIndex:self.index];
    NSNumber* tempcost = [tempStock objectAtIndex:2];
    NSNumber* tempquant = [tempStock objectAtIndex:3];
    int quantval = [tempquant intValue];
    
    
    [self.productImage setImage:[tempStock objectAtIndex:4]];
    
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
        
    NSMutableArray* tempStock = [inventory objectAtIndex:self.index];
    NSNumber* tempcost = [tempStock objectAtIndex:2];
    NSNumber* tempquant = [tempStock objectAtIndex:3];
    int quantval = [tempquant intValue];
    double costval = [tempcost doubleValue];
    
    [self.productImage setImage:[tempStock objectAtIndex:4]];
    self.labelProduct.text = [tempStock objectAtIndex:0];
    self.labelDescription.text = [tempStock objectAtIndex:1];
    self.labelCost.text = [NSString stringWithFormat:@"$%.02f", costval];
    self.labelQuantity.text = [NSString stringWithFormat:@"%d", quantval];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
