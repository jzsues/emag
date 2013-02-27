
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import "EMagImageView.h"

@implementation EMagImageView

@synthesize reqUrl;
@synthesize requestUrl;
@synthesize loader;
@synthesize request;

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        float w = self.bounds.size.width;
        float h = self.bounds.size.height;
        
        self.loader = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((w-20)/2, (h-20)/2, 20, 20)];
        [loader release];
        [loader setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [loader setHidesWhenStopped:YES];
        [self addSubview:loader];  
    }
    return self;
}

-(void)load:(NSString *)url{
    [loader startAnimating];
    self.requestUrl = url;
    
    NSData *cache = [CacheHelper get:requestUrl];
    if(cache!=nil){
        NSLog(@"img cache");
        NSData *data = [NSKeyedUnarchiver unarchiveObjectWithData:cache];
        UIImage *img = [[UIImage alloc] initWithData:data];
        [self render:img];
    }else{
        if([url rangeOfString:@"http"].location != 0){
            [self render:[UIImage imageNamed:url]];
        }else{
            self.reqUrl = [[NSURL alloc] initWithString: requestUrl];
            [reqUrl release];
            
            self.request = [[ASIHTTPRequest alloc] initWithURL:reqUrl];
            [request release];
            
            [request setTimeOutSeconds:10];
            [request setDelegate:self];
            [request startAsynchronous];
        }
    }    
}

- (void)requestFinished:(ASIHTTPRequest *)req
{
    if([reqUrl isEqual:req.url]){
        
        NSData *data = [req responseData];
        if(data!=nil){
            UIImage *img = [[UIImage alloc] initWithData:data];  
            [self render:img];
            NSData *cache = [NSKeyedArchiver archivedDataWithRootObject:data];
            [CacheHelper setObject:cache forKey:requestUrl withExpires:1000];
        }else{
            //no data
        }
    }
}

- (void)requestFailed:(ASIHTTPRequest *)req
{
    if([reqUrl isEqual:req.url]){
        [req cancel];
    }else{
        
    }
}

-(void)render:(UIImage *)img{
    self.image = img;
    self.contentMode = UIViewContentModeScaleAspectFill;  
    [self setNeedsDisplay];   
    [img release];
    [loader stopAnimating];
}

- (void)dealloc {  
    [request clearDelegatesAndCancel];
    [request release];
    [loader release];  
    [requestUrl release];  
    [reqUrl release];  
    [super dealloc];  
} 

@end
