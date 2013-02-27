
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import "EMagView.h"

@implementation EMagView

@synthesize sender;
@synthesize data;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        EMagSender *btn = [[EMagSender alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        btn.source = self;
        self.sender = btn;
        [btn release];
        
        [self addSubview:btn];
        // Initialization code
    }
    return self;
}

-(void)reloadView{

}

-(void)reloadData{

}

-(void)onClick:(id)target action:(SEL)action{
    [self.sender addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc {
    [sender release];
    [data release];
    [super dealloc];
}


@end
