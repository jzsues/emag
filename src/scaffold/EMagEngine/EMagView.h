
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMagSender.h"

@interface EMagView : UIScrollView

@property(nonatomic,retain) EMagSender *sender;
@property(nonatomic,retain) NSMutableDictionary *data;

-(void)onClick:(id)target action:(SEL)action;
-(void)reloadView;
-(void)reloadData;

@end
