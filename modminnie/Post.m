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

@dynamic title;
@dynamic dateConsumed;
@dynamic category;
@dynamic oneWordDescriptor;
@dynamic thoughts;
//@dynamic followUps;
//@dynamic learned;
//@dynamic questions;
@dynamic tags;


+ (nonnull NSString *)parseClassName{
    return @"Post";
}

//+ (void) postWithTitle: ( NSString * _Nullable )title withDate:(NSDate * _Nullable)date withCategory:(NSString * _Nullable)category withOneWordDescriptor: ( NSString * _Nullable )oneWordDescriptor  withThoughts:(NSString * _Nullable)thoughts withFollowUps:(NSArray * _Nullable)followUps withNotesLearned:(NSArray * _Nullable)learned withTags:(NSArray * _Nullable)tags withQuestions:(NSArray * _Nullable)questions withCompletion: (PFBooleanResultBlock  _Nullable)completion{
//
//    Post *newPost = [Post new];
//    newPost.author = [PFUser currentUser];
//    newPost.title = title;
//    newPost.dateConsumed = date;
//    newPost.category = category;
//    newPost.oneWordDescriptor = oneWordDescriptor;
//    newPost.thoughts = thoughts;
//    newPost.followUps = followUps;
//    newPost.questions = questions;
//    newPost.learned = learned;
//    newPost.tags = tags;
//
//    [newPost saveInBackgroundWithBlock: completion];
//}

+ (void) postWithTitle: ( NSString * _Nullable )title withDate:(NSDate * _Nullable)date withCategory:(NSString * _Nullable)category withOneWordDescriptor: ( NSString * _Nullable )oneWordDescriptor  withThoughts:(NSString * _Nullable)thoughts withTags:(NSArray * _Nullable)tags withCompletion: (PFBooleanResultBlock  _Nullable)completion{

    Post *newPost = [Post new];
    newPost.author = [PFUser currentUser];
    newPost.title = title;
    newPost.dateConsumed = date;
    newPost.category = category;
    newPost.oneWordDescriptor = oneWordDescriptor;
    newPost.thoughts = thoughts;
    newPost.tags = tags;

    [newPost saveInBackgroundWithBlock: completion];
}


@end
