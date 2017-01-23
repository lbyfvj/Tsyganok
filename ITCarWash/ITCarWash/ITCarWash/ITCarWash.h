//
//  ITCarWash.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 10.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ITEmployeeObserverProtocol.h"
#import "ITCar.h"

@class ITEmployee;
@class ITWasher;

@interface ITCarWash : NSObject <ITEmloyeeObserver>

@property (nonatomic, retain) NSArray *staff;

- (void)washCars:(NSArray *)cars;

- (NSArray *)employeesOfClass:(Class)employeeClass;

@end
