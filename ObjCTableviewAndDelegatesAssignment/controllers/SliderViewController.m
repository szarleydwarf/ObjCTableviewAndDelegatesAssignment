//
//  SliderViewController.m
//  ObjCTableviewAndDelegatesAssignment
//
//  Created by The App Experts on 01/10/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

#import "SliderViewController.h"

@interface SliderViewController ()

@end

@implementation SliderViewController
@synthesize sliderValue, sliderValueLabel, delegate, theSlider;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSliderValue:sliderValue];
    [self.theSlider setValue:[sliderValue integerValue]];
    self.sliderValueLabel.text = sliderValue;
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    self.sliderValueLabel.text = [[NSString alloc]initWithFormat:@"%d", (int)sender.value];
}

- (IBAction)save:(UIButton *)sender {
    self.sliderValue = self.sliderValueLabel.text;
    [self.delegate updateSliderValueInArray:self.sliderValue];
    [self.navigationController popViewControllerAnimated:true];
}
@end
