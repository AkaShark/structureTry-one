//
//  CAdataModel.m
//  CamelliaApp
//
//  Created by kys-6 on 2017/10/11.
//  Copyright © 2017年 kys-20. All rights reserved.
//

#import "CAdataModel.h"

@implementation CAdataModel
-(NSDictionary *)reloadDataWithPlist:(NSString *)name{
    NSString *plistPath1 = [[NSBundle mainBundle]pathForResource:name ofType:@"plist"];
    NSDictionary *data1 = [[NSDictionary alloc]initWithContentsOfFile:plistPath1];

    return data1;
}
+(NSArray *)reloadTheName:(NSString *)name{
    NSDictionary *dic = [[self alloc] reloadDataWithPlist:@"dataName"];
    NSArray *dataArray = [dic objectForKey:name];
    return dataArray;
}
+(id)reloadTheDetail:(NSString *)name withKey:(NSString *)key{
    NSDictionary *dic = [[self alloc] reloadDataWithPlist:@"wormDetailData"];
    NSDictionary *dataDic = [dic objectForKey:name];
    
    return [dataDic valueForKey:key];
}
+(NSArray *)screenDataForClassify:(NSString *)method withDetail:(NSString *)value{
    NSDictionary *dic = [[self alloc] reloadDataWithPlist:@"wormDetailData"];
    NSArray *nameArray = [self reloadTheName:@"wormName"];
    NSMutableArray *dataArray = [[NSMutableArray alloc]init];
    for(NSString *name in nameArray){
        NSDictionary *dataDic = [dic objectForKey:name];

        if ([[dataDic valueForKey:method] isEqualToString:value]) {
            [dataArray addObject:name];
        }
    }

    return dataArray;
}
/**
 *@brief 随机打乱数组
 *@param array 原数组
 *@return 返回打乱数组
 */
+(NSArray *)returnTheRandom:(NSArray *)array{
    array = [array sortedArrayUsingComparator:^NSComparisonResult(NSString *str1, NSString *str2) {
        int seed = arc4random_uniform(2);
        if (seed) {
            return [str1 compare:str2];
        } else {
            return [str2 compare:str1];
        }
    }];
    return array;
}
/**
 *@brief 检索数据中的关键字的字段
 *@param data 原数组
 *@return 返回关键字段
 */
+(NSString *)searchingTheDataWithMonth:(NSString *)data{
    NSString *detailData = [self reloadTheDetail:data withKey:@"分布特点"];
    NSArray * arr = [detailData componentsSeparatedByString:@"。"];
    NSMutableArray *detailArr = [[NSMutableArray alloc]init];
    //获取当前月份
    NSDate *date =[NSDate date];//简书 FlyElephant
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM"];
    NSInteger currentMonth=[[formatter stringFromDate:date]integerValue];
    for (NSString *data in arr) {
        [detailArr addObjectsFromArray:[data componentsSeparatedByString:@"，"]];
    }
    NSString *detailString = [[NSString alloc]initWithFormat:@"当月危害："];
    for (NSString *data in detailArr) {
        if ([data containsString:[NSString stringWithFormat:@"%ld",currentMonth]]) {
            if ([data containsString:@"月"]) {
                detailString = [detailString stringByAppendingString:data];
            }
        }
    }
    if ([detailString isEqualToString:@"当月危害："]) {
        return detailData;
    }
    return detailString;
}
@end
