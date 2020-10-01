//
//  SegmentedViewController.h
//  ObjCTableviewAndDelegatesAssignment
//
//  Created by The App Experts on 01/10/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SegmentedViewControllerDelegate <NSObject>
@required
- (void)updateSegmentValueInArray:(NSString*)value;
@end


@interface SegmentedViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *theSegment;
@property (weak, nonatomic) id<SegmentedViewControllerDelegate>delegate;

@property NSString* segmentValue;

- (void)setSegmentValue:(NSString *)segmentValue;
- (IBAction)segmentChanged:(UISegmentedControl *)sender;
- (IBAction)save:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
