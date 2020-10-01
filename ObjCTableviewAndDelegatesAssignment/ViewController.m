//
//  ViewController.m
//  ObjCTableviewAndDelegatesAssignment
//
//  Created by The App Experts on 30/09/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *mainTableview;
@property NSMutableArray*uiControllers;

-(void)populateArray;
@end

@implementation ViewController
@synthesize uiControllers;

-(void) populateArray {
    NSMutableArray*t1 = [[NSMutableArray alloc]initWithObjects:@"UIStepper",@"10", nil];
    NSMutableArray*t2 = [[NSMutableArray alloc]initWithObjects:@"UISwitch",@"true", nil];
    NSMutableArray*t3 = [[NSMutableArray alloc]initWithObjects:@"UITextfield",@"defaulttext", nil];
    NSMutableArray*t4 = [[NSMutableArray alloc]initWithObjects:@"UISlider",@"10", nil];
    NSMutableArray*t5 = [[NSMutableArray alloc]initWithObjects:@"UISegmentedControl",@"Hey", nil];
    NSMutableArray*t6 = [[NSMutableArray alloc]initWithObjects:@"DatePicker",@"6/7/1978", nil];
    NSMutableArray*t7 = [[NSMutableArray alloc]initWithObjects:@"PickerView",@"", nil];
    
    
    uiControllers = [[NSMutableArray alloc]initWithObjects:t1, t2, t3, t4, t5, t6, t7, nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self populateArray];
}

- (void) updateValueInArray:(NSString *)value {
    NSInteger updateIndex = [self.mainTableview indexPathForSelectedRow].row;
    NSLog(@"updateValueInArray %ld > %@ %@", updateIndex, uiControllers[updateIndex], value);
}

- (void)updateSegmentValueInArray:(NSString*) value {
  
    NSInteger updateIndex = [self.mainTableview indexPathForSelectedRow].row;
    NSString* toInsert = [[NSString alloc] initWithFormat:
                          @"%@", value];
    NSLog(@"indexPath %ld > %@ %@", updateIndex, uiControllers[updateIndex], value);
    NSMutableArray*t = uiControllers[updateIndex];
    [t replaceObjectAtIndex:1 withObject:toInsert];
    
    [uiControllers replaceObjectAtIndex:updateIndex withObject:t];
    
    [self.mainTableview reloadData];
}

- (void) updateSliderValueInArray:(NSString *)sliderValue {
    NSInteger updateIndex = [self.mainTableview indexPathForSelectedRow].row;
    NSString* toInsert = [[NSString alloc] initWithFormat:
                          @"%@", sliderValue];
    NSMutableArray*t = uiControllers[updateIndex];
    [t replaceObjectAtIndex:1 withObject:toInsert];
    
    [uiControllers replaceObjectAtIndex:updateIndex withObject:t];
    
    [self.mainTableview reloadData];
}

- (void)updateTextFieldValueInArray:(NSString *)text{
    NSInteger updateIndex = [self.mainTableview indexPathForSelectedRow].row;
    NSString* toInsert = [[NSString alloc] initWithFormat:
                          @"%@", text];
    NSMutableArray*t = uiControllers[updateIndex];
    [t replaceObjectAtIndex:1 withObject:toInsert];
    
    [uiControllers replaceObjectAtIndex:updateIndex withObject:t];
    
    [self.mainTableview reloadData];
    
}

- (void)updateStepperValueInArray:(int)step {
    NSInteger updateIndex = [self.mainTableview indexPathForSelectedRow].row;
    NSString* toInsert = [[NSString alloc] initWithFormat:
                          @"%d", step];
    NSMutableArray*t = uiControllers[updateIndex];
    [t replaceObjectAtIndex:1 withObject:toInsert];
    
    [uiControllers replaceObjectAtIndex:updateIndex withObject:t];
    
    [self.mainTableview reloadData];
    
}

- (void)updateSwitchValueInArray: (BOOL) isOn {
    NSInteger updateIndex = [self.mainTableview indexPathForSelectedRow].row;
    
    NSString*isOnString = @"true";
    if(!isOn){
        isOnString = @"false";
    }
    
    NSString* toInsert = [[NSString alloc] initWithFormat:
                          @"%@", isOnString];
    NSMutableArray*t = uiControllers[updateIndex];
    [t replaceObjectAtIndex:1 withObject:toInsert];
    
    [uiControllers replaceObjectAtIndex:updateIndex withObject:t];
    
    [self.mainTableview reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* otherViewController;
    if(indexPath.row == 0) {
        StepperViewController*stepperViewController = [storyboard instantiateViewControllerWithIdentifier:@"StepperViewController"];
        stepperViewController.delegate = self;
        stepperViewController.step = 10;
        otherViewController = stepperViewController;
    } else if(indexPath.row == 1){
        SwitchViewController* switchViewCtrl = [storyboard instantiateViewControllerWithIdentifier:@"SwitchViewController"];
        
        BOOL isOnB = NO;
        if([[[uiControllers objectAtIndex:indexPath.row]objectAtIndex:1] isEqualToString:@"true"]) {
            isOnB = YES;
        }
        
        switchViewCtrl.isOn = isOnB;
        switchViewCtrl.delegate = self;
        otherViewController = switchViewCtrl;
    } else if (indexPath.row == 2) {
        TextFieldViewController* textFieldViewController = [storyboard instantiateViewControllerWithIdentifier:@"TextFieldViewController"];
        textFieldViewController.delegate = self;
        textFieldViewController.text = uiControllers[2][1];
        otherViewController = textFieldViewController;
    } else if (indexPath.row == 3){
        SliderViewController*sliderViewController = [storyboard instantiateViewControllerWithIdentifier:@"SliderViewController"];
        sliderViewController.delegate = self;
        sliderViewController.sliderValue = uiControllers[3][1];
        otherViewController = sliderViewController;
    } else if (indexPath.row == 4) {
        SegmentedViewController* segmentedViewController = [storyboard instantiateViewControllerWithIdentifier:@"SegmentedViewController"];
        segmentedViewController.delegate = self;
        segmentedViewController.segmentValue = uiControllers[4][1];
        otherViewController = segmentedViewController;
    }
    
    [self.navigationController pushViewController:otherViewController animated:YES];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString * cellIdentifer = @"theCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer forIndexPath:indexPath ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    
    cell.textLabel.text = [[uiControllers objectAtIndex:indexPath.row] objectAtIndex:0];
    cell.detailTextLabel.text = [[uiControllers objectAtIndex:indexPath.row]objectAtIndex:1];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return [[self uiControllers] count];
}

@end
