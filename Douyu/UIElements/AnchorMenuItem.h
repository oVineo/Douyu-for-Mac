//
//  AnchorListCell.h
//  Douyu
//
//  Created by Vine on 2018/11/5.
//  Copyright © 2018 Lanskaya. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DYRoomInfo.h"
NS_ASSUME_NONNULL_BEGIN

@interface AnchorMenuItem : NSMenuItem


@property (strong) NSImageView *roomImage;
@property (strong) NSTextField *roomName;
@property (strong) NSTextField *anchorName;
@property (strong) NSImageView *onlineStatus;
@property (strong) NSView* theView;
@property NSColor *currentColor;
-(void) setInfo:(DYRoomInfo*) representedObject;
@end

NS_ASSUME_NONNULL_END
