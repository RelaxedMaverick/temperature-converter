//
//  TemperatureViewController.h
//  TemperatureConverter
//
//  Created by Rohit Dialani on 03/08/13.
//  Copyright (c) 2013 Rohit Dialani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemperatureViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *tempFahrenheit;
@property (nonatomic, weak) IBOutlet UITextField *tempCelsius;
@property (nonatomic, weak) IBOutlet UIButton *convertButton;

- (IBAction) onConvertButtonClicked;
- (IBAction) escapeIfEditing;
@end
