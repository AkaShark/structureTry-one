//
//  CAimageModel.h
//  CamelliaApp
//
//  Created by kys-6 on 2017/10/11.
//  Copyright © 2017年 kys-20. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CAimageModel : NSObject
+(NSMutableArray *)imageDetailURL :(NSString *)text withTheNumber: (NSNumber *)count;
+(NSMutableArray *)imageURL :(NSString *)text withTheNumber: (NSNumber *)count;
+(NSArray *)imageBtn :(NSArray *)titleArray;
@end
