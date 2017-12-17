//
//  CADEtailHeaderTableViewCell.m
//  CamelliaApp
//
//  Created by kys-6 on 2017/10/3.
//  Copyright © 2017年 kys-20. All rights reserved.
//

#import "CADEtailHeaderTableViewCell.h"
#import "UILabel+Adaptive.h"


@implementation CADEtailHeaderTableViewCell
- (NSString *)hight
{
    if (!_hight)
    {
        _hight = [[NSString alloc] init];
    }
    return _hight;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
    }
    return _titleLabel;
}
- (UILabel *)xueMingLabel {
    if (!_xueMingLabel) {
        _xueMingLabel = [[UILabel alloc]init];
    }
    return _xueMingLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *id=@"cell1";
    CADEtailHeaderTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:id];
    if (cell==nil) {
        cell=[[CADEtailHeaderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
    }
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.titleLabel.frame = CGRectMake(ScreenWidth*38/1242, ScreenHeight*75/2208, ScreenWidth, 30);

        self.titleLabel.font=[UIFont fontWithName:@"Verdana-Bold" size:30];
        [self.contentView addSubview:self.titleLabel];
        
    }
    return self;
}

- (CGFloat)buildTheImageView:(NSString *)detailTitleString andDetailString:(NSString *)detailString{
    
    self.titleLabel.text = detailTitleString;
    CGSize size = [self.xueMingLabel szieAdaptiveWithText:detailString andTextFont:[UIFont systemFontOfSize:19] andTextMaxSzie:CGSizeMake(ScreenWidth*1181/1242, 0)andHangHeight:0];
    
    //关键语句
    self.xueMingLabel.frame = CGRectMake(ScreenWidth*32/1242, self.titleLabel.viewY+self.titleLabel.viewHeight+10, size.width, size.height);
    self.xueMingLabel.backgroundColor = standardGray;
    self.xueMingLabel.textColor = [UIColor darkGrayColor];
    [self changeTheEnglishColor:self.xueMingLabel];
    [self.contentView addSubview:self.xueMingLabel];
    
    _hight =[NSString stringWithFormat:@"%f",self.xueMingLabel.viewY+self.xueMingLabel.viewHeight] ;
    return self.xueMingLabel.viewY+self.xueMingLabel.viewHeight;
    
}
/**
 *@brief 设置label上面的英文text的字体颜色为红色
 *@param label 需要改变text的label
 */
- (void)changeTheEnglishColor:(UILabel *)label{
    NSString *testString = label.text;
    NSInteger alength = [testString length];
    //统计Range数组
    NSMutableArray *rangeArray = [[NSMutableArray alloc]init];
    for (int i = 0; i<alength; i++) {
        int commitChar = [testString characterAtIndex:i];
        if (((commitChar>64)&&(commitChar<91))||((commitChar>96)&&(commitChar<123))) {
//            NSLog(@"char == %c,int == %d",commitChar,i);
            for (int j = i; j<alength; j++){
                NSString *temp = [testString substringWithRange:NSMakeRange(j,1)];
                if (strlen([temp UTF8String])==3){
                    NSRange range = NSMakeRange(i, j-i);
                    //                    NSLog(@"%lu,%lu",(unsigned long)range.location,(unsigned long)range.length);
                    [rangeArray addObject:[NSValue valueWithRange:range]];
                    i =j;
                    break;
                }
            }
        }
    }
    //    NSLog(@"%lu",(unsigned long)[rangeArray count]);
    NSMutableAttributedString *hintString=[[NSMutableAttributedString alloc]initWithString:testString];
    for (int i = 0; i < [rangeArray count] ; i++) {
        [hintString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:[rangeArray[i] rangeValue]];
    }
    label.attributedText = hintString;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
