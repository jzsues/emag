
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMagScrollView.h"
#import "EMagChannelViewController.h"

@interface EMagMainViewController : UIViewController<UIScrollViewDelegate>

@property(nonatomic,retain) UIView *loadingView;
@property(nonatomic,retain) EMagScrollView *channelView;
@property(nonatomic,retain) UIView *menuView;
@property(nonatomic,retain) UIView *bgView;
@property (nonatomic, retain) NSString *requestUrl;
@property (nonatomic, retain) NSURL *reqUrl;
@property (nonatomic, retain) EMagChannelViewController *channelViewController;

-(void)getChannels;
-(NSMutableArray *)getPages;
-(NSMutableDictionary *)getPageContent;
-(void)showChannel:(NSArray *)data;
-(void)changeBg;

@end
