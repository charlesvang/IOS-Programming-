//
//  DataClass.m
//  Aliens
//
//  Created by Chales.W on 3/10/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataClass.h"

@implementation DataClass

@synthesize cardName;
@synthesize cardSuite;
@synthesize secretCard;
@synthesize numberOfGuesses;
@synthesize userChoice;

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
