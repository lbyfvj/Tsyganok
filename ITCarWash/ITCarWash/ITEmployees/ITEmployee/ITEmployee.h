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

static const uint8_t kITEmployeeMaxSleepTime = 2;

typedef NS_ENUM (NSUInteger, ITEmployeeState) {
    ITEmployeeDidBecomeFree,
    ITEmployeeDidBecomeBusy,
    ITEmployeeDidBecomePending
};

@interface ITEmployee : ITObservableObject <ITMoneyKeeper, ITEmloyeeObserver>
@property (nonatomic, copy)     NSString      *name;

- (void)processObject:(id)object; // Don't call it directly. Method for overloading in subclasses only.

- (void)performWorkWithObject:(id)object;

- (void)performWorkInBackgroundWithObject:(id)employee;

- (void)finishProcessingObject:(id)object;

- (void)finishProcessing;

@end
