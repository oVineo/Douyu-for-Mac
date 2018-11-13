//
//  AnchorListCell.m
//  Douyu
//
//  Created by Vine on 2018/11/5.
//  Copyright © 2018 Lanskaya. All rights reserved.
//

#import "AnchorMenuItem.h"

@interface AnchorMenuItem ()



@end

@implementation AnchorMenuItem

DYRoomInfo *roomInfo;
NSColor *normalColor;
NSColor *altColor;


-(instancetype)init{

    self = [super init];

    if(self){
        normalColor = [NSColor colorWithCalibratedRed:0.99 green:0.99 blue:0.99 alpha:1];
        
        altColor = [NSColor colorWithCalibratedRed:0.94 green:0.94 blue:0.94 alpha:1];
        _currentColor = normalColor;
        
        self.theView =[[NSView alloc] initWithFrame:NSMakeRect(0, 0, 356, 82)];
        
        // Do view setup here.
        self.roomImage =[[NSImageView alloc] initWithFrame:NSMakeRect(9, 4, 110, 74)];

        [self.roomImage setImageScaling:NSImageScaleProportionallyDown];
         [self.roomImage setImage:[NSImage imageNamed:@"defaultimg"]];
        [self.theView addSubview:self.roomImage];
        
        self.onlineStatus =[[NSImageView alloc] initWithFrame:NSMakeRect(127, 17, 27, 17)];
        [self.onlineStatus setImage:[NSImage imageNamed:@"offline"]];

        [self.theView addSubview:self.onlineStatus];
        
        self.roomName = [[NSTextField alloc] initWithFrame:NSMakeRect(127, 40, 231, 23)];
        [self.roomName setEditable:NO];
        [self.roomName setBezeled:NO];
        [self.roomName setBordered:NO];
        [self.roomName setDrawsBackground:NO];
        
        [self.theView addSubview:self.roomName];
        self.anchorName = [[NSTextField alloc] initWithFrame:NSMakeRect(155, 13, 200, 23)];
        [self.anchorName setEditable:NO];
        [self.anchorName setBezeled:NO];
        [self.anchorName setBordered:NO];
        [self.anchorName setDrawsBackground:NO];
        [self.theView addSubview:self.anchorName];
      
        self.view=self.theView;
        [self.view setWantsLayer:YES];
        
        self.view.layer.backgroundColor = _currentColor.CGColor;
        NSTrackingArea *area =[[NSTrackingArea alloc] initWithRect:self.view.bounds options:NSTrackingMouseEnteredAndExited|NSTrackingActiveInKeyWindow|NSMouseMoved owner:self userInfo:nil];
        [self.view addTrackingArea:area];
    }
    return self;
}

-(void)mouseDown:(NSEvent *)event {
    
    NSLog(@"playbtn click");
}

- (void)mouseExited:(NSEvent *)event {
   // NSLog(@"playbtn exit");
    self.view.layer.backgroundColor = _currentColor.CGColor;
}

- (void)mouseEntered:(NSEvent *)event {
 //   NSLog(@"playbtn entered");
    self.view.layer.backgroundColor = [NSColor colorWithCalibratedRed:243/255.0 green:224/255.0 blue:212/255.0 alpha:1].CGColor;
}

-(void)mouseMoved:(NSEvent *)event {
    
    self.view.layer.backgroundColor = [NSColor colorWithCalibratedRed:243/255.0 green:224/255.0 blue:212/255.0 alpha:1].CGColor;
}


-(void) setInfo:(DYRoomInfo*) representedObject{


        if(representedObject.number%2==1)
            _currentColor=normalColor;
        else
            _currentColor=altColor;
        self.view.layer.backgroundColor = _currentColor.CGColor;
        bool online=representedObject.showStatus;
    
        NSString* imgstr = representedObject.img;
        NSURL* imgurl=[[NSURL alloc] initWithString:imgstr];
        NSImage* img = [[NSImage alloc] initWithContentsOfURL:imgurl];
        if(img)
            [self.roomImage setImage:img];
        else
             [self.roomImage setImage:[NSImage imageNamed:@"defaultimg"]];
        if(online){
         //   NSLog(@"%@ : %@",self.cellIndex,[representedObject valueForKey:@"showStatus"]);

            
            [self.onlineStatus setImage:[NSImage imageNamed:@"online"]];
        
        }else{
         
            [self.onlineStatus setImage:[NSImage imageNamed:@"offline"]];
        }
        self.roomName.stringValue =((DYRoomInfo*) representedObject).roomName;
        NSString* str = ((DYRoomInfo*) representedObject).nickName;
        str = [str stringByAppendingString:@" - "];
        str = [str stringByAppendingString:((DYRoomInfo*) representedObject).gameName];
        self.anchorName.stringValue = str;
        
        roomInfo = representedObject;

}

@end
