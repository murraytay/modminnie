//
//  CreateNewPostViewController.m
//  modminnie
//
//  Created by Taylor Murray on 5/13/19.
//  Copyright © 2019 Taylor Murray. All rights reserved.
//
#import <Parse.h>
#import "CreateNewPostViewController.h"
#import "Post.h"
@interface CreateNewPostViewController ()
@property (weak, nonatomic) IBOutlet UITextField *categoryField;

@property (weak, nonatomic) IBOutlet UITextField *oneWordDescriptorField;
@property (weak, nonatomic) IBOutlet UITextView *reviewTextField;
@property (weak, nonatomic) IBOutlet UITextField *startDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *endDateTextField;
@property (strong, nonatomic) UIDatePicker *datePicker;
@end

@implementation CreateNewPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datePicker = [[UIDatePicker alloc]init];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    [self.startDateTextField setInputView:self.datePicker];
//    [self.endDateTextField setInputView:self.datePicker];
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(ShowSelectedDate)];
    
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    [self.startDateTextField setInputAccessoryView:toolBar];
    
    
    // Do any additional setup after loading the view.
}

-(void)ShowSelectedDate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MMM dd, YYYY"];
    self.startDateTextField.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:self.datePicker.date]];
    [self.startDateTextField resignFirstResponder];
}

- (IBAction)post:(id)sender {
    [self postReview];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)postReview{
    [Post postUserReview:self.reviewTextField.text withOneWordDescriptor:self.oneWordDescriptorField.text andCategory:self.categoryField.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        if(succeeded){
            NSLog(@"posted review!");
        } else{
            NSLog(@"we did not post y'all");
        }
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
