//
//  UnlockViewController.m
//  Aliens
//
//  Created by Chales.W on 3/10/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "UnlockViewController.h"
#import "DataClass.h"
#define cardType 1
#define cardName 0

@interface UnlockViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *CardPicker;
//adding the carnames array
@property (strong, nonatomic) NSArray *cardNames;
//adding the cardSuit
@property (strong, nonatomic) NSArray *cardSuit;
@property (strong, nonatomic) NSMutableArray *arrayOfImages;
@property int randCard;
@property int randType;
@property int numofGuesses;

@end

@implementation UnlockViewController


/**
- (void)viewDidLoad {
    [super viewDidLoad];
    [self cardLoader];
}**/

- (void)viewWillAppear:(BOOL)animated{
    //[super viewWillAppear:YES];
    [self cardLoader];
}

- (void) viewDidDisappear:(BOOL)animated{
    //[super viewDidDisappear:YES];
    [self cardLoader];
    DataClass *data = [DataClass getInstance];
    NSInteger cardRow = [self.CardPicker
                         selectedRowInComponent:
                         cardName];
    NSInteger suitRow = [self.CardPicker
                         selectedRowInComponent:
                         cardType];
    
    
    NSString *name = self.cardNames[cardRow];
    NSString *type = self.cardSuit[suitRow];
    
    NSString *userChoice = [name stringByAppendingString:type];
    
    [data setUserChoice: userChoice];
    int curNumGuess = [data numberOfGuesses];
    [data setNumberOfGuesses: curNumGuess+1];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) cardLoader {
    self.cardNames = @[@"The Ace of ",@"The two of ",@"The Three of ",@"The Four of ",@"The Five of ",@"The Six of ",@"The Seven of ",@"The Eight of ",@"The Nine of ",@"The Ten of ",@"The Jack of ",@"The Queen of ",@"The King of "];
    self.cardSuit = @[@"Heart", @"Club", @"Diamond", @"Spades"];
    
    /**
     self.arrayOfImages = [NSMutableArray array];
     for(int i = 0; i < 4; i++){
     NSString *tempcardsuit = [self.cardSuit objectAtIndex:i];
     NSString *tmpString = [NSString stringWithFormat:@"%@.png", tempcardsuit];
     [_arrayOfImages addObject:[[UIImageView alloc]initWithImage:[UIImage imageNamed:tmpString]]];
     }**/
    
    self.CardPicker.delegate = self;
    self.CardPicker.dataSource = self;
    
    [self.CardPicker reloadAllComponents];
    // Do any additional setup after loading the view.
    
    
    DataClass *data = [DataClass getInstance];
    
    self.numofGuesses = [data numberOfGuesses];
    
    if (self.numofGuesses == 0){
        
        self.randCard = arc4random_uniform(13);
        self.randType = arc4random_uniform(4);
        
    }
    
    [data setSecretCard:[[self.cardNames objectAtIndex: self.randCard] stringByAppendingString: [self.cardSuit objectAtIndex: self.randType]]];

}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    if (component == cardType) {
        return [self.cardSuit count];
        //NSLog(@"Card names Count: %d", [self.cardNames count]);
    } else {
        return [self.cardNames count];
    }
}

#pragma mark Picker Delegate Methods


- (UIView*)pickerView:(UIPickerView *)pickerView
             viewForRow:(NSInteger)row
            forComponent:(NSInteger)component reusingView:(nullable UIView *)view{
    UIImageView *imageView;
    if (component == cardName){
        UILabel *card = [[UILabel alloc] initWithFrame:CGRectMake(30,0,200,30)];
        card.text = [self.cardNames objectAtIndex:row];
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,30,30)];
        [imageView addSubview: card];
    }
    
    else{
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png", (long) row]];
                          imageView = [[UIImageView alloc] initWithImage:image];
                          imageView.frame = CGRectMake(0, 0, 30, 30);
    }
                          
                          return imageView;
}


@end
