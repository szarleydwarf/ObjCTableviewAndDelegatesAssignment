//
//  ViewController.h
//  ObjCTableviewAndDelegatesAssignment
//
//  Created by The App Experts on 30/09/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwitchViewController.h"
#import "StepperViewController.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, SwitchViewControllerDelegate, StepperViewControllerDelegate>


@end

