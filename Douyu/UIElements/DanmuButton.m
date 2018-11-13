//
//  DanmuButton.m
//  Douyu
//
//  Created by Vine on 2018/10/25.
//  Copyright © 2018 Lanskaya. All rights reserved.
//


#import "DanmuButton.h"

@implementation DanmuButton

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}



- (instancetype) initWithFrame:(NSRect)frameRect{
    self = [super initWithFrame:frameRect];
    if (self) {
        self.bordered=NO;
        NSArray* danmu_cons_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[danmu_btn(80)]" options:0 metrics:nil views:@{@"danmu_btn": self}];
        NSArray* danmu_cons_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[danmu_btn(23)]" options:0 metrics:nil views:@{@"danmu_btn": self}];
        [NSLayoutConstraint activateConstraints:danmu_cons_h];
        [NSLayoutConstraint activateConstraints:danmu_cons_v];
        [self setButtonType:NSButtonTypeToggle];
        [self setBezelStyle:NSDisclosureBezelStyle];
        [self setImagePosition:NSImageOnly];
        [self setImage:[NSImage imageNamed:@"showdanmu_1"]];
      //  [self updatingimg];
        [self setTarget:self];
        self.translatesAutoresizingMaskIntoConstraints=NO;
        [self setAction:@selector(clickButtonAction:)];
        
        [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(updatingimg) name: @"updatingimg" object: nil];
    }
    //play_status = NO;
    return self;
}



-(void) updatingimg{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SynchronizeDanmuStatus"  object:nil];
    BOOL danmu_status=[[NSUserDefaults standardUserDefaults] boolForKey:@"barrageRendererStatus"];
    if (danmu_status==YES){
        [self setImage:[NSImage imageNamed:@"showdanmu_1"]];
    }else{
        [self setImage:[NSImage imageNamed:@"showdanmu_2"]];
    }
}

- (IBAction)clickButtonAction:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SynchronizeDanmuStatus"  object:nil];
    BOOL danmu_status=[[NSUserDefaults standardUserDefaults] boolForKey:@"barrageRendererStatus"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"toggleDanmu" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SynchronizeDanmuStatus"  object:nil];
    danmu_status=[[NSUserDefaults standardUserDefaults] boolForKey:@"barrageRendererStatus"];
    if(danmu_status){
        [self setImage:[NSImage imageNamed:@"showdanmu_1"]];
    
    }else{
        [self setImage:[NSImage imageNamed:@"showdanmu_2"]];

    }
}


@end

