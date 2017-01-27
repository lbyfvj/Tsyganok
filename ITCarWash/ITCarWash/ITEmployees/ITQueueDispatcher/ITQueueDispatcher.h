//
//  ITQueueDispatcher.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 19.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <ITSources/ITSources.h>
#import "ITEmployeeObserverProtocol.h"
#import "ITEmployeeStatus.h"

@interface ITQueueDispatcher : ITObservableObject <ITEmloyeeObserver>
@property (nonatomic, readonly)     NSArray     *dispatchers;
@property (nonatomic, readonly)     NSArray     *queue;

- (void)addDispatcher:(id <ITEmployeeStatus>)object;
- (void)removeDispatcher:(id <ITEmployeeStatus>)object;

@end
