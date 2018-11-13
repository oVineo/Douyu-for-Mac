//
//  VolButton.h
//  Douyu
//
//  Created by Vine on 2018/10/31.
//  Copyright © 2018 Lanskaya. All rights reserved.
//

#import "VolSlider.h"


@implementation VolSlider


- (void)setNeedsDisplayInRect:(NSRect)invalidRect {
    [super setNeedsDisplayInRect:[self bounds]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if(![self.cell isKindOfClass:[VolumeSliderCell class]]) {
        self.cell = [[VolumeSliderCell alloc] init];
    }
}


- (instancetype)initWithFrame:(NSRect)frameRect{
    self = [super initWithFrame:frameRect];
    if (self){
        self.cell = [[VolumeSliderCell alloc] initWithKnobImage:[NSImage imageNamed:@"volume_point"]];
        NSArray* cons_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[vol_sli(70)]" options:0 metrics:nil views:@{@"vol_sli": self}];
        [NSLayoutConstraint activateConstraints:cons_h];
        
        [self setTarget:self];
        [self setAction:@selector(valueChanged:)];
        self.trackFillColor= NSColor.clearColor;
    }
    return self;
}
-(void)valueChanged:(NSSlider *)sender{
    CGFloat value = ([self doubleValue]  - [self minValue]) / ([self maxValue] - [self minValue]);
   [[NSUserDefaults standardUserDefaults] setDouble:value forKey:@"volume"];
   [[NSNotificationCenter defaultCenter] postNotificationName:@"updateVolume" object:nil];
}
- (VolumeSliderCell *)sliderCell {
    return self.cell;
}

- (NSImage *)knobImage {
    return self.sliderCell.knobImage;
}

- (void)setKnobImage:(NSImage *)image {
    self.sliderCell.knobImage = image;
}
-(void) setVolume:(CGFloat) vol {
   // CGFloat value = ([self doubleValue]  - [self minValue]) / ([self maxValue] - [self minValue]);
    [self setDoubleValue:vol];
}

@end
