
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileHelper : NSObject

+(void)appendData:(NSDictionary *)data toFile:(NSString *)file;
+(void)prependData:(NSDictionary *)data toFile:(NSString *)file;
+(NSMutableArray *)getDataFromFile:(NSString *)file;
+(void)deleteData:(NSDictionary *)data ofFile:(NSString *)file;

@end
