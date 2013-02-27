
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import "HttpHelper.h"
#import "ASIHTTPRequest.h"
#import "ASIWebPageRequest.h"
#import "ASIDownloadCache.h"
#import "ASIFormDataRequest.h"
#import "Reachability.h"
#import "ResourceHelper.h"

@implementation HttpHelper

+(void)get:(NSString *)url params:(NSMutableDictionary *)params delegate:(id)delegate success:(SEL)success error:(SEL)error{
    NSMutableString *paramsString = [[NSMutableString alloc] init];
    
    [params retain];
    for(NSString *key in params){
        [paramsString appendFormat:@"&%@=%@",key,[params objectForKey:key]];
    }
    
    NSString *requestString = [[NSString alloc] initWithFormat:@"%@%@",url,paramsString];
    NSURL *reqUrl = [[NSURL alloc] initWithString:requestString];
    
    ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL:reqUrl];
    [reqUrl release];
    
    [request setTimeOutSeconds:10];
    [request setUserInfo:params];
    [request setDelegate:delegate];
    [request setDidFinishSelector:success];
    [request setDidFailSelector:error];
    
    [request startAsynchronous];   
    
    [params release];
    [paramsString release];
    [requestString release];
}

+(void)getWebPage:(NSString *)url params:(NSMutableDictionary *)params delegate:(id)delegate success:(SEL)success error:(SEL)error{
    NSMutableString *paramsString = [[NSMutableString alloc] init];
    
    [params retain];
    for(NSString *key in params){
        [paramsString appendFormat:@"&%@=%@",key,[params objectForKey:key]];
    }
    
    
    NSString *requestString = [[NSString alloc] initWithFormat:@"%@%@",url,paramsString];
    NSURL *reqUrl = [[NSURL alloc] initWithString:requestString];
    
    ASIWebPageRequest *request = [[ASIWebPageRequest alloc] initWithURL:reqUrl];
    [reqUrl release];
    
    request.delegate = self;
    [request setUrlReplacementMode:ASIReplaceExternalResourcesWithData];
    [request setDownloadCache:[ASIDownloadCache sharedCache]];
    [request setDownloadDestinationPath:[[ASIDownloadCache sharedCache] pathToStoreCachedResponseDataForRequest:request]];
    [request setTimeOutSeconds:10];
    [request setShouldAttemptPersistentConnection:NO];
    [request setUserInfo:params];
    [request setDelegate:delegate];
    [request setDidFinishSelector:success];
    [request setDidFailSelector:error];
    [request startAsynchronous];  
    
    [params release];
    [paramsString release];
    [requestString release];
}

@end
