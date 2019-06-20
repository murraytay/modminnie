//
//  DetailedReviewViewController.h
//  modminnie
//
//  Created by Taylor Murray on 5/14/19.
//  Copyright © 2019 Taylor Murray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse.h"
#import "Post.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailedReviewViewController : UIViewController
@property (strong, nonatomic) Post *post;
@end

NS_ASSUME_NONNULL_END
