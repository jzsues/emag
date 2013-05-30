
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMagScrollView.h"
#import "EMagChannelViewController.h"

@interface EMagMainViewController : UIViewController<UIScrollViewDelegate>

@property(nonatomic,strong) UIView *loadingView;
@property(nonatomic,strong) EMagScrollView *channelView;
@property(nonatomic,strong) UIView *menuView;
@property(nonatomic,strong) UIView *bgView;
@property (nonatomic, strong) NSString *requestUrl;
@property (nonatomic, strong) NSURL *reqUrl;
@property (nonatomic, strong) EMagChannelViewController *channelViewController;

-(void)getChannels;
-(NSMutableArray *)getPages;
-(NSMutableDictionary *)getPageContent;
-(void)showChannel:(NSArray *)data;
-(void)changeBg;

@end
