//
//  CADataDetailModel.h
//  油茶练手
//
//  Created by kys-20 on 2017/12/8.
//  Copyright © 2017年 kys-20. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 viewModel
 */
@interface CADataDetailModel : NSObject<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *cellArray;
@property (nonatomic,strong) NSArray *highArray;

/**
 传入一个数组 将tableViewDataSoure 移到这里
 数组中的元素是自定义的cell
 @param cellItem cell的集合
 */
- (void) tableViewDataSoure : (NSArray *)cellItem;

/**
 传入一个数组包含每个cell的高度

 @param highArray 高度数组
 */
- (void) tableViewHigh : (NSArray *)highArray;

@end
