//
//  ITCarWash.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 10.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ITEmployee;
@class ITWasher;

@interface ITCarWash : NSObject

@property (nonatomic, retain) NSArray *staff;

- (void)initialSetup;
- (void)hireEmployee:(ITEmployee *)employee;
- (void)dismissEmployee:(ITEmployee *)employee;

- (NSArray *)employeesOfClass:(Class)employeeClass;

- (void)washCars:(NSArray *)cars;
- (ITWasher *)findFreeWasher;

@end
