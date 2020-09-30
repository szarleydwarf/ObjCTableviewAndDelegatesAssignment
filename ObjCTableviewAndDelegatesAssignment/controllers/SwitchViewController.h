//
//  SwitchViewController.h
//  ObjCTableviewAndDelegatesAssignment
//
//  Created by The App Experts on 30/09/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SwitchViewControllerDelegate <NSObject>
@required
-(void)updateSwitchValueInArray: (BOOL) isOn;
@end

@interface SwitchViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *theSwitcher;
@property (weak, nonatomic) id<SwitchViewControllerDelegate> delegate;

@property BOOL isOn;

- (IBAction)save:(UIButton *)sender;
- (void) setIsOn:(BOOL)isOn;

@end

NS_ASSUME_NONNULL_END
