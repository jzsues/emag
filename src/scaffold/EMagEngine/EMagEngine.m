
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import "EMagEngine.h"
#import "EMagPaneView.h"

@implementation EMagEngine(Private)

@end

@implementation EMagEngine

@synthesize layouts;
@synthesize paneSpacing;
@synthesize paneBackgroundColor;
@synthesize scrollViewBackgroundColor;

- (id)init
{
    self = [super init];
    if (self) {
        self.paneBackgroundColor = nil;
        self.layouts = [[NSMutableArray alloc] initWithObjects:
                        @"1-1", 
                        @"1-11", 
                        @"1-111", 
                        @"1-1", 
                        @"11-11", 
                        @"11-111", 
                        @"111-1", 
                        @"111-11", 
                        @"111-111", 
                        
                        @"1-1-1", 
                        @"1-1-11", 
                        @"1-1-111", 
                        @"1-11-1", 
                        @"1-11-11", 
                        @"1-11-111", 
                        @"1-111-1", 
                        @"1-111-11", 
                        @"1-111-111",
                        @"11-1-1", 
                        @"11-1-11", 
                        @"11-1-111", 
                        @"11-11-1", 
                        @"11-11-11", 
                        @"11-11-111", 
                        @"11-111-1", 
                        @"11-111-11", 
                        @"11-111-111",
                        @"111-1-1", 
                        @"111-1-11", 
                        @"111-1-111", 
                        @"111-11-1", 
                        @"111-11-11", 
                        @"111-11-111", 
                        @"111-111-1", 
                        @"111-111-11", 
                        @"111-111-111",
                    
                        @"1+1", 
                        @"1+11", 
                        @"1+111", 
                        @"11+1", 
                        @"11+11", 
                        @"11+111", 
                        @"111+1", 
                        @"111+11", 
                        @"111+111", 
                        
                        @"1+1+1", 
                        @"1+1+11", 
                        @"1+1+111", 
                        @"1+11+1", 
                        @"1+11+11", 
                        @"1+11+111", 
                        @"1+111+1", 
                        @"1+111+11", 
                        @"1+111+111",
                        @"11+1+1", 
                        @"11+1+11", 
                        @"11+1+111", 
                        @"11+11+1", 
                        @"11+11+11", 
                        @"11+11+111", 
                        @"11+111+1", 
                        @"11+111+11", 
                        @"11+111+111",
                        @"111+1+1", 
                        @"111+1+11", 
                        @"111+1+111", 
                        @"111+11+1", 
                        @"111+11+11", 
                        @"111+11+111", 
                        @"111+111+1", 
                        @"111+111+11", 
                        @"111+111+111",
                    
                        nil];
        [self.layouts release];
    }
    return self;
}

-(NSString *)getRandomLayout{
    int i = arc4random() % self.layouts.count;
    return [self.layouts objectAtIndex:i];
}

-(NSArray *)getPanesFromLayout:(NSString *)layout frame:(CGRect)frame{
    NSMutableArray *panes = [[NSMutableArray alloc] init];
    
    if(layout == nil){
        layout = [self getRandomLayout];
    }
    
    NSArray *layoutData = nil;
    //layoutData release or not
    int type = 0;
    if([layout rangeOfString:@"-"].location != NSNotFound){
        layoutData = [layout componentsSeparatedByString:@"-"];
    }else{
        layoutData = [layout componentsSeparatedByString:@"+"];
        type = 1;
    }
    
    float X = frame.origin.x;
    float Y = frame.origin.y;
    float W = frame.size.width;
    float H = frame.size.height;
    
    float x = 0;
    float y = 0;
    float w = 0;
    float h = 0;
    
    int count = layoutData.count;
    
    for(int i = 0;i < count;i++){
        
        //compute frame for view
        if(type == 0){
            h = (H-paneSpacing*(count+1))/count;
            y = Y+h*i+paneSpacing*(i+1);
        }else{
            w = (W-paneSpacing*(count+1))/count;
            x = X+w*i+paneSpacing*(i+1);
        }
        
       // int v = [[layoutData objectAtIndex:i] intValue];
        NSString *item = [layoutData objectAtIndex:i] ;
       
        int total = 0;
        for(int j=0;j<item.length;j++){
            NSString *ch = [item substringWithRange:NSMakeRange(j, 1)];
            total += [ch intValue];
        }
        
        int current = 0;
        
        for(int j=0;j<item.length;j++){
            int val = [[item substringWithRange:NSMakeRange(j, 1)] intValue];
            if(type == 0){
                x = current+paneSpacing;
                w = (W-paneSpacing*(item.length+1))*val/total;
                if(j == item.length - 1){
                    w = W - current - 2*paneSpacing;
                }
                current = x+w;
            }else{
                y = current+paneSpacing;
                h = (H-paneSpacing*(item.length+1))*val/total;
                if(j == item.length - 1){
                    h = H-current - 2*paneSpacing;
                }
                current = y + h;
            }
            
            //creat pane view
            CGRect frame = CGRectMake(x,y,w,h);
            EMagPaneView *view = [[EMagPaneView alloc] initWithFrame:frame];
            
            if(type == 0){
                if(j!=0){
                    view.enableBorderLeft = YES;
                }
                if(i!=0){
                    view.enableBorderTop = YES;
                }
            }else{
                if(j!=0){
                    view.enableBorderTop = YES;
                }
                if(i!=0){
                    view.enableBorderLeft = YES;
                }
            }
            
            if(self.paneBackgroundColor != nil)
                view.backgroundColor = self.paneBackgroundColor;
            
            [view reloadView];
            [panes addObject:view];
            [view release];
        }
        
        //[item release];
    }

    for(int i=0;i<panes.count;i++){
        UIView *view = (EMagPaneView *)[panes objectAtIndex:i];
    }
    return panes;
}

-(EMagPageView *)getEMagPageView:(CGRect)frame layout:(NSString *)layout{
    EMagPageView *pageView = [[EMagPageView alloc] initWithFrame:frame];
    if(layout == nil){
        layout = [self getRandomLayout];
    }
    NSArray *panes = [self getPanesFromLayout:layout frame:pageView.bounds];
    for(int i=0;i< panes.count;i++){
        EMagPaneView *pane = [panes objectAtIndex:i];
        [pageView addSubview:pane];
    }
    pageView.paneCount = panes.count;
    [panes release];
    return pageView;
}

-(EMagScrollView *)getEMagScrollView:(CGRect)frame pageFrame:(CGRect)pageFrame count:(int)count layout:(NSString *)layout{
    EMagScrollView *scrollView = [[EMagScrollView alloc] initWithFrame:frame];
    
    if(scrollViewBackgroundColor!=nil)
        scrollView.backgroundColor = scrollViewBackgroundColor;
    
    int currentCount = 0;
    int page = 0;
    int W = scrollView.bounds.size.width;
    int H = scrollView.bounds.size.height;

    float x = pageFrame.origin.x;
    float y = pageFrame.origin.y;
    float w = pageFrame.size.width;
    float h = pageFrame.size.height;
    
    while(currentCount < count){
        float indentX = W * page + x;
        EMagPageView *pageView = [self getEMagPageView:CGRectMake(indentX, y, w, h) layout:layout];
        currentCount += pageView.paneCount;
        [scrollView addSubview:pageView];
        [scrollView setContentSize:CGSizeMake(W * (page+1), H)];
        
        if(currentCount > count){
            int diff = currentCount - count;
            for(int i = (pageView.subviews.count-1); i>=0 && diff > 0; i--){
                UIView *v = [pageView.subviews objectAtIndex:i];
                if([v isMemberOfClass:[EMagPaneView class]]){
                    [v removeFromSuperview];
                    diff --;
                }
            }
        }
        page++;
        [pageView release];
    }
    
    return scrollView;
}

- (void)dealloc {
	[layouts release];
    [paneBackgroundColor release];
    [scrollViewBackgroundColor release];
    
    [super dealloc];
}

@end
