
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "CacheHelper.h"

@interface EMagImageView : UIImageView

@property (nonatomic, retain) UIActivityIndicatorView *loader;
@property (nonatomic, retain) NSString *requestUrl;
@property (nonatomic, retain) NSURL *reqUrl;
@property (nonatomic, retain) ASIHTTPRequest *request;

-(void)load:(NSString *)url;
-(void)render:(UIImage *)img;

@end
