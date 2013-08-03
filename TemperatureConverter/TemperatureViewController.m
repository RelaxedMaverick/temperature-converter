//
//  TemperatureViewController.m
//  TemperatureConverter
//
//  Created by Rohit Dialani on 03/08/13.
//  Copyright (c) 2013 Rohit Dialani. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()
{
    BOOL lastEditOnFahrenheit;
}
@end

@implementation TemperatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature";
        lastEditOnFahrenheit = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.convertButton setBackgroundColor:[UIColor greenColor]];
    [self.convertButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    self.tempCelsius.delegate = self;
    self.tempFahrenheit.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

-(void) onConvertButtonClicked
{
    [self escapeIfEditing];

    if (lastEditOnFahrenheit) {
        float tempF = [self.tempFahrenheit.text floatValue];
        float tempC = (tempF - 32.0) * (5.0/9.0);
        self.tempCelsius.text = [NSString stringWithFormat:@"%0.2f", tempC];
    } else {
        float tempC = [self.tempCelsius.text floatValue];
        float tempF = tempC * (5.0/9.0) + 32;
        self.tempFahrenheit.text = [NSString stringWithFormat:@"%.2f", tempF];
    }
}

-(void) escapeIfEditing
{
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate implementation
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.tempFahrenheit) {
        lastEditOnFahrenheit = YES;
    } else if (textField == self.tempCelsius) {
        lastEditOnFahrenheit = NO;
    }
}

@end