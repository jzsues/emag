
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMagSender.h"
#import "EMagView.h"
#import "EMagImageView.h"

@interface EMagPaneView : EMagView


@property(nonatomic,strong) UIView *titleView;
@property(nonatomic,strong) UILabel *title;
@property(nonatomic,strong) UILabel *content;
@property(nonatomic,strong) UILabel *author;
@property(nonatomic,strong) UILabel *date;
@property(nonatomic,strong) UILabel *source;
@property(nonatomic,strong) EMagImageView *image;
@property(nonatomic,strong) UIView *borderTop;
@property(nonatomic,strong) UIView *borderLeft;
@property(nonatomic,strong) UIColor *borderColor;
@property(nonatomic,assign) BOOL enableBorderTop;
@property(nonatomic,assign) BOOL enableBorderLeft;
//1 text,2 image,3 audio,4 video
@property(nonatomic) int type;

@end
