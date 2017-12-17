//
//  CAimageModel.m
//  CamelliaApp
//
//  Created by kys-6 on 2017/10/11.
//  Copyright © 2017年 kys-20. All rights reserved.
//

#import "CAimageModel.h"

@implementation CAimageModel
+(NSMutableArray *)imageDetailURL :(NSString *)text withTheNumber: (NSNumber *)count{
    NSMutableArray *array1 = [[NSMutableArray alloc] init];
    for (int i = 0; i < [count intValue]; i++) {
    NSString*hString = [text stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSString *dataSrtring1 = [NSString stringWithFormat:@"http://oxi7i5wcm.bkt.clouddn.com/%@/image%d.jpg",hString,i];
    [array1 addObject:dataSrtring1];
    }
    return array1;
}
+(NSMutableArray *)imageURL :(NSString *)text withTheNumber: (NSNumber *)count{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i < [count intValue]; i++) {
        NSString*hString = [text stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSString *dataSrtring = [NSString stringWithFormat:@"http://oxi7i5wcm.bkt.clouddn.com/%@/image%d.jpg-fit",hString,i];
        [array addObject:dataSrtring];
    }
    
    return array;
}
+(NSArray *)imageBtn :(NSArray *)titleArray{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSString *text in titleArray) {
        
        NSString*hString = [text stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSString *dataSrtring = [NSString stringWithFormat:@"http://oxi7i5wcm.bkt.clouddn.com/%@/image0.jpg-btn",hString];
        [array addObject:dataSrtring];
    }
    return [[NSArray alloc]initWithArray:array];
}
@end
