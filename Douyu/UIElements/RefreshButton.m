//
//  RefreshButton.m
//  Douyu
//
//  Created by Vine on 2018/10/25.
//  Copyright © 2018 Lanskaya. All rights reserved.
//


#import "RefreshButton.h"

@implementation RefreshButton

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}


- (instancetype) initWithFrame:(NSRect)frameRect{
    self = [super initWithFrame:frameRect];
    if (self) {
        self.bordered=NO;
        [self setButtonType:NSButtonTypeToggle];
        [self setBezelStyle:NSDisclosureBezelStyle];
        [self setImagePosition:NSImageOnly];
        [self setImage:[NSImage imageNamed:@"reload1"]];
        [self setTarget:self];
        [self setAction:@selector(clickButtonAction:)];
        NSArray* re_cons_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[re_btn(30)]" options:0 metrics:nil views:@{@"re_btn": self}];
        NSArray* re_cons_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[re_btn(30)]" options:0 metrics:nil views:@{@"re_btn": self}];
        [NSLayoutConstraint activateConstraints:re_cons_h];
        [NSLayoutConstraint activateConstraints:re_cons_v];
        //  [self setAction:@selector(clickButtonAction:)];
        self.translatesAutoresizingMaskIntoConstraints=NO;
        NSTrackingArea *area_V =[[NSTrackingArea alloc] initWithRect:self.bounds options:NSTrackingMouseEnteredAndExited|NSTrackingActiveInKeyWindow owner:self userInfo:nil];
        
        [self addTrackingArea:area_V];
        
        
        //  [self setAlternateImage:[NSImage imageNamed:@"play2_b6d759"]];
    }
    //play_status = NO;
    return self;
}
- (IBAction)clickButtonAction:(id)sender {
[[NSNotificationCenter defaultCenter] postNotificationName:@"toggleRefresh" object:nil userInfo:nil];
}
- (void)mouseExited:(NSEvent *)event {
   // NSLog(@"refreshbtn exit");
    
    [self setImage:[NSImage imageNamed:@"reload1"]];
    
}

- (void)mouseEntered:(NSEvent *)event {
  //  NSLog(@"refreshbtn entered");
    
    [self setImage:[NSImage imageNamed:@"reload2"]];
    
}


@end
