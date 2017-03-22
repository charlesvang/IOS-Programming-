//
//  DataClass.h
//  Aliens
//
//  Created by Chales.W on 3/10/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface DataClass : NSObject{
    
    NSString *cardName;
    NSString *cardSuit;
    NSString *_secretCard;
    int _numberOfGuesses;
    NSString *_userChoice;
}



@property(nonatomic,strong)NSString* cardName;
@property(nonatomic, strong) NSString *cardSuite;
@property(nonatomic, copy) NSString *secretCard;
@property (nonatomic, copy) NSString *userChoice;
@property int numberOfGuesses;

+(DataClass*)getInstance;
@end
