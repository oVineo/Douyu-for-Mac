//
//  Parameters.h
//  Douyu
//
//  Created by Vine on 2018/10/30.
//  Copyright © 2018 Lanskaya. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Parameters : NSObject



+(void) setInPopwindow:(BOOL) _in;
+(BOOL) getInPopwindow;


+(NSInteger) _LowQuality;

+(NSInteger) _MediumQuality;
+(NSInteger)  _HighQuality;
@end

NS_ASSUME_NONNULL_END
