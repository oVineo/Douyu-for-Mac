//
//  InnerButton.h
//  Douyu
//
//  Created by Vine on 2018/10/25.
//  Copyright © 2018 Lanskaya. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "Parameters.h"

NS_ASSUME_NONNULL_BEGIN

@interface InnerButton : NSButton

- (void) setQuality:(NSInteger) i;

@property NSInteger quality_value;

@end

NS_ASSUME_NONNULL_END
