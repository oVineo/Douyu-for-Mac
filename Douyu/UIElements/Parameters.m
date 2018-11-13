//
//  Parameters.m
//  Douyu
//
//  Created by Vine on 2018/10/30.
//  Copyright © 2018 Lanskaya. All rights reserved.
//

#import "Parameters.h"

@implementation Parameters

static bool PopWindowShowed = NO;

static const NSInteger LowQuality = 2;
static const NSInteger MediumQuality = 1;
static const NSInteger HighQuality = 0;


+(void) setInPopwindow:(BOOL) _in {
    PopWindowShowed=_in;
}
+(BOOL) getInPopwindow{
    return PopWindowShowed;
}

+(NSInteger) _LowQuality{
    return LowQuality;
}

+(NSInteger) _MediumQuality{
    return MediumQuality;
}
+(NSInteger)  _HighQuality{
    return HighQuality;
}
@end
