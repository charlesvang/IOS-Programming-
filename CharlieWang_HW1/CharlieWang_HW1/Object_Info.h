//
//  Object_Info.h
//  CharlieWang_HW1
//
//  Created by Chales.W on 2/12/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Object_Info : NSObject

- (void) Print_Object;
- (void) setDescription: (NSString*) descrip;
- (void) setRetailValue: (double) rvalue;
-(void) setWholeSaleValue: (double) wvalue;
- (void) setNum_on_Hand: (int) numonhand;
- (void) setNumSold: (int) numsold;
- (int) getNum_on_Hand;
- (int) getNumSold;
- (double)  getWholeSaleCost;
- (double) getRetailVal;


@end
