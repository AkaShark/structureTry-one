//
//  CACellModel.h
//  油茶练手
//
//  Created by kys-20 on 2017/12/10.
//  Copyright © 2017年 kys-20. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CAdataModel.h"
#import "CAimageModel.h"
@interface CACellModel : NSObject
//@property (nonatomic,strong) NSString *titleString;
//@property (nonatomic,strong) NSArray *titleArray;


/**
 调用底层到接口 根据key返回nsstring

 @param key 关键字
 @return 具体细节
 */
+ (NSString *)AccordingToTheKeyString : (NSString *)key;

/**
 调用底层到接口 根据key返回array

 @param key 关键字
 @return 标题数组
 */
+ (NSArray *)AccordingToTheKeyReturnArrayString : (NSString *)key;



/**
 调用底层到接口 根据key返回imageURLArray

 @param key 关键字
 @param yes 是否高清图片
 @return 返回图片URL数组
 */
+ (NSMutableArray *)AccordingToTheKeyReturnImageURLArray:(NSString *)key andHDImage:(BOOL)yes;


/**
 调用底层到接口 根据key返回具体文字

 @param who 谁的
 @param key 关键字
 @return 返回具体细节
 */
+ (NSString *)AccordingToTheKeyReturnDetailString: (NSString *)who Key : (NSString *)key;

@end
