//
//  AnchorPopoverController.m
//  Douyu
//
//  Created by Vine on 2018/11/4.
//  Copyright © 2018 Lanskaya. All rights reserved.
//

#import "AnchorMenu.h"

@interface AnchorMenu ()

@property (strong) NSCollectionView *anchorList;
@property (strong) NSMutableArray* messageData;
@property (strong) NSScrollView *scroller;
@property (nonatomic, assign) BOOL alternateColors;
@property (strong) NSArray *savedAlternateColors;
@end

@implementation AnchorMenu

-(instancetype)initWithTitle:(NSString *)title {
    self = [super initWithTitle:title];

    
    // Do view setup here.
  //
    if(self){
        self.messageData=[[NSMutableArray alloc] init];
        NSInteger count=0;
        NSArray<DYRoomHistoryData *> *todo = [DYRoomHistoryModel getAll];
        for(DYRoomHistoryData * item in todo){
            NSString *roomId = [DYRoomInfo getRoomIdWithString:item.roomId];
            if (!roomId.length) {
                continue;
            }
            DYRoomInfo *roomInfo = [[DYRoomInfo alloc] init];
            if (![roomInfo getInfoWithRoomId:item.roomId cdnsid:0]) {
                continue;
            }
            roomInfo.number=count;

           // if (!roomInfo.showStatus) {
           //     continue;
            
           // }
            [_messageData addObject:roomInfo];
            
            AnchorMenuItem* menuItem= [[AnchorMenuItem alloc] init];
            [menuItem setInfo:roomInfo];
            [self insertItem:menuItem atIndex:count];
            count++;
        }
        
   
    }
    return self;
}



@end
