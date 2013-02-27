
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import "EMagScrollView.h"
#import "EMagPageView.h"

@implementation EMagScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
}

-(NSArray *)getPanes{
    NSMutableArray *panes = [[NSMutableArray alloc] init];
    for(UIView *view in self.subviews){
        if([view isMemberOfClass:[EMagPageView class]]){
            EMagPageView *pageView = (EMagPageView *)view;
            NSArray *pes = [pageView getPanes];
            for(UIView *v in pes){
                [panes addObject:v];
            }
        }
    }

    return [panes autorelease];
}

- (void)dealloc {
    [super dealloc];
}
@end
