
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EncryptHelper : NSObject {

}

+(NSString *) md5:(NSString *) str;
+(NSString *)fileMd5:(NSString *) path;

@end
