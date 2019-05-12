//
//  ViewController.m
//  modminnie
//
//  Created by Taylor Murray on 5/6/19.
//  Copyright © 2019 Taylor Murray. All rights reserved.
//

#import "ViewController.h"
#import "contentCellHome.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [[UIColor alloc] initWithRed:250 green:0 blue:0 alpha:1];
    [self.navigationItem setTitle:@"To Do List"];
    [self.tableView registerClass:contentCellHome.self forCellReuseIdentifier:@"cellID"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    contentCellHome *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    return cell;
}



@end
