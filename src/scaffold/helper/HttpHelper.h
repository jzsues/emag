
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "EncryptHelper.h"

@interface HttpHelper : NSObject

+(void)getSigned:(NSString *)url params:(NSMutableDictionary *)params delegate:(id)delegate success:(SEL)success error:(SEL)error;
+(void)postSigned:(NSString *)url params:(NSMutableDictionary *)params delegate:(id)delegate success:(SEL)success error:(SEL)error;

+(void)get:(NSString *)url params:(NSMutableDictionary *)params delegate:(id)delegate success:(SEL)success error:(SEL)error;

+(void)getWebPage:(NSString *)url params:(NSMutableDictionary *)params delegate:(id)delegate success:(SEL)success error:(SEL)error;

+(void)getWebPageSigned:(NSString *)url params:(NSMutableDictionary *)params delegate:(id)delegate success:(SEL)success error:(SEL)error;

+(BOOL)networkConnected;

@end
