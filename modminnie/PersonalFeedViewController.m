//
//  PersonalFeedViewController.m
//  modminnie
//
//  Created by Taylor Murray on 5/13/19.
//  Copyright © 2019 Taylor Murray. All rights reserved.
//
#import "Parse.h"
#import "PersonalFeedViewController.h"
#import "Post.h"
#import "PostCollectionViewCell.h"
#include "DetailedReviewViewController.h"
@interface PersonalFeedViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *personalFeedCollectionView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) NSArray *posts;

@end

@implementation PersonalFeedViewController
- (IBAction)newReview:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"createNewPost" sender:nil];
}
- (IBAction)logout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        if(error){
            NSLog(@"We got an error, %@", error.localizedDescription);
        } else{
            NSLog(@"We logged out!");
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.personalFeedCollectionView.delegate = self;
    self.personalFeedCollectionView.dataSource = self;
    // Do any additional setup after loading the view.
    
    [self fetchPosts];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchPosts) forControlEvents:UIControlEventValueChanged];
    [self.personalFeedCollectionView addSubview:self.refreshControl];
    NSLog(@"after test of refreshControl");
}



-(void)fetchPosts{
    PFQuery *postQuery = [Post query];
    [postQuery whereKey:@"author" equalTo:PFUser.currentUser];
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable postsFromQuery, NSError * _Nullable error) {
        if(error != nil){
            NSLog(@"Error, %@", error.localizedDescription);
        } else{
            self.posts = postsFromQuery;
            [self.personalFeedCollectionView reloadData];
            
        }
        [self.refreshControl endRefreshing];
    }];
    
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PostCollectionViewCell *cell = [self.personalFeedCollectionView dequeueReusableCellWithReuseIdentifier:@"PostCollectionViewCell" forIndexPath:indexPath];
    Post *post = self.posts[indexPath.item];
    cell.oneWord.text = post.oneWordDescriptor;
    return cell;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.posts.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"detailedReviewSegue" ]){
        PostCollectionViewCell *tappedCell = sender;
        NSIndexPath *indexPath = [self.personalFeedCollectionView indexPathForCell:tappedCell];
        Post *tappedPost = self.posts[indexPath.item];
        DetailedReviewViewController *detailViewController = [segue destinationViewController];
        detailViewController.post = tappedPost;
    }
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
