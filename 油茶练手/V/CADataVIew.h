//
//  CADataVIew.h
//  油茶练手
//
//  Created by kys-20 on 2017/12/9.
//  Copyright © 2017年 kys-20. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CADataDetailModel.h"
#import "CACellModel.h"
#import "CADEtailHeaderTableViewCell.h"
#import "CADtailTableViewCell.h"
#import "CAImageTableViewCell.h"

@interface CADataVIew : UIView
@property (nonatomic,strong) NSString *titleString;
@property (nonatomic,strong) CADataDetailModel *dataModel;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *highArray;

- (instancetype)initWithFrame:(CGRect)frame andTitle: (NSString *)title;
@end
