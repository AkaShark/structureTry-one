//
//  CAdataModel.h
//  CamelliaApp
//
//  Created by kys-6 on 2017/10/11.
//  Copyright © 2017年 kys-20. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CAdataModel : NSObject
//输出病虫害名称array
+(NSArray *)reloadTheName:(NSString *)name;
//输出遍历查找后的array
+(NSArray *)screenDataForClassify:(NSString *)method withDetail:(NSString *)value;
//通过名称key值查到对应数据
+(id)reloadTheDetail:(NSString *)name withKey:(NSString *)key;
+(NSArray *)returnTheRandom:(NSArray *)array;
+(NSString *)searchingTheDataWithMonth:(NSString *)data;
@end
