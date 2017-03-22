//
//  CheckViewController.m
//  Aliens
//
//  Created by Chales.W on 3/10/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "CheckViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "DataClass.h"

@interface CheckViewController ()
@property (assign, nonatomic) SystemSoundID winSoundID;
@end

@implementation CheckViewController 

- (void) viewDidAppear:(BOOL)animated{
    [self loadCheckPoints];
}

- (void)viewWillAppear:(BOOL)animated{
        [self loadCheckPoints];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadCheckPoints{
    
    DataClass *data = [DataClass getInstance];
    NSString *secret = [data secretCard];
    NSString *userChoice = [data userChoice];
    int guesses = [data numberOfGuesses];
    self.displayCardName.text = userChoice;
    self.displayPlayerGuesses.text = [NSString stringWithFormat: @"%d", guesses];
    if ([secret isEqualToString:userChoice]){
        self.displayResult.text = @"You Win!";
        [self playWinSound];
        [self performSelector:@selector(terminateProgram)
                   withObject: nil
                   afterDelay:4.0];
        
    }else{
        self.displayResult.text = @"Incorrect :(";
    }
    
}
- (void) terminateProgram{
    [[UIApplication sharedApplication] terminateWithSuccess];

}
- (void)playWinSound {
    if (_winSoundID == 0) {
        NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"partypeople"
                                                  withExtension:@"mp3"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL,
                                         &_winSoundID);
    }
    AudioServicesPlaySystemSound(_winSoundID);
  }


@end
