//
//  ITCarWashAdministrator.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 01.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITCarWashAdministrator : NSObject
@property (nonatomic, readonly, getter=isRunning)   BOOL    running;

- (void)startTimer;
- (void)stopTimer;

@end
