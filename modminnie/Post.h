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

@property (nonatomic, strong) NSString *oneWordDescriptor;
@property (nonatomic, strong) NSString *review;
@property (nonatomic, strong) NSString *category;


//@property (nonatomic, strong) PFFile *image;
//@property (nonatomic, strong) NSNumber *likeCount;
//@property (nonatomic, strong) NSNumber *commentCount;

+ (void) postUserReview: ( NSString * _Nullable )review withOneWordDescriptor: ( NSString * _Nullable )oneWordDescriptor andCategory:(NSString * _Nullable)category withCompletion: (PFBooleanResultBlock  _Nullable)completion;



@end

NS_ASSUME_NONNULL_END
