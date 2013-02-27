
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMagView.h"

@interface EMagPageView : EMagView

@property(nonatomic,assign) int paneCount;

-(NSArray *)getPanes;

@end
