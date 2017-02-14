//
//  main.m
//  CharlieWang_HW1
//
//  Created by Chales.W on 2/12/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "Object_Info.h"

NSMutableDictionary *inventory;


//Adding things to a new item

BOOL Add_Item (NSString * item_name, NSString * desc , double rcost , double wcost ){
    
    Object_Info *newitem = [[Object_Info alloc]init];

    if ( !inventory) {
        inventory = [[NSMutableDictionary alloc] init];
    }
    
    if (inventory[item_name]){
        return false;
    }
    
    [newitem setDescription: desc];
    [newitem setDescription: desc];
    [newitem setNum_on_Hand:0];
    [newitem setNumSold:0];
    [newitem setRetailValue:rcost];
    [newitem setWholeSaleValue:wcost];
    
    inventory[item_name] = newitem;
    return true;
}


void Add_Stock (NSString* item_name, int numadd){
    
    Object_Info *temp_item = [[Object_Info alloc]init];
    temp_item = inventory[item_name];
    int numhold = [temp_item getNum_on_Hand];
    numhold += numadd;
    [temp_item setNum_on_Hand:numhold];
    inventory[item_name] = temp_item;
    
}

NSString* Sell_item(NSString * item_name,int numsell){
    
    Object_Info *temp_item = [[Object_Info alloc]init];
    temp_item = inventory[item_name];
    
    int numhold = [temp_item getNum_on_Hand];
    int numsold = [temp_item getNumSold];
    
    if (numsell > numhold){
        return ( @"Not enough stock");
    }
    
    numhold -= numsell;
    numsold += numsell;
    
    [temp_item setNum_on_Hand:numhold];
    [temp_item setNumSold:numsold];
    inventory[item_name] = temp_item;
    
    if (numhold == 0){
        return @"Out of Stock";
    }
    return @"Succesfully Sold!";
}

void Delete_Item(NSString * item_name){
    [inventory removeObjectForKey: item_name];
}

double Profit_Calc (){
    float profit = 0;
    for (id key in inventory){
        Object_Info *temp = [[Object_Info alloc]  init];
        temp = [inventory objectForKey: key];
        int itemsold = [temp getNumSold];
        double rval = [temp getRetailVal];
        double wcost = [temp getWholeSaleCost];
        profit += itemsold * (rval - wcost);
    }
    return profit;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BOOL check = Add_Item (@"Iphone", @"Iphone 8 Made in China", 755.0, 450.0);
        Add_Stock(@"Iphone", 10);
        
        Sell_item(@"Iphone", 3);
        
        BOOL check2 = Add_Item(@"Keyboard", @"Pokr3 Keyboard", 150.0, 45.0);
        Add_Stock(@"Keyboard", 10);
        Sell_item(@"Keyboard", 3);
        
        for(id key in inventory){
            Object_Info *temp = [[Object_Info alloc]  init];
            temp = [inventory objectForKey: key];
            NSLog(@"key=%@", key);
            [temp Print_Object];
        }
        
        //Calculating Profits
        double profit = Profit_Calc();
        NSLog(@"We have made %.002f dollars", profit);
        
        return 0;
    }
}
