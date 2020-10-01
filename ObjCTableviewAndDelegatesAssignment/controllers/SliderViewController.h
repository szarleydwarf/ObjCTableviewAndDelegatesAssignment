//
//  SliderViewController.h
//  ObjCTableviewAndDelegatesAssignment
//
//  Created by The App Experts on 01/10/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SliderViewControllerDelegate <NSObject>

@required
- (void)updateSliderValueInArray:(NSString*)sliderValue;

@end

@interface SliderViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *sliderValueLabel;
@property (weak, nonatomic) IBOutlet UISlider *theSlider;
@property (weak, nonatomic) id<SliderViewControllerDelegate> delegate;

@property NSString* sliderValue;

- (IBAction)sliderValueChanged:(UISlider *)sender;
- (IBAction)save:(UIButton *)sender;
- (void)setSliderValue:(NSString*)sliderValue;
@end

NS_ASSUME_NONNULL_END
