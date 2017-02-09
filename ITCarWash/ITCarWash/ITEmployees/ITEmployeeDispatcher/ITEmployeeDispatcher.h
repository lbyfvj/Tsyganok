//
//  ITEmployeeDispatcher.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 31.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ITEmployeeObserverProtocol.h"
#import "ITMoneyKeeperProtocol.h"

@interface ITEmployeeDispatcher : NSObject <ITEmloyeeObserver>
@property (nonatomic, readonly)     NSArray     *handlers;

- (void)addHandler:(id)object;
- (void)removeHandler:(id)object;

- (void)performWorkWithObject:(id)employee;

@end
