//
//  CADataVIew.m
//  油茶练手
//
//  Created by kys-20 on 2017/12/9.
//  Copyright © 2017年 kys-20. All rights reserved.
//

#import "CADataVIew.h"
@implementation CADataVIew
//懒加载 只是声明全局是不行的啊
- (CADataDetailModel *)dataModel
{
    if (!_dataModel)
    {
        _dataModel = [[CADataDetailModel alloc] init];
    }
    return _dataModel;
}
- (NSMutableArray *)highArray
{
    if (!_highArray)
    {
        _highArray = [[NSMutableArray alloc] init];
    }
    return _highArray;
}

- (instancetype)initWithFrame:(CGRect)frame andTitle: (NSString *)title
{
    if (self = [super initWithFrame:frame])
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        self.tableView.dataSource = self.dataModel;
        self.tableView.delegate = self.dataModel;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.titleString = title;
        //初始化cell
        [self buildAllCell];
        [self addSubview:self.tableView];
    }
    return self;
}
//初始化cell
- (void)buildAllCell
{
    CADEtailHeaderTableViewCell *cell1=[CADEtailHeaderTableViewCell cellWithTableView:_tableView];
    [cell1 buildTheImageView:self.titleString andDetailString:[CACellModel AccordingToTheKeyString:self.titleString]];
    //float数据类型转成 nsnmuber类型更加好操作
    NSNumber *high1 = [NSNumber numberWithFloat:[cell1.hight floatValue]];
    [self.highArray addObject:high1];
    
    CADtailTableViewCell *cell2 = [CADtailTableViewCell cellWithTableView:_tableView];
    [cell2 buildTheImageView:[CACellModel AccordingToTheKeyReturnArrayString:self.titleString][0] andDetailString:[CACellModel AccordingToTheKeyString:self.titleString]];
    
    NSNumber *high2 = [NSNumber numberWithFloat:[cell2.hight floatValue]];
    [self.highArray addObject:high2];
    
    //照片的cell
    CAImageTableViewCell *cell3=[CAImageTableViewCell cellWithTableView:_tableView];
    //图片传的是99张有点问题
    NSLog(@"%@------%@",[CACellModel AccordingToTheKeyReturnImageURLArray:self.titleString andHDImage:NO],[CACellModel AccordingToTheKeyReturnImageURLArray:self.titleString andHDImage:YES]);
    [cell3 bulieTheImageView:[CACellModel AccordingToTheKeyReturnImageURLArray:self.titleString andHDImage:NO] detail:[CACellModel AccordingToTheKeyReturnImageURLArray:self.titleString andHDImage:YES]];
    NSNumber *high3 = [NSNumber numberWithFloat:[cell3.hight1 floatValue]];
    [self.highArray addObject:high3];
    
    CADtailTableViewCell *cell4=[CADtailTableViewCell
                                 cellWithTableView:_tableView];
    [cell4 buildTheImageView:[CACellModel AccordingToTheKeyReturnArrayString:self.titleString][1] andDetailString:[CACellModel AccordingToTheKeyReturnDetailString:self.titleString Key:[CACellModel AccordingToTheKeyReturnArrayString:self.titleString][1]]];
    
     NSNumber *high4 = [NSNumber numberWithFloat:[cell4.hight floatValue]];
    [self.highArray addObject:high4];
    
    //将cell装进数组 进入viewModel处理
    [_dataModel tableViewDataSoure:@[cell1,cell2,cell3,cell4]];
//   之前忘记将这个数组传入dataModel了。。。很难受时间一长就不想看了。。。
    [_dataModel tableViewHigh:_highArray];
    
}

@end
