
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageHelper : NSObject

+ (void)show:(UIViewController *)controller message:(NSString *) message detail:(NSString*)detail delay:(int)delay;
+ (void)load:(UIViewController *)controller message:(NSString *) message detail:(NSString*)detail view:(UIView*) view delay:(int) delay;
+ (void)success:(UIViewController *)controller message:(NSString *) message delay:(int)delay;
+ (void)failed:(UIViewController *)controller message:(NSString *) message delay:(int)delay;
+ (void)warn:(UIViewController *)controller message:(NSString *) message delay:(int)delay;

+ (void)hide;
+ (void)reset;

@end
