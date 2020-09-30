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
    NSMutableArray*t1 = [[NSMutableArray alloc]initWithObjects:@"UIStepper",@"0", nil];
    NSMutableArray*t2 = [[NSMutableArray alloc]initWithObjects:@"UISwitch",@"true", nil];
    NSMutableArray*t3 = [[NSMutableArray alloc]initWithObjects:@"UITextfield",@"defaulttext", nil];
    NSMutableArray*t4 = [[NSMutableArray alloc]initWithObjects:@"UISlider",@"10", nil];
    NSMutableArray*t5 = [[NSMutableArray alloc]initWithObjects:@"UISegmentedControl",@"", nil];
    NSMutableArray*t6 = [[NSMutableArray alloc]initWithObjects:@"DatePicker",@"6/7/1978", nil];
    NSMutableArray*t7 = [[NSMutableArray alloc]initWithObjects:@"PickerView",@"", nil];
    
    
    uiControllers = [[NSMutableArray alloc]initWithObjects:t1, t2, t3, t4, t5, t6, t7, nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self populateArray];
    
}

-(void)updateSwitchValueInArray: (BOOL) isOn {
    NSInteger updateIndex = [self.mainTableview indexPathForSelectedRow].row;
//    NSLog(@"indexPath %ld > %@ %d", updateIndex, uiControllers[updateIndex], isOn);
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
        
    } else if(indexPath.row == 1){
        SwitchViewController* switchViewCtrl = [storyboard instantiateViewControllerWithIdentifier:@"SwitchViewController"];
        
        BOOL isOnB = NO;
        if([[[uiControllers objectAtIndex:indexPath.row]objectAtIndex:1] isEqualToString:@"true"]) {
            isOnB = YES;
        }
        
        switchViewCtrl.isOn = isOnB;
        switchViewCtrl.delegate = self;
        otherViewController = switchViewCtrl;
    }
//    NSLog(@"row selected %@", [[uiControllers objectAtIndex:indexPath.row]objectAtIndex:1]);

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
