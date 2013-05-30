
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import "EMagPageView.h"
#import "EMagPaneView.h"

@implementation EMagPageView

@synthesize paneCount;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(NSArray *)getPanes{
    NSMutableArray *panes = [[NSMutableArray alloc] init];
    for(UIView *view in self.subviews){
        if([view isMemberOfClass:[EMagPaneView class]]){
            [panes addObject:view];
        }
    }
    return panes;
}
@end
