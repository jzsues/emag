
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import "FileHelper.h"

@implementation FileHelper

+(void)appendData:(NSDictionary *)data toFile:(NSString *)file{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	if ([paths count] > 0){
		NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *path = [paths[0] stringByAppendingPathComponent:file];
		if(![fileManager fileExistsAtPath:path]){
			NSMutableArray *fileData = [[NSMutableArray alloc] init];
            if([fileData writeToFile:path atomically:YES]){
                
            }

		}
        NSMutableArray *fileData = [[NSMutableArray alloc] initWithContentsOfFile:path];
        [fileData addObject:data];
        if([fileData writeToFile:path atomically:YES]){
            
        }
	}
}

+(void)prependData:(NSDictionary *)data toFile:(NSString *)file{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	if ([paths count] > 0){
		NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *path = [paths[0] stringByAppendingPathComponent:file];
		if(![fileManager fileExistsAtPath:path]){
			NSMutableArray *fileData = [[NSMutableArray alloc] init];
            if([fileData writeToFile:path atomically:YES]){
                
            }
		}
        NSMutableArray *fileData = [[NSMutableArray alloc] initWithContentsOfFile:path];
        if(![fileData containsObject:data]){
            [fileData insertObject:data atIndex:0];
            if([fileData writeToFile:path atomically:YES]){
                
            }
        }    
	}
}

+(NSMutableArray *)getDataFromFile:(NSString *)file{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	if ([paths count] > 0){
		NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *path = [paths[0] stringByAppendingPathComponent:file];
		if(![fileManager fileExistsAtPath:path]){
			return nil;
		}
        
        NSMutableArray *fileData = [[NSMutableArray alloc] initWithContentsOfFile:path];
        return  fileData;
	}
}

+(void)deleteData:(NSDictionary *)data ofFile:(NSString *)file{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	if ([paths count] > 0){
		NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *path = [paths[0] stringByAppendingPathComponent:file];
		if([fileManager fileExistsAtPath:path]){
			NSMutableArray *fileData = [[NSMutableArray alloc] initWithContentsOfFile:path];
            [fileData removeObject:data];
            if([fileData writeToFile:path atomically:YES]){}
		}
	}
}

@end
