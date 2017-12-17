//
//  CAImageTableViewCell.m
//  CamelliaApp
//
//  Created by kys-6 on 2017/10/3.
//  Copyright © 2017年 kys-20. All rights reserved.
//

#import "CAImageTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"
#import "SDWebImageOperation.h"
#import "SDPhotoBrowser.h"
@interface CAImageTableViewCell () <SDPhotoBrowserDelegate>

@property (nonatomic, strong) NSArray *imagePathArray;

@property (nonatomic, strong) NSMutableArray *imageViewsArray;
@end
@implementation CAImageTableViewCell

- (NSString *)hight1
{
    if (!_hight1)
    {
        _hight1 = [[NSString alloc] init];
    }
    return _hight1;
}
- (UILabel *)detailTitleLabel {
    if (!_detailTitleLabel) {
        _detailTitleLabel = [[UILabel alloc]init];
    }
    return _detailTitleLabel;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *id=@"cell2";
    CAImageTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:id];
    if (cell==nil) {
        cell=[[CAImageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
    }
    [[SDImageCache sharedImageCache] clearMemory];
    [[NSURLCache sharedURLCache]removeAllCachedResponses];
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"三角"]];
image.frame = CGRectMake(5, 30, 25, 25);
[self.contentView addSubview:image];
self.detailTitleLabel.frame = CGRectMake(ScreenWidth*101/1242, 30, ScreenWidth, 25);
self.detailTitleLabel.text = @"图鉴";
self.detailTitleLabel.font=[UIFont fontWithName:@"Verdana-Bold" size:25];
[self.contentView addSubview:self.detailTitleLabel];
    }
    return self;
}

- (CGFloat)bulieTheImageView : (NSMutableArray *)imagePathArray detail:(NSMutableArray *)imageDetailPathArray
{
//    NSLog(@"%lu，%f",(unsigned long)[imageArray count],self.frame.size.width);
    self.imagePathArray = imageDetailPathArray;
    for (int i = 1; i<=[imagePathArray count]; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] init];
       imageView.frame = CGRectMake(ScreenWidth*32/1242, (ScreenWidth-ScreenWidth*64/1242)*(i-1)+60*(i-1)+60, ScreenWidth-ScreenWidth*64/1242,ScreenWidth-ScreenWidth*64/1242);
        [imageView sd_setImageWithURL:[NSURL URLWithString:imagePathArray[i-1]]placeholderImage:[UIImage imageNamed:@"1"]];
        imageView.userInteractionEnabled = YES;
        imageView.tag = i-1;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
        [imageView addGestureRecognizer:tap];
        
        [self.contentView addSubview:imageView];
        hight = imageView.frame.size.height;
        y = imageView.frame.origin.y;
        [self.imageViewsArray addObject:imageView];
//        NSLog(@"%f,%d",imageView.frame.size.height,i);
    }
    
    _hight1 = [NSString stringWithFormat:@"%lf",(y+hight)];
    return (y+hight);
}
//图片点击事件
- (void)tapImageView:(UITapGestureRecognizer *)tap
{
    UIView *imageView = tap.view;
    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    browser.currentImageIndex = imageView.tag;
    browser.sourceImagesContainerView = self.contentView;
    browser.imageCount = self.imagePathArray.count;
    browser.delegate = self;
    [browser show];
}
- (void)setFrame:(CGRect)frame {
    
    
    
    frame.size.width = self.frame.size.width;
    
    [super setFrame:frame];
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark - SDPhotoBrowserDelegate

- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    NSString *imageName = self.imagePathArray[index];
    NSURL *url = [NSURL URLWithString:imageName];
    return url;
}

- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    UIImageView *imageView = self.imageViewsArray[index];
    return imageView.image;
}

@end
