//
//  InnerButton.m
//  Douyu
//
//  Created by Vine on 2018/10/25.
//  Copyright © 2018 Lanskaya. All rights reserved.
//

#import "InnerButton.h"
#import "Parameters.h"

@implementation InnerButton

__weak NSString* Name = @"";


- (void)drawRect:(NSRect)dirtyRect {
    
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
    [[NSColor colorWithRed:29/255.0 green:29/255.0 blue:30/255.0 alpha:1] set];
    NSRectFill(self.bounds);
    
    if ([self title] != nil) {
        NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
        [paraStyle setParagraphStyle:[NSParagraphStyle defaultParagraphStyle]];
        [paraStyle setAlignment:NSTextAlignmentCenter];
        
        NSDictionary *attrButton = [NSDictionary dictionaryWithObjectsAndKeys:[NSFont fontWithName:@"Verdana" size:12], NSFontAttributeName, [NSColor colorWithCalibratedRed:1 green:1 blue:1 alpha:1], NSForegroundColorAttributeName, paraStyle, NSParagraphStyleAttributeName, nil];
        
        NSAttributedString * btnString = [[NSAttributedString alloc] initWithString:[self title] attributes:attrButton];
        
        [btnString drawInRect:NSMakeRect(0, 1, self.frame.size.width, self.frame.size.height)];
    }
}


- (void) setQuality:(NSInteger) i{
    if (i==[Parameters _HighQuality]){
        Name=@"超清";
    }
    else{
        if (i==[Parameters _MediumQuality]){
            Name=@"高清";
        }
        else{
            if (i==[Parameters _LowQuality]){
                Name=@"标清";
            }else{
                NSLog(@"不支持的视频清晰度");
                Name=@"超清";
            }
        }
    }
    [self setTitle:Name];
    _quality_value=i;
   // [self setTextColor:[NSColor blueColor]];
}

- (void)setTextColor:(NSColor *)textColor
{
    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc]
                                            initWithAttributedString:[self attributedTitle]];
    NSUInteger len = [attrTitle length];
    NSRange range = NSMakeRange(0, len);
    [attrTitle addAttribute:NSForegroundColorAttributeName
                      value:textColor
                      range:range];
    [attrTitle fixAttributesInRange:range];
    [self setAttributedTitle:attrTitle];
    //  [attrTitle release];
}



- (instancetype) initWithFrame:(NSRect)frameRect{
    self = [super initWithFrame:frameRect];
    
    if (self) {
        self.bordered=NO;
        //  NSArray* inner_cons_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[inner_btn(40)]" options:0 metrics:nil views:@{@"inner_btn": self}];
        NSArray* inner_cons_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[inner_btn(25)]" options:0 metrics:nil views:@{@"inner_btn": self}];
        //   [NSLayoutConstraint activateConstraints:inner_cons_h];
        [NSLayoutConstraint activateConstraints:inner_cons_v];
        [self setButtonType:NSButtonTypeToggle];
        [self setBezelStyle:NSDisclosureBezelStyle];
        
        [self setTarget:self];
        self.translatesAutoresizingMaskIntoConstraints=NO;
        [self setAction:@selector(clickButtonAction:)];
        
        NSTrackingArea *area_V =[[NSTrackingArea alloc] initWithRect:self.bounds options:NSTrackingActiveInKeyWindow|NSTrackingMouseMoved|NSTrackingActiveWhenFirstResponder owner:self userInfo:nil];
        
        [self addTrackingArea:area_V];
        [(NSButtonCell *)self.cell setHighlightsBy:NSNoCellMask];
        //  [self setTextColor:[NSColor blueColor]];
    }
    
    //play_status = NO;
    return self;
}

- (IBAction)clickButtonAction:(id)sender {

    [[NSUserDefaults standardUserDefaults] setInteger:_quality_value forKey:@"videoQuality"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"toggleQualityChange" object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HideDuetoClick" object:nil userInfo:nil];
    [Parameters setInPopwindow:NO];
}

- (void)mouseMoved:(NSEvent *)event {
    
    [Parameters setInPopwindow:YES];
    
}

- (void)mouseEntered:(NSEvent *)event {
    [Parameters setInPopwindow:YES];
}
@end


