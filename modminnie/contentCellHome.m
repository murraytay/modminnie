//
//  contentCellHome.m
//  modminnie
//
//  Created by Taylor Murray on 5/8/19.
//  Copyright © 2019 Taylor Murray. All rights reserved.
//

#import "contentCellHome.h"

@implementation contentCellHome

@synthesize labelTodo = _labelTodo;

- (UILabel *)labelTodo {
    if(! _labelTodo){
        _labelTodo = [[UILabel alloc] init];
        [_labelTodo setText:@"To do action"];
        _labelTodo.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _labelTodo;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setUpViews{
    [self addSubview:_labelTodo];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    [self setUpViews];
    return [super initWithStyle:style reuseIdentifier:reuseIdentifier];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
