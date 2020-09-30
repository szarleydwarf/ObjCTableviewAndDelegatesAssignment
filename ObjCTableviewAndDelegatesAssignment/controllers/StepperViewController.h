//
//  StepperViewController.h
//  ObjCTableviewAndDelegatesAssignment
//
//  Created by The App Experts on 30/09/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol StepperViewControllerDelegate <NSObject>
@required
-(void)updateStepperValueInArray:(int) step;
@end

@interface StepperViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *stepperTextLabel;
@property (weak, nonatomic) IBOutlet UIStepper *theStepper;
@property (weak, nonatomic) id<StepperViewControllerDelegate> delegate;

@property int step;

- (IBAction)doStep:(UIStepper *)sender;
- (IBAction)save:(UIButton *)sender;
- (void)setStep:(int)step;
@end

NS_ASSUME_NONNULL_END
