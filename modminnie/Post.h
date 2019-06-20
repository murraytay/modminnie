//
//  Post.h
//  modminnie
//
//  Created by Taylor Murray on 5/12/19.
//  Copyright © 2019 Taylor Murray. All rights reserved.
//

#import "PFObject.h"
#import <Foundation/Foundation.h>
#import "Parse/Parse.h"

NS_ASSUME_NONNULL_BEGIN

@interface Post : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) PFUser *author;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDate *dateConsumed;
@property (nonatomic, strong) NSString *category;

@property (nonatomic, strong) NSString *oneWordDescriptor;
@property (nonatomic, strong) NSString *thoughts;
//@property (nonatomic, strong) NSArray *followUps;
//@property (nonatomic, strong) NSArray *learned;
//@property (nonatomic, strong) NSArray *questions;
@property (nonatomic, strong) NSArray *tags;


//+ (void) postWithTitle: ( NSString * _Nullable )title withDate:(NSDate * _Nullable)date withCategory:(NSString * _Nullable)category withOneWordDescriptor: ( NSString * _Nullable )oneWordDescriptor  withThoughts:(NSString * _Nullable)thoughts withFollowUps:(NSArray * _Nullable)followUps withNotesLearned:(NSArray * _Nullable)learned withTags:(NSArray * _Nullable)tags withQuestions:(NSArray * _Nullable)questions withCompletion: (PFBooleanResultBlock  _Nullable)completion;

+ (void) postWithTitle: ( NSString * _Nullable )title withDate:(NSDate * _Nullable)date withCategory:(NSString * _Nullable)category withOneWordDescriptor: ( NSString * _Nullable )oneWordDescriptor  withThoughts:(NSString * _Nullable)thoughts withTags:(NSArray * _Nullable)tags withCompletion: (PFBooleanResultBlock  _Nullable)completion;

@end

NS_ASSUME_NONNULL_END
