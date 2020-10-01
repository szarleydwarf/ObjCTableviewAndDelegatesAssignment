//
//  StepperViewController.m
//  ObjCTableviewAndDelegatesAssignment
//
//  Created by The App Experts on 30/09/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

#import "StepperViewController.h"

@implementation StepperViewController
@synthesize theStepper, stepperTextLabel, delegate, step;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setStep:step];
    [self.theStepper setValue:step];
    self.stepperTextLabel.text = [[NSString alloc]initWithFormat:@"%d", (int)step];
}

- (IBAction)doStep:(UIStepper *)sender {
    self.stepperTextLabel.text = [[NSString alloc]initWithFormat:@"%d", (int)sender.value];
}

- (IBAction)save:(UIButton *)sender {
    self.step = [self.stepperTextLabel.text integerValue];
    [self.delegate updateStepperValueInArray:self.step];
    [self.navigationController popViewControllerAnimated:true];
}
@end
