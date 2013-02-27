
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


@property(nonatomic,retain) UIView *titleView;
@property(nonatomic,retain) UILabel *title;
@property(nonatomic,retain) UILabel *content;
@property(nonatomic,retain) UILabel *author;
@property(nonatomic,retain) UILabel *date;
@property(nonatomic,retain) UILabel *source;
@property(nonatomic,retain) EMagImageView *image;
@property(nonatomic,retain) UIView *borderTop;
@property(nonatomic,retain) UIView *borderLeft;
@property(nonatomic,retain) UIColor *borderColor;
@property(nonatomic,assign) BOOL enableBorderTop;
@property(nonatomic,assign) BOOL enableBorderLeft;
//1 text,2 image,3 audio,4 video
@property(nonatomic) int type;

@end
