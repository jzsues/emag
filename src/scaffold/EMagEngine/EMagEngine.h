
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMagScrollView.h"
#import "EMagPageView.h"

@protocol EMagScrollViewDelegate <NSObject>

-(void)scrollStart:(int)page;
-(void)scrollEnd:(int)page;

@end


@interface EMagEngine : NSObject {
    
}

@property(nonatomic,assign) int paneSpacing;
@property(nonatomic,retain) NSMutableArray *layouts;
@property(nonatomic,retain) UIColor *paneBackgroundColor;
@property(nonatomic,retain) UIColor *scrollViewBackgroundColor;

-(NSString *)getRandomLayout;
-(NSArray *)getPanesFromLayout:(NSString *)layout frame:(CGRect)frame;

-(EMagPageView *)getEMagPageView:(CGRect)frame layout:(NSString *)layout;
-(EMagScrollView *)getEMagScrollView:(CGRect)frame pageFrame:(CGRect)pageFrame count:(int)count layout:(NSString *)layout;

@end
