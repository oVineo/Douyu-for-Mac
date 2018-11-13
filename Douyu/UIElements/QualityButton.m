//
//  QualityButton.m
//  Douyu
//
//  Created by Vine on 2018/10/25.
//  Copyright © 2018 Lanskaya. All rights reserved.
//

#import "QualityButton.h"

#import "Parameters.h"
//static Class QualityComboBoxCell;


@implementation QualityButton



__strong  VideoSelectionPopovers *viewController;

NSPopover *entryPopover;

- (void)HideDuetoClick:(NSInteger*)v_quality {
    NSLog(@"close popoverview");
    //close popover view
  //  [Parameters setInPopwindow:false];
    [self updateQuality];
    [entryPopover close];
    
    [self updateQuality];
}

-(void) updateQuality {
    NSInteger videoQuality = [[NSUserDefaults standardUserDefaults] integerForKey:@"videoQuality"];
    if(videoQuality==[Parameters _HighQuality]){
        [self setTitle:@"超清"];
    }else{
        if (videoQuality==[Parameters _MediumQuality]){
            [self setTitle:@"高清"];
        }else{
            if(videoQuality==[Parameters _LowQuality]){
                [self setTitle:@"标清"];
            }
            else{
                [self setTitle:@"高清"];
            }
        }
    }
    
}

- (void) closePopDuetoTimeout {
    [entryPopover close];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HideUIduetoPopTimeout" object:nil userInfo:nil];
}


- (void)drawRect:(NSRect)dirtyRect {
    
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
    [[NSColor colorWithRed:29/255.0 green:29/255.0 blue:30/255.0 alpha:1] set];
    NSRectFill(self.bounds);
    
    if ([self title] != nil) {
        NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
        [paraStyle setParagraphStyle:[NSParagraphStyle defaultParagraphStyle]];
        [paraStyle setAlignment:NSTextAlignmentCenter];
        
        NSDictionary *attrButton = [NSDictionary dictionaryWithObjectsAndKeys:[NSFont fontWithName:@"Verdana" size:12], NSFontAttributeName, [NSColor colorWithCalibratedRed:1 green:167/255.0 blue:68/255.0 alpha:1], NSForegroundColorAttributeName, paraStyle, NSParagraphStyleAttributeName, nil];
        
        NSAttributedString * btnString = [[NSAttributedString alloc] initWithString:[self title] attributes:attrButton];
        
        [btnString drawInRect:NSMakeRect(0, -1.5, self.frame.size.width, self.frame.size.height)];
    }
}



- (instancetype) initWithFrame:(NSRect)frameRect{
    
    self = [super initWithFrame:frameRect];
    //self = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 40, 30)];
    if (self) {
        NSArray* quality_cons_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[qu_btn(45)]" options:0 metrics:nil views:@{@"qu_btn": self}];
        
        [NSLayoutConstraint activateConstraints:quality_cons_h];

        self.wantsLayer = YES;
        //   [self.layer setBackgroundColor:[NSColor whiteColor].CGColor];//[NSColor colorWithRed:29/255.0 green:29/255.0 blue:30/255.0 alpha:1].CGColor];
        [self setTarget:self];
        self.translatesAutoresizingMaskIntoConstraints = NO;
        [self setAction:@selector(clickButtonAction:)];
        
        self.layer.borderColor = [NSColor blackColor].CGColor;
        

        
        // Create view controller
        
        viewController = [[VideoSelectionPopovers alloc] init];
        // Create popover
        entryPopover = [[NSPopover alloc] init];
        [entryPopover setContentSize:NSMakeSize(50.0, 52.0+25)];
        [entryPopover setBehavior:NSPopoverBehaviorSemitransient];
        [entryPopover setAnimates:YES];
        [entryPopover setContentViewController:viewController];
        
        // Convert point to main window coordinates
        [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(HideDuetoClick:) name: @"HideDuetoClick" object: nil];
        [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(closePopDuetoTimeout) name: @"closePopDuetoTimeout" object: nil];
        [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(updateQuality) name: @"updateQuality" object: nil];
        
        
    }
    return self;
}





-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (IBAction)clickButtonAction:(id)sender {
    NSLog(@"quality_btn clicked");
    if( [entryPopover isShown]){
        [entryPopover close];
        [Parameters setInPopwindow:false];
    }else{
    NSButton* btn=sender;
    NSRect entryRect = [sender convertRect:btn.bounds
                                    toView:[[NSApp mainWindow] contentView]];
    
    // Show popover
    [entryPopover showRelativeToRect:entryRect
                              ofView:[[NSApp mainWindow] contentView]
                       preferredEdge:NSMinYEdge];
   // [entryPopover wrro]
    }
   
}


@end
