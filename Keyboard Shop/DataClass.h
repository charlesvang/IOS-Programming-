//
//  DataClass.h
//  CharlieWang_Assignment_2
//
//  Created by Chales.W on 2/26/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataClass : NSObject{
    NSMutableArray *itemToAdd;
}



@property(nonatomic,strong)NSMutableArray* itemToAdd;
+(DataClass*)getInstance;
@end
