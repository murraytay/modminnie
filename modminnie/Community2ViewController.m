//
//  Community2ViewController.m
//  modminnie
//
//  Created by Taylor Murray on 5/14/19.
//  Copyright © 2019 Taylor Murray. All rights reserved.
//

#import "Community2ViewController.h"
#import <Parse.h>
#import "Post.h"
#import "PostCollectionViewCell.h"
#import "DetailedReviewViewController.h"
@interface Community2ViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *communityCollectionView;
@property (strong,nonatomic) NSArray *posts;
@end

@implementation Community2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self fetchPosts];
    self.communityCollectionView.delegate = self;
    self.communityCollectionView.dataSource = self;
    
    
}

-(void) fetchPosts{
    PFQuery *query = [Post query];
    [query whereKey:@"author" notEqualTo:PFUser.currentUser];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable queryPosts, NSError * _Nullable error) {
        if(error){
            NSLog(@"Error %@", error.localizedDescription);
        } else{
            self.posts = queryPosts;
            [self.communityCollectionView reloadData];
        }
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.posts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PostCollectionViewCell *cell = [self.communityCollectionView dequeueReusableCellWithReuseIdentifier:@"PostCollectionViewCell" forIndexPath:indexPath];
    Post *postSelected = self.posts[indexPath.item];
    cell.oneWord.text = postSelected.oneWordDescriptor;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"detailedReviewCommunitySegue" ]){
        PostCollectionViewCell *tappedCell = sender;
        NSIndexPath *indexPath = [self.communityCollectionView indexPathForCell:tappedCell];
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
