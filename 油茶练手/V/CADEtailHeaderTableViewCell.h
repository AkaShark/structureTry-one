//
//  CADEtailHeaderTableViewCell.h
//  CamelliaApp
//
//  Created by kys-6 on 2017/10/3.
//  Copyright © 2017年 kys-20. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CADEtailHeaderTableViewCell : UITableViewCell

@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, strong)UILabel *xueMingLabel;
@property (nonatomic,strong)NSString *hight;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
- (CGFloat)buildTheImageView:(NSString *)detailTitleString andDetailString:(NSString *)detailString;
@end
