//
//  CheckViewController.h
//  Aliens
//
//  Created by Chales.W on 3/10/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UILabel *displayCardName;
@property (weak, nonatomic) IBOutlet UILabel *displayResult;
@property (weak, nonatomic) IBOutlet UILabel *displayPlayerGuesses;
@end


@interface UIApplication (extended)
-(void) terminateWithSuccess;
@end
