//
//  TextFieldViewController.h
//  ObjCTableviewAndDelegatesAssignment
//
//  Created by The App Experts on 01/10/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TextFieldViewControllerDelegate <NSObject>

@required
-(void)updateTextFieldValueInArray:(NSString*) text;

@end

@interface TextFieldViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) id<TextFieldViewControllerDelegate> delegate;

@property NSString* text;

- (void)setText:(NSString *)text;
- (IBAction)save:(UIButton *)sender;
@end

NS_ASSUME_NONNULL_END
