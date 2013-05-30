
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import "ResourceHelper.h"

@implementation ResourceHelper

+(UIImage *) loadImageByTheme:(NSString *) name{
    if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad){
        name = [[NSString alloc] initWithFormat:@"pad_%@",name];
    }
    
    NSString *file = [[NSString alloc] initWithFormat:@"themes/%@/%@",[ResourceHelper  getUserDefaults:@"theme"],name];
	NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:@"png"];
	return [[UIImage alloc] initWithContentsOfFile:path];
}

+(UIImage *) loadImage:(NSString *) name{
    NSString *realName = name;
	NSString *path = [[NSBundle mainBundle] pathForResource:realName ofType:@"png"];
    
	return [[UIImage alloc] initWithContentsOfFile:path];
}

+(NSObject *) getUserDefaults:(NSString *) name{
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:name];
}

+(void) setUserDefaults:(NSObject *) defaults forKey:(NSString *) key{
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:defaults forKey:key];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

@end
