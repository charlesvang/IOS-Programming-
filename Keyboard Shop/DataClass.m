//
//  DataClass.m
//  CharlieWang_Assignment_2
//
//  Created by Chales.W on 2/26/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "DataClass.h"

@implementation DataClass

@synthesize itemToAdd;

static DataClass *instance = nil;

+(DataClass *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance= [DataClass new];
        }
    }
    return instance;
}

@end
