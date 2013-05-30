
//  https://github.com/zhiyu/emag/
//
//  Created by zhiyu on 7/11/12.
//  Copyright 2012 zhiyu. All rights reserved.
//

#import "EMagChannelViewController.h"
#import "EMagPaneView.h"
#import "EMagEngine.h"
#import <QuartzCore/QuartzCore.h>
#import "ResourceHelper.h"

@implementation EMagChannelViewController

@synthesize itemsView;
@synthesize items;


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [super loadView];
    float h = self.view.frame.size.height;
    float w = self.view.frame.size.width;
    
    self.view.frame = CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height);
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *back = [[UIButton alloc] initWithFrame:CGRectMake(0, h-32, 32, 32)];
    [back setImage:[ResourceHelper loadImage:@"opr_back"] forState:UIControlStateNormal];
    [back setImage:[ResourceHelper loadImage:@"opr_back"] forState:UIControlStateSelected];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    UIButton *fresh = [[UIButton alloc] initWithFrame:CGRectMake(320-32, h-32, 32, 32)];
    [fresh setImage:[ResourceHelper loadImage:@"opr_fresh"] forState:UIControlStateNormal];
    [fresh setImage:[ResourceHelper loadImage:@"opr_fresh"] forState:UIControlStateSelected];
    [fresh addTarget:self action:@selector(fresh) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fresh];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fresh];
}

-(void)fresh{
    if(self.itemsView !=nil){
        [self.itemsView removeFromSuperview];
    }
    
    EMagEngine *eMagEngine = [[EMagEngine alloc] init];
    eMagEngine.paneSpacing = 0;
    eMagEngine.paneBackgroundColor = [UIColor whiteColor];
    eMagEngine.scrollViewBackgroundColor = [UIColor blackColor];
    self.itemsView = [eMagEngine getEMagScrollView:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-32) pageFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-32) count:self.items.count layout:nil];
    itemsView.delegate = self;
    itemsView.backgroundColor = [UIColor whiteColor];
    
    NSArray *panes = [itemsView getPanes];
    for (int i =0;i< panes.count;i++) {
        EMagPaneView *v = panes[i];
        v.title.textColor = [UIColor whiteColor];
        v.data = (self.items)[i];
        [v reloadData];
        v.titleView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        v.titleView.frame = CGRectMake(v.titleView.frame.origin.x, v.frame.size.height-v.titleView.frame.size.height, v.titleView.frame.size.width, v.titleView.frame.size.height);
        
        [v onClick:self action:@selector(panePressed:)];
    }
    
    [self.view addSubview:itemsView];
}

-(void)back{
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = @"rippleEffect";
    transition.subtype = kCATransitionFromRight;
    transition.delegate = self;
    [self.view.superview.layer addAnimation:transition forKey:nil];
    [self.view removeFromSuperview];
}

-(void)panePressed:(id)sender{
    EMagSender *btn = (EMagSender *)sender;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

@end
