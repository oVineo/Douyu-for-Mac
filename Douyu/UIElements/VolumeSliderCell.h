//
//  VolumeSliderCell.h
//  Douyu
//
//  Created by Vine on 2018/10/31.
//  Copyright © 2018 Lanskaya. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface VolumeSliderCell : NSSliderCell

@property (nonatomic) NSImage *knobImage;

- (id)initWithKnobImage:(NSImage *)knob;


@end

NS_ASSUME_NONNULL_END
