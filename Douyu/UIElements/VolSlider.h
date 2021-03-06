//
//  VolButton.h
//  Douyu
//
//  Created by Vine on 2018/10/31.
//  Copyright © 2018 Lanskaya. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "VolumeSliderCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface VolSlider : NSSlider
@property (nonatomic) IBInspectable NSImage *knobImage;

-(void) setVolume:(CGFloat) vol;


@end

NS_ASSUME_NONNULL_END
