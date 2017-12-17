//
//  CADataDetailModel.m
//  油茶练手
//
//  Created by kys-20 on 2017/12/8.
//  Copyright © 2017年 kys-20. All rights reserved.
//初始化对象啊 只声明不初始化肯定是不行的啊


#import "CADataDetailModel.h"

@implementation CADataDetailModel
- (void)tableViewHigh:(NSArray *)highArray
{
    self.highArray = highArray;
}
//传入数组
- (void)tableViewDataSoure:(NSArray *)cellItem
{
    self.cellArray = cellItem;
}
#pragma mark =====tableVIewDataSoure =====
//section的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//cell的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellArray.count;
}
//返回那个cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.cellArray[indexPath.row];
}
//高度 在cell中定义一个高度的方法返回
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *sum = self.highArray[indexPath.row];
    
    return [sum floatValue];
}
@end
