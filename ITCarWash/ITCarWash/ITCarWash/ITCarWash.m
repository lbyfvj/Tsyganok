//
//  ITCarWash.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 10.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITCarWash.h"

#import <ITSources/ITSources.h>

#import "ITEmployee.h"
#import "ITWasher.h"
#import "ITAccountant.h"
#import "ITDirector.h"
#import "ITQueue.h"

static NSInteger const kITWashersCount = 4;

@interface ITCarWash ()
@property (nonatomic, retain) NSMutableArray    *staff;
@property (nonatomic, retain) ITQueue           *carsQueue;

- (void)initialSetup;
- (void)hireEmployee:(ITEmployee *)employee;
- (void)dismissEmployee:(ITEmployee *)employee;

- (NSArray *)employeesOfClass:(Class)employeeClass;

- (void)washCar:(ITCar *)car;

- (ITWasher *)findFreeWasher;

@end

@implementation ITCarWash

#pragma mark-
#pragma mark Initializatinos and Deallocations

- (void)dealloc {
    [self removeConnections];    
    self.staff = nil;
    self.carsQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.staff = [NSMutableArray array];
    self.carsQueue = [ITQueue object];
    [self initialSetup];
    
    return self;
}

- (void)initialSetup {
    ITAccountant *accountant = [ITAccountant object];
    ITDirector *director = [ITDirector object];
    NSMutableArray *staff = [NSMutableArray objectsWithCount:kITWashersCount block:^id{
        ITWasher *washer = [ITWasher object];
        [washer addObserver:accountant];
        [washer addObserver:self];
        
        return washer;
    }];
    [accountant addObserver:director];
    [staff addObject:accountant];
    [staff addObject:director];    
    for (ITEmployee* employee in staff) {
        [self hireEmployee:employee];
    }
}

- (void)removeConnections {
    for (ITWasher *washer in [self employeesOfClass:[ITWasher class]]) {
        [washer removeObserver:[self employeesOfClass:[ITAccountant class]]];
        [washer removeObserver:self];
    }
    
    for (ITAccountant *accountant in [self employeesOfClass:[ITAccountant class]]) {
        [accountant removeObserver:[self employeesOfClass:[ITDirector class]]];
    }
}

#pragma mark-
#pragma mark Accessors


#pragma mark-
#pragma mark Public

- (void)washCar:(ITCar *)car {
    [self.carsQueue enqueue:car];

    @synchronized(self.staff) {
        ITWasher *freeWasher = [self findFreeWasher];
        if (freeWasher) {
            [self giveWorkToWasher:freeWasher];
        }
    }
}

-(void)washCars:(NSArray *)cars {
    for (ITCar *car in cars) {
        [self washCar:car];
    }
}

- (NSArray *)employeesOfClass:(Class)employeeClass {
    NSMutableArray *result = [NSMutableArray array];
    NSMutableArray *staff = self.staff;
    for (id item in staff) {
        if ([item isMemberOfClass:employeeClass]) {
            [result addObject:item];
        }
    }
    
    return result;
}

#pragma mark -
#pragma mark - Private

- (void)hireEmployee:(ITEmployee *)employee {
    [self.staff addObject:employee];
}

- (void)dismissEmployee:(ITEmployee *)employee {
    [self.staff removeObject:employee];
}

- (ITWasher *)findFreeWasher {
    ITWasher *washer= nil;
    for (washer in [self employeesOfClass:[ITWasher class]]) {
        if (washer.state == ITEmployeeFree) {
            break;
        }
    }
    
    return washer;
}

- (void)giveWorkToWasher:(ITWasher *)washer {
    ITCar *activeCar = [self.carsQueue dequeue];
    if (activeCar) {
        [washer performWorkWithObject:activeCar];
    }
}

#pragma mark -
#pragma mark ITEmployeeObserver Protocol

- (void)employeeDidFinishWork:(ITEmployee *)employee {
    if ([employee isMemberOfClass:[ITWasher class]]) {
        [self giveWorkToWasher:(ITWasher *)employee];
    }
}

- (void)employeeDidBeginWork:(ITEmployee *)employee {
    
}

- (void)employeeWillBeginWork:(ITEmployee *)employee {
    
}


@end
