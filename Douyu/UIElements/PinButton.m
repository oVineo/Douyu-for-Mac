//
//  PinButton.m
//  Douyu
//
//  Created by Vine on 2018/10/31.
//  Copyright © 2018 Lanskaya. All rights reserved.
//

#import "PinButton.h"

@implementation PinButton

- (instancetype) initWithFrame:(NSRect)frameRect{
    self = [super initWithFrame:frameRect];
    if (self) {
        self.bordered=NO;
        NSArray* pin_cons_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[pin_btn(30)]" options:0 metrics:nil views:@{@"pin_btn": self}];
        NSArray* pin_cons_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[pin_btn(30)]" options:0 metrics:nil views:@{@"pin_btn": self}];
        [NSLayoutConstraint activateConstraints:pin_cons_h];
        [NSLayoutConstraint activateConstraints:pin_cons_v];
        [self setButtonType:NSButtonTypeToggle];
        [self setBezelStyle:NSDisclosureBezelStyle];
        [self setImagePosition:NSImageOnly];

        [self setImageScaling:NSImageScaleAxesIndependently];
        [self setTarget:self];
        self.translatesAutoresizingMaskIntoConstraints=NO;
        [self setAction:@selector(clickButtonAction:)];
        
        NSTrackingArea *area_V =[[NSTrackingArea alloc] initWithRect:self.bounds options:NSTrackingMouseEnteredAndExited|NSTrackingActiveInKeyWindow owner:self userInfo:nil];
        
        [self addTrackingArea:area_V];
        [self updateImage];
    }
    //play_status = NO;
    return self;
}

- (void) updateImage {
    
    BOOL topmost = [[NSUserDefaults standardUserDefaults] boolForKey:@"topmost"];
    if(topmost){
        [self setImage:[NSImage imageNamed:@"top"]];
    }
    else{
        [self setImage:[NSImage imageNamed:@"notop"]];
    }
    
}

- (IBAction)clickButtonAction:(id)sender {
    
    BOOL topmost = [[NSUserDefaults standardUserDefaults] boolForKey:@"topmost"];
    [[NSUserDefaults standardUserDefaults] setBool:!topmost forKey:@"topmost"];
    [self updateImage];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SynchronizeTopStatus" object:nil];
}
@end
