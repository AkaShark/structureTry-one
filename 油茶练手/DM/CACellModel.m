//
//  CACellModel.m
//  油茶练手
//
//  Created by kys-20 on 2017/12/10.
//  Copyright © 2017年 kys-20. All rights reserved.
//

#import "CACellModel.h"
@interface CACellModel ()
{
    NSInteger ImageNumber;
}
@end

@implementation CACellModel

+ (NSString *)AccordingToTheKeyString:(NSString *)key
{
    if ([key containsString:@"病"])
    {
        return [CAdataModel reloadTheDetail:key withKey:@"病原菌"];
    }
    else
    {
        return [CAdataModel reloadTheDetail:key withKey:@"学名别名"];
    }
}

+ (NSArray *)AccordingToTheKeyReturnArrayString:(NSString *)key
{
    if ([key containsString:@"病"])
    {
        return [CAdataModel reloadTheName:@"diseaseList"];
    }
    else
    {
        return [CAdataModel reloadTheName:@"wormList"];
    }
}
//这个方法被调用了好几次导致最后数组的个数并不是存储的个数导致高度不对应就是这个问题 不明白为什么会这样 看看原先写的 怎么传入的个数的问题

+ (NSMutableArray *)AccordingToTheKeyReturnImageURLArray:(NSString *)key andHDImage:(BOOL)yes
{
    
    id a = [CAdataModel reloadTheDetail:key withKey:@"图片数目"];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSString *dataString  = [[NSString alloc] init];
    for (int i = 0; i<[a intValue]; i++)
    {
     
        //将汉字字符变成URL的dencoding
        NSString *hString = [key stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        //形成URL
        //判断是否为高清图
        if (yes)
        {
            dataString= [NSString stringWithFormat:@"http://oxi7i5wcm.bkt.clouddn.com/%@/image%d.jpg",hString,i];
        }
        else
        {
             dataString= [NSString stringWithFormat:@"http://oxi7i5wcm.bkt.clouddn.com/%@/image%d.jpg-fit",hString,i];
        }
        [array addObject:dataString];
    }
    return array;
}
+ (NSString *)AccordingToTheKeyReturnDetailString:(NSString *)who Key:(NSString *)key
{
    return [CAdataModel reloadTheDetail:who withKey:key];
}


@end
