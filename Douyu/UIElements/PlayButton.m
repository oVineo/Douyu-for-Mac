//
//  PlayButton.m
//  Douyu
//
//  Created by Vine on 2018/10/25.
//  Copyright © 2018 Lanskaya. All rights reserved.
//


#import "PlayButton.h"

@implementation PlayButton



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
        //[self setImage:[NSImage imageNamed:@"pause1_493827"]];
        [self updatingimg];
        [self setTarget:self];
        self.translatesAutoresizingMaskIntoConstraints=NO;
        [self setAction:@selector(clickButtonAction:)];
        
        NSTrackingArea *area_V =[[NSTrackingArea alloc] initWithRect:self.bounds options:NSTrackingMouseEnteredAndExited|NSTrackingActiveInKeyWindow owner:self userInfo:nil];
        
        [self addTrackingArea:area_V];
        
        
        //  [self setAlternateImage:[NSImage imageNamed:@"play2_b6d759"]];
    }
    //play_status = NO;
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (bool) get_status {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SynchronizePlayStatus" object:nil];
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"PlayStatus"];
}

- (void) set_status:(bool)st {
    [[NSUserDefaults standardUserDefaults] setBool:st forKey:@"PlayStatus"];
    [self updatingimg];
}

-(void) updatingimg{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"PlayStatus"]){
        [self setImage:[NSImage imageNamed:@"play1"]];
    }else{
        [self setImage:[NSImage imageNamed:@"pause1"]];
    }
}

- (IBAction)clickButtonAction:(id)sender {
    // [self setImage:[NSImage imageNamed:@"play1_63c949"]];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SynchronizePlayStatus" object:nil userInfo:nil];
    NSLog(@"playbtn clicked");

    [[NSNotificationCenter defaultCenter] postNotificationName:@"togglePlayfromUI" object:nil userInfo:nil];
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"PlayStatus"]){
        [self setImage:[NSImage imageNamed:@"pause2"]];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"PlayStatus"];
    }else{
        [self setImage:[NSImage imageNamed:@"play2"]];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"PlayStatus"];
    }
}

- (void)mouseExited:(NSEvent *)event {
    NSLog(@"playbtn exit");
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"PlayStatus"])
        [self setImage:[NSImage imageNamed:@"play1"]];
    else
        [self setImage:[NSImage imageNamed:@"pause1"]];
    
}

- (void)mouseEntered:(NSEvent *)event {
    NSLog(@"playbtn entered");
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"PlayStatus"])
        [self setImage:[NSImage imageNamed:@"play2"]];
    else
        [self setImage:[NSImage imageNamed:@"pause2"]];
    
}


@end

