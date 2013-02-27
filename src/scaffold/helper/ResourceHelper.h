
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ResourceHelper : NSObject {

}

+(UIImage *) loadImageByTheme:(NSString *) name;
+(UIImage *) loadImage:(NSString *) name;

+(NSObject *) getUserDefaults:(NSString *) name;
+(void) setUserDefaults:(NSObject *) defaults forKey:(NSString *) key;

@end
