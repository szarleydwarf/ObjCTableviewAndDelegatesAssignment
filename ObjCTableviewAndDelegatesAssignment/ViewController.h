//
//  ViewController.h
//  ObjCTableviewAndDelegatesAssignment
//
//  Created by The App Experts on 30/09/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "controllers/SwitchViewController.h"
#import "controllers/StepperViewController.h"
#import "controllers/TextFieldViewController.h"
#import "controllers/SliderViewController.h"
#import "controllers/SegmentedViewController.h"


@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, SwitchViewControllerDelegate, StepperViewControllerDelegate, TextFieldViewControllerDelegate, SliderViewControllerDelegate,SegmentedViewControllerDelegate>

-(void)updateValueInArray:(NSString*)value;

@end

