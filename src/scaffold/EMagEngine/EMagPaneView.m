
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import "EMagPaneView.h"
#import "ResourceHelper.h"

@implementation EMagPaneView

@synthesize titleView;
@synthesize title;
@synthesize content;
@synthesize author;
@synthesize date;
@synthesize source;
@synthesize image;
@synthesize type;
@synthesize borderTop;
@synthesize borderLeft;
@synthesize borderColor;
@synthesize enableBorderTop;
@synthesize enableBorderLeft;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        float r = (arc4random() % 255)/255.f;
        float g = (arc4random() % 255)/255.f;
        float b = (arc4random() % 255)/255.f;
        self.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:0.8];
        self.borderColor = [UIColor colorWithRed:0/255.f green:0/255.f blue:0/255.f alpha:1];
        
        self.type = 1;
        self.enableBorderLeft = NO;
        self.enableBorderTop = NO;
        
        self.image = [[EMagImageView alloc] initWithFrame:self.bounds];
        [self addSubview:image];
        
        float w = self.bounds.size.width;
        float h = self.bounds.size.height;
        
        self.borderTop  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, 1)];
        self.borderLeft = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, h)];
        borderTop.backgroundColor = self.borderColor;
        borderLeft.backgroundColor = self.borderColor;
        
        [self addSubview:borderTop];
        [self addSubview:borderLeft];
        
        self.titleView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, 30)];
        
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, w-10, 20)];
        title.font = [UIFont boldSystemFontOfSize:16];
        title.backgroundColor = [UIColor clearColor];
        [self.titleView addSubview:title];
        
        [self addSubview:titleView];
    }
    return self;
}

-(void)reloadView{
    borderTop.backgroundColor = self.borderColor;
    borderLeft.backgroundColor = self.borderColor;
    if(enableBorderTop)
        [borderTop setHidden:NO];
    else
        [borderTop setHidden:YES];
    
    if(enableBorderLeft)
        [borderLeft setHidden:NO];
    else
        [borderLeft setHidden:YES];
}

-(void)reloadData{
    float w = self.bounds.size.width;
    float h = self.bounds.size.height;
    
    title.text = (self.data)[@"title"];
    NSArray *medias = (self.data)[@"media"];
    if(medias!=nil && medias.count>0){
        NSDictionary *media = medias[0];
        NSString *mediaType = media[@"type"];
        NSString *url = media[@"url"];
        if([mediaType isEqualToString:@"image"]){
            [image load:url];
        }
    }
    
    title.numberOfLines = 0;
    title.lineBreakMode = UILineBreakModeCharacterWrap;
    [title sizeToFit];
    [title setFrame:CGRectMake(5, 5, w-10, title.frame.size.height)];
    [titleView setFrame:CGRectMake(0, 0, w, title.frame.size.height+10)];
}


@end
