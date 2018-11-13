//
//  VolumeSliderCell.m
//  Douyu
//
//  Created by Vine on 2018/10/31.
//  Copyright © 2018 Lanskaya. All rights reserved.
//

#import "VolumeSliderCell.h"

@interface VolumeSliderCell ()

@property (nonatomic) NSRect currentKnobRect;

@end

@implementation VolumeSliderCell

- (id)initWithKnobImage:(NSImage *)knob {
    self = [self init];
    if (self) {
        _knobImage = knob;
        return !knob ? nil : self;
    }
    
    return self;
}

/*
- (BOOL)startTrackingAt:(NSPoint)startPoint inView:(NSView *)controlView {
    BOOL val = [super startTrackingAt:startPoint inView:controlView];
    [self drawInteriorWithFrame:controlView.bounds inView:controlView];
    return val;
}
*/
- (void)drawKnob:(NSRect)knobRect {
    if (!_knobImage) {
        [super drawKnob:knobRect];
        return;
    }
    
    CGFloat dx = (knobRect.size.width - _knobImage.size.width) / 2.0;
    CGFloat dy = (knobRect.size.height - _knobImage.size.height) / 2.0;

    
    _currentKnobRect = CGRectInset(knobRect, dx, dy);
    
    [_knobImage drawInRect:_currentKnobRect];
}

- (void)drawBarInside:(NSRect)rect flipped:(BOOL)flipped {
    
    //  [super drawBarInside:rect flipped:flipped];
    
    rect.size.height = 5.0;
    
    // Bar radius
    CGFloat barRadius = 2.5;
    
    // Knob position depending on control min/max value and current control value.
    CGFloat value = ([self doubleValue]  - [self minValue]) / ([self maxValue] - [self minValue]);
    
    // Final Left Part Width
    CGFloat finalWidth = value * ([[self controlView] frame].size.width - 8);
    
    // Left Part Rect
    NSRect leftRect = rect;
    leftRect.size.width = finalWidth;
   // NSLog(@"- Current Rect:%@ \n- Value:%f \n- Final Width:%f", NSStringFromRect(rect), value, finalWidth);
    
    // Draw Left Part
    NSBezierPath* bg = [NSBezierPath bezierPathWithRoundedRect: rect xRadius: barRadius yRadius: barRadius];
    //22 25 28
    [[NSColor colorWithRed:22/255.0 green:25/255.0 blue:28/255.0 alpha:1] setFill];
    
    
    [bg fill];
    
    // Draw Right Part
    NSBezierPath* active = [NSBezierPath bezierPathWithRoundedRect: leftRect xRadius: barRadius yRadius: barRadius];
    [NSColor.orangeColor setFill];
    [active fill];
    
    
}

@end
