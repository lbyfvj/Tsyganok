//
//  ITEmployee.h
//  HWL1T1
//
//  Created by Ivan Tsyganok on 15.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITObservableObject.h"
#import "ITMoneyChainProtocol.h"
#import "ITEmloyeeObserverProtocol.h"

@class ITEmployee;

typedef NS_ENUM(NSUInteger, ITEmployeeState) {
    ITEmployeeDidFinishWork,
    ITEmployeeDidBeginWork,
    ITEmployeeDidPerformWorkWithObject
};

@interface ITEmployee : ITObservableObject <ITMoneyChainProtocol>

- (instancetype)initWithMoney:(NSDecimalNumber *)money;

- (void)performWorkWithObject:(id)object;

@end
