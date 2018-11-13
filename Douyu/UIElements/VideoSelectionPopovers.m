//
//  VideoSelectionPopovers.m
//  Douyu
//
//  Created by Vine on 2018/10/25.
//  Copyright © 2018 Lanskaya. All rights reserved.
//

#import "VideoSelectionPopovers.h"



@implementation VideoSelectionPopovers

__strong InnerButton* low;
__strong InnerButton* medium;
__strong InnerButton* high;

NSTimer* disappeard;




- (void)mouseMoved:(NSEvent *)event {
    
    //   NSLog(@"pop MOVED");
    [self destroyTimer];
    [Parameters setInPopwindow:YES];
    
}
- (void)mouseExited:(NSEvent *)event {
    [self updateTimer];
    //  NSLog(@"pop exit");
}

- (void)mouseEntered:(NSEvent *)event {
    [Parameters setInPopwindow:YES];
    [self destroyTimer];
   // NSLog(@"pop entered");
    
}
-(void) updateTimer {
    [self destroyTimer];
    [self createTimer];
}

-(void) destroyTimer {
    if (disappeard != nil) {
        [disappeard invalidate];
        disappeard = nil;
    }
}

-(void) createTimer {

    disappeard = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(hideMyself) userInfo:nil repeats:NO];

}

-(void) hideMyself{
 
    [Parameters setInPopwindow:false];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"closePopDuetoTimeout" object:nil userInfo:nil];
}
     
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    [self.view setWantsLayer:YES];
    [self.view.layer setBackgroundColor:[NSColor colorWithRed:36/255.0 green:39/255.0 blue:43/255.0 alpha:1].CGColor];
    [self.view setAlphaValue:0.8f];
    low = [[InnerButton alloc] initWithFrame:NSMakeRect(0, 0, 45, 25)];
    [low setQuality:2];

    // [low setAction:@selector(clickButtonLow:)];
    
    medium = [[InnerButton alloc] initWithFrame:NSMakeRect(0, 26, 45, 25)];
    [medium setQuality:1];

    
    
    high = [[InnerButton alloc] initWithFrame:NSMakeRect(0, 52, 45, 25)];
    [high setQuality:0];

    
    [self.view addSubview:low];
    [self.view addSubview:medium];
    [self.view addSubview:high];
    
    NSArray* low_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[low]|" options:0 metrics:nil views:@{@"low": low}];
    [NSLayoutConstraint activateConstraints:low_h];
    NSArray* medium_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[medium]|" options:0 metrics:nil views:@{@"medium": medium}];
    [NSLayoutConstraint activateConstraints:medium_h];
    NSArray* high_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[high]|" options:0 metrics:nil views:@{@"high": high}];
    [NSLayoutConstraint activateConstraints:high_h];
    

    
    NSTrackingArea *area_V =[[NSTrackingArea alloc] initWithRect:self.view.bounds options:NSTrackingMouseEnteredAndExited|NSTrackingActiveInKeyWindow|NSTrackingMouseMoved owner:self userInfo:nil];
    
    [self.view addTrackingArea:area_V];
  
    
}




@end

