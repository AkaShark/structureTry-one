//
//  CAImageTableViewCell.h
//  CamelliaApp
//
//  Created by kys-6 on 2017/10/3.
//  Copyright © 2017年 kys-20. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAImageTableViewCell : UITableViewCell
{
    CGFloat y;
    CGFloat hight;
}
@property(nonatomic, strong)UILabel *detailTitleLabel;
@property(nonatomic, strong)NSString *cellHeight;
@property (nonatomic,strong) NSString *hight1;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

- (CGFloat)bulieTheImageView : (NSMutableArray *)imagePathArray detail:(NSMutableArray *)imageDetailPathArray;
@end
