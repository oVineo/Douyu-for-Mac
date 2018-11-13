//
//  VolButton.m
//  Douyu
//
//  Created by Vine on 2018/10/31.
//  Copyright © 2018 Lanskaya. All rights reserved.
//

#import "VolButton.h"

@implementation VolButton

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}


- (instancetype) initWithFrame:(NSRect)frameRect{
    self = [super initWithFrame:frameRect];
    if (self) {
        self.bordered=NO;
        NSArray* play_cons_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[play_btn(30)]" options:0 metrics:nil views:@{@"play_btn": self}];
        NSArray* play_cons_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[play_btn(30)]" options:0 metrics:nil views:@{@"play_btn": self}];
        [NSLayoutConstraint activateConstraints:play_cons_h];
        [NSLayoutConstraint activateConstraints:play_cons_v];
        [self setButtonType:NSButtonTypeToggle];
        [self setBezelStyle:NSDisclosureBezelStyle];
        [self setImagePosition:NSImageOnly];
        [self setImage:[NSImage imageNamed:@"volume1"]];
        [self setTarget:self];
        self.translatesAutoresizingMaskIntoConstraints=NO;
        [self setAction:@selector(clickButtonAction:)];
        
        NSTrackingArea *area_V =[[NSTrackingArea alloc] initWithRect:self.bounds options:NSTrackingMouseEnteredAndExited|NSTrackingActiveInKeyWindow|NSTrackingMouseMoved owner:self userInfo:nil];
        
        [self addTrackingArea:area_V];
        
        
        //  [self setAlternateImage:[NSImage imageNamed:@"play2_b6d759"]];
    }
    return self;
}
- (IBAction)clickButtonAction:(id)sender {
    BOOL mute= [[NSUserDefaults standardUserDefaults] boolForKey:@"mute"];
    if(mute){
        [[NSUserDefaults standardUserDefaults] setBool:!mute forKey:@"mute"];
        [[NSUserDefaults standardUserDefaults] setDouble:1.0 forKey:@"volume"];
    }
    else{
        [[NSUserDefaults standardUserDefaults] setBool:!mute forKey:@"mute"];
        [[NSUserDefaults standardUserDefaults] setDouble:0 forKey:@"volume"];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"toggleMute" object:nil userInfo:nil];
    if(mute)
       [self setImage:[NSImage imageNamed:@"volume1"]];
    else
         [self setImage:[NSImage imageNamed:@"volume2"]];
}

- (void)mouseExited:(NSEvent *)event {
    BOOL mute= [[NSUserDefaults standardUserDefaults] boolForKey:@"mute"];
    if(mute)
        [self setImage:[NSImage imageNamed:@"volume2"]];
    else
        [self setImage:[NSImage imageNamed:@"volume1"]];
    
}

- (void)mouseEntered:(NSEvent *)event {
    BOOL mute= [[NSUserDefaults standardUserDefaults] boolForKey:@"mute"];
    if(mute)
        [self setImage:[NSImage imageNamed:@"volume2"]];
    else
        [self setImage:[NSImage imageNamed:@"volume1"]];
    
}


@end
