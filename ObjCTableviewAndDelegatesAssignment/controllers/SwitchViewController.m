//
//  SwitchViewController.m
//  ObjCTableviewAndDelegatesAssignment
//
//  Created by The App Experts on 30/09/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

#import "SwitchViewController.h"

@implementation SwitchViewController
@synthesize theSwitcher, delegate, isOn;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setIsOn:isOn];
    [self.theSwitcher setOn:isOn];
}

- (IBAction)save:(UIButton *)sender {
    self.isOn = self.theSwitcher.isOn;
    [self.delegate updateSwitchValueInArray:isOn];
    [self.navigationController popViewControllerAnimated:true];
}
@end
