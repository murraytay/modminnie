//
//  DetailedReviewViewController.m
//  modminnie
//
//  Created by Taylor Murray on 5/14/19.
//  Copyright © 2019 Taylor Murray. All rights reserved.
//

#import "DetailedReviewViewController.h"

@interface DetailedReviewViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *oneWordLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeOfMediaLabel;
@property (weak, nonatomic) IBOutlet UILabel *reviewLabel;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *gestureRecognizer;

@end

@implementation DetailedReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.reviewLabel setText:self.post.review];
    [self.oneWordLabel setText:self.post.oneWordDescriptor];
    [self.typeOfMediaLabel setText:self.post.category];
    [self.gestureRecognizer addTarget:self action:@selector(swipeDown)];
    self.gestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    
}

-(void)swipeDown{
    [self dismissViewControllerAnimated:YES completion:nil];
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
