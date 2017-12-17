//
//  CADtailTableViewCell.h
//  CamelliaApp
//
//  Created by kys-6 on 2017/10/4.
//  Copyright © 2017年 kys-20. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CADtailTableViewCell : UITableViewCell

@property(nonatomic, strong)UILabel *detailTitleLabel;
@property(nonatomic, strong)UILabel *detailLabel;
@property (nonatomic,strong) NSString* hight;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
- (CGFloat)buildTheImageView:(NSString *)detailTitleString andDetailString:(NSString *)detailString;
@end
