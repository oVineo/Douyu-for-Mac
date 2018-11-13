//
//  EnterFullScreenButton.m
//  Douyu
//
//  Created by Vine on 2018/10/25.
//  Copyright © 2018 Lanskaya. All rights reserved.
//


#import "EnterFullScreenButton.h"

BOOL isFullScreen = NO;

@implementation EnterFullScreenButton

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (instancetype) initWithFrame:(NSRect)frameRect{
    self = [super initWithFrame:frameRect];
    if (self) {
        self.bordered=NO;
        [self setAction:@selector(clickButtonAction:)];
        [self setButtonType:NSButtonTypeToggle];
        [self setBezelStyle:NSDisclosureBezelStyle];
        [self setImagePosition:NSImageOnly];
        [self setImage:[NSImage imageNamed:@"fullscreen1"]];
        [self setTarget:self];
        NSArray* en_full_cons_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[en_full_btn(30)]" options:0 metrics:nil views:@{@"en_full_btn": self}];
        NSArray* en_full_cons_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[en_full_btn(30)]" options:0 metrics:nil views:@{@"en_full_btn": self}];
        [NSLayoutConstraint activateConstraints:en_full_cons_h];
        [NSLayoutConstraint activateConstraints:en_full_cons_v];
        //  [self setAction:@selector(clickButtonAction:)];
        self.translatesAutoresizingMaskIntoConstraints=NO;
        
        NSTrackingArea *area_V =[[NSTrackingArea alloc] initWithRect:self.bounds options:NSTrackingMouseEnteredAndExited|NSTrackingActiveInKeyWindow owner:self userInfo:nil];
        
        [self addTrackingArea:area_V];
        
        
        //  [self setAlternateImage:[NSImage imageNamed:@"play2_b6d759"]];
    }
    //play_status = NO;
    return self;
}

- (void)mouseExited:(NSEvent *)event {
  //  NSLog(@"EnterFullScreenButton exit");
    if(!isFullScreen){
        [self setImage:[NSImage imageNamed:@"fullscreen1"]];
    }
    else{
        [self setImage:[NSImage imageNamed:@"fullscreen_exit1"]];
    }
    
}

- (void)mouseEntered:(NSEvent *)event {
 //   NSLog(@"EnterFullScreenButton entered");
    if(!isFullScreen){
        [self setImage:[NSImage imageNamed:@"fullscreen2"]];
    }
    else{
        [self setImage:[NSImage imageNamed:@"fullscreen_exit2"]];
    }
    
}

- (IBAction)clickButtonAction:(id)sender {
    if(!isFullScreen){
         [self setImage:[NSImage imageNamed:@"fullscreen_exit1"]];
        isFullScreen =YES;
    }else{
         [self setImage:[NSImage imageNamed:@"fullscreen1"]];
        isFullScreen =NO;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"toggleFullScreenFromUI" object:nil userInfo:nil];
    
}

-(void)dealloc {
      [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end

