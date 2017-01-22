//
//  ITEmployee.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 10.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <ITSources/ITSources.h>

#import "ITMoneyKeeperProtocol.h"
#import "ITEmployeeObserverProtocol.h"

static const uint8_t kITEmployeeMaxSleepTime = 1;

typedef NS_ENUM (NSUInteger, ITEmployeeState) {
    ITEmployeeDidFinishWork,
    ITEmployeeDidStartWork,
    ITEmployeeWaitingForWork
};

@interface ITEmployee : ITObservableObject <ITMoneyKeeper, ITEmloyeeObserver>
@property (nonatomic, assign)   ITEmployeeState          state;

- (void)proccessObject:(id)object;

@end
