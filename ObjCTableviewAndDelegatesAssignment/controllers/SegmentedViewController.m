//
//  SegmentedViewController.m
//  ObjCTableviewAndDelegatesAssignment
//
//  Created by The App Experts on 01/10/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

#import "SegmentedViewController.h"

@interface SegmentedViewController ()

@end

@implementation SegmentedViewController
@synthesize segmentValue, theSegment, delegate;



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSegmentValue:segmentValue];
    for (int i = 0; i < self.theSegment.numberOfSegments; i++) {
        if ([segmentValue isEqualToString:[self.theSegment titleForSegmentAtIndex:i]]) {
            [self.theSegment setSelectedSegmentIndex:i];
        }
    }
// else if (
    
      
}

- (IBAction)segmentChanged:(UISegmentedControl *)sender {
    NSLog(@"segmentChanged %ld", sender.selectedSegmentIndex);
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.segmentValue = [sender titleForSegmentAtIndex:0];
            break;
        case 1:
            self.segmentValue = [sender titleForSegmentAtIndex:1];
            break;
        case 2:
            self.segmentValue = [sender titleForSegmentAtIndex:2];
            break;
        case 3:
            self.segmentValue = [sender titleForSegmentAtIndex:3];
            break;
        default:
            break;
    }
}

- (IBAction)save:(UIButton *)sender {
    NSLog(@"segment save %@", self.segmentValue);
    [self.delegate updateSegmentValueInArray:self.segmentValue];
    [self.navigationController popViewControllerAnimated:true];
}
@end
