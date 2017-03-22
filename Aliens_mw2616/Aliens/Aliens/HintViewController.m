//
//  HintViewController.m
//  Aliens
//
//  Created by Chales.W on 3/10/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "HintViewController.h"
#import "DataClass.h"
@interface HintViewController ()

@end

@implementation HintViewController


- (void)viewWillAppear:(BOOL)animated{
    self.displayHint.text = @"Are you sure?";
}


- (IBAction)showHint:(id)sender {
    
    DataClass *data = [DataClass getInstance];
    self.displayHint.text = [data secretCard];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
