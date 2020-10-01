//
//  TextFieldViewController.m
//  ObjCTableviewAndDelegatesAssignment
//
//  Created by The App Experts on 01/10/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

#import "TextFieldViewController.h"

@interface TextFieldViewController ()

@end

@implementation TextFieldViewController
@synthesize text, textField, delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"text viewdidload %@", text);
    
    [self setText:text];
    self.textField.text = text;
}

- (IBAction)save:(UIButton *)sender {
    self.text = self.textField.text;
    [self.delegate updateTextFieldValueInArray:self.text];
    [self.navigationController popViewControllerAnimated:true];
}
@end
