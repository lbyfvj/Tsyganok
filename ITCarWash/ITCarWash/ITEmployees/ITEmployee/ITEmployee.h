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

static const uint8_t kITEmployeeMaxSleepTime = 3;

typedef NS_ENUM (NSUInteger, ITEmployeeState) {
    ITEmployeeDidBecomeFree,
    ITEmployeeDidBecomeBusy,
    ITEmployeeDidBecomePending
};

@interface ITEmployee : ITObservableObject <ITMoneyKeeper, ITEmloyeeObserver>
@property (nonatomic, copy)     NSString      *name;

- (void)proccessObject:(id)object;

- (void)performWorkWithObject:(id)object;

- (void)finishProcessingingObject:(ITEmployee *)object;

- (void)finishProcessing;

- (void)print:(NSString *)message withObject:(id)object;

@end
