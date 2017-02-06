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
typedef void (^ITRemoveCarWashConnections)(NSArray *observableObjects, NSArray *observers);

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
    [staff addObjectsFromArray:@[accountant, director]];
    for (ITEmployee* employee in staff) {
        [self hireEmployee:employee];
    }
}

- (void)removeConnections {
    ITRemoveCarWashConnections removeCarWashConnections = ^void(NSArray *observableObjects, NSArray *observers) {
        for (id object in observableObjects) {
            [object removeObservers:observers];
        }
    };
    
    removeCarWashConnections([self employeesOfClass:[ITWasher class]], [[self employeesOfClass:[ITAccountant class]] arrayByAddingObject:self]);
    removeCarWashConnections([self employeesOfClass:[ITAccountant class]], [self employeesOfClass:[ITDirector class]]);
}

#pragma mark-
#pragma mark Accessors


#pragma mark-
#pragma mark Public

- (void)washCar:(ITCar *)car {
    [self.carsQueue enqueueObject:car];

    @synchronized(self.staff) {
        ITWasher *freeWasher = [self reserveWasher];
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
    NSMutableArray *staff = self.staff;
    @synchronized (staff) {
        NSMutableArray *result = [NSMutableArray array];
        for (id item in staff) {
            if ([item isMemberOfClass:employeeClass]) {
                [result addObject:item];
            }
        }
        
        return result;
    }
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
        if (washer.state == ITEmployeeDidBecomeFree) {
            break;
        }
    }
    
    return washer;
}

- (ITWasher *)reserveWasher {
    @synchronized (self.staff) {
        ITWasher *washer = [self findFreeWasher];
        washer.state = ITEmployeeDidBecomeBusy;
        
        return washer;
    }
}

- (void)giveWorkToWasher:(ITWasher *)washer {
    @synchronized (washer) {
        ITCar *activeCar = [self.carsQueue dequeueObject];
        if (activeCar) {
            [washer performSelectorInBackground:@selector(performWorkInBackgroundWithObject:)
                                        withObject:activeCar];
        }
    }
}

#pragma mark -
#pragma mark ITEmployeeObserver Protocol

- (void)employeeDidBecomeFree:(ITEmployee *)employee {
    if ([employee isMemberOfClass:[ITWasher class]]) {
        [self giveWorkToWasher:(ITWasher *)employee];
    }
}

- (void)employeeDidBecomeBusy:(ITEmployee *)employee {
    
}

- (void)employeeDidBecomePending:(ITEmployee *)employee {
    
}


@end
