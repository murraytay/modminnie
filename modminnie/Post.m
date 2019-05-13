//
//  Post.m
//  modminnie
//
//  Created by Taylor Murray on 5/12/19.
//  Copyright © 2019 Taylor Murray. All rights reserved.
//

#import "Post.h"

@implementation Post

@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic review;
@dynamic oneWordDescriptor;
@dynamic category;



+ (nonnull NSString *)parseClassName{
    return @"Post";
}

+ (void) postUserReview: ( NSString * _Nullable )review withOneWordDescriptor: ( NSString * _Nullable )oneWordDescriptor andCategory: (NSString * _Nullable)category withCompletion: (PFBooleanResultBlock  _Nullable)completion {
    
    Post *newPost = [Post new];
    newPost.author = [PFUser currentUser];
    newPost.review = review;
    newPost.oneWordDescriptor = oneWordDescriptor;
    newPost.category = category;
    
    [newPost saveInBackgroundWithBlock: completion];
}


@end
