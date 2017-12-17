//
//  CADtailTableViewCell.m
//  CamelliaApp
//
//  Created by kys-6 on 2017/10/4.
//  Copyright © 2017年 kys-20. All rights reserved.
//

#import "CADtailTableViewCell.h"
#import "UILabel+Adaptive.h"



@implementation CADtailTableViewCell
- (NSString *)hight
{
    if (!_hight)
    {
        _hight = [[NSString alloc] init];
    }
    return _hight;
}
- (UILabel *)detailTitleLabel {
    if (!_detailTitleLabel) {
        _detailTitleLabel = [[UILabel alloc]init];
    }
    return _detailTitleLabel;
}
- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
    }
    return _detailLabel;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *id=@"cell3";
    CADtailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    if (cell==nil)
    {
        cell=[[CADtailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
    }
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"三角"]];
        image.frame = CGRectMake(5, 30, 25, 25);
        [self.contentView addSubview:image];
        self.detailTitleLabel.frame = CGRectMake(ScreenWidth*101/1242, 30, ScreenWidth, 25);
        
        self.detailTitleLabel.font=[UIFont fontWithName:@"Verdana-Bold" size:25];

        [self.contentView addSubview:self.detailTitleLabel];
        
        [self.contentView addSubview:self.detailLabel];
        
    }
    return self;
}

- (CGFloat)buildTheImageView:(NSString *)detailTitleString andDetailString:(NSString *)detailString{
    self.detailTitleLabel.text = detailTitleString;
    NSString * string = [[NSString alloc]init];
    if (detailTitleString.length == 0) {
        string = @"无";
    }else{
        string = detailString;
    }
    CGSize size = [self.detailLabel szieAdaptiveWithText:string andTextFont:[UIFont systemFontOfSize:19] andTextMaxSzie:CGSizeMake(ScreenWidth*1181/1242, 0)andHangHeight:0];
    
    //关键语句  ios 物理效果
    self.detailLabel.frame = CGRectMake(ScreenWidth*32/1242, self.detailTitleLabel.viewY+self.detailTitleLabel.viewHeight+10, size.width, size.height);
    
    _hight = [NSString stringWithFormat:@"%lf",(self.detailLabel.viewY+self.detailLabel.viewHeight)];
    
    return (self.detailLabel.viewY+self.detailLabel.viewHeight);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
