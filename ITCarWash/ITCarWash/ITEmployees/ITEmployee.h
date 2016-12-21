//
//  ITEmployee.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ITSources/ITObservableObject.h>

#import "ITMoneyKeeperProtocol.h"
#import "ITEmployeeObserverProtocol.h"

@class ITEmployee;

typedef NS_ENUM(NSUInteger, ITEmployeeState) {
    ITEmployeeDidFinishWork,
    ITEmployeeDidBeginWork,
    ITEmployeeDidPerformWorkWithObject
};

@interface ITEmployee : ITObservableObject <ITMoneyKeeperProtocol>

- (instancetype)initWithMoney:(NSUInteger)money;

- (void)performWorkWithObject:(id<ITMoneyKeeperProtocol>)object;

@end
