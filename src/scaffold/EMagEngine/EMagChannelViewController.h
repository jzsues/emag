
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMagScrollView.h"

@interface EMagChannelViewController : UIViewController<UIScrollViewDelegate>

@property(nonatomic,strong) EMagScrollView *itemsView;
@property(nonatomic,strong) NSMutableArray *items;

-(void)back;
-(void)fresh;

@end
