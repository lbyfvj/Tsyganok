//
//  ITEmployee.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 10.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <ITSources/ITSources.h>

#import "ITMoneyKeeperProtocol.h"

static const uint8_t kITEmployeeMaxSleepTime = 1;

typedef NS_ENUM (NSUInteger, ITEmployeeState) {
    ITEmployeeDidFinishedWork,
    ITEmployeeDidStartedWork
};

@interface ITEmployee : ITObservableObject <ITMoneyKeeperProtocol>
@property (nonatomic, assign)   ITEmployeeState          state;

- (void)proccessObject:(id)object;
- (void)giveAllMoneyToObject:(id<ITMoneyKeeperProtocol>)object;
- (void)takeAllMoneyFromObject:(id<ITMoneyKeeperProtocol>)object;

@end
