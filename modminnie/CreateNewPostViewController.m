//
//  CreateNewPostViewController.m
//  modminnie
//
//  Created by Taylor Murray on 5/13/19.
//  Copyright © 2019 Taylor Murray. All rights reserved.
//
#import "Parse.h"
#import "CreateNewPostViewController.h"
#import "Post.h"
#import "TagListView.h"
@interface CreateNewPostViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tagTextField;
@property (weak, nonatomic) IBOutlet UITextField *categoryField;
@property (weak, nonatomic) IBOutlet UITextField *titleField;

@property (weak, nonatomic) IBOutlet UITextField *oneWordDescriptorField;
@property (weak, nonatomic) IBOutlet UITextView *thoughtsTextView;

@property (weak, nonatomic) IBOutlet UITextField *startDateTextField;
@property (weak, nonatomic) IBOutlet TagListView *tagView;
@property (strong, nonatomic) NSMutableArray<NSString *> *tags;
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong,nonatomic) NSDate *date;
@end

@implementation CreateNewPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datePicker = [[UIDatePicker alloc]init];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    [self.startDateTextField setInputView:self.datePicker];
    

    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(ShowSelectedDate)];
    

    
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    [self.startDateTextField setInputAccessoryView:toolBar];
    
    UIToolbar *toolBarEnd=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBarEnd setTintColor:[UIColor grayColor]];
    
    // Do any additional setup after loading the view.
}
- (IBAction)addTag:(id)sender {
    [self.tagView addTag:self.tagTextField.text];
    [self.tags addObject:self.tagTextField.text];
}

-(void)ShowSelectedDate{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MMM dd, YYYY"];
    self.startDateTextField.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:self.datePicker.date]];
    self.date = self.datePicker.date;
    [self.startDateTextField resignFirstResponder];
}

- (IBAction)post:(id)sender {
    [Post postWithTitle:self.titleField.text withDate:self.date withCategory:self.categoryField.text withOneWordDescriptor:self.oneWordDescriptorField.text withThoughts:self.thoughtsTextView.text withTags:self.tags withCompletion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
