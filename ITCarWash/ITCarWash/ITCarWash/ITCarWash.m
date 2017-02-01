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
#import "ITEmployeeDispatcher.h"

static NSInteger const kITWashersCount = 4;
static NSInteger const kITAccountantsCount = 2;
static NSInteger const kITDirectorsCount = 1;
typedef void (^ITRemoveCarWashConnections)(NSArray *observableObjects, NSArray *observers);

@interface ITCarWash ()
//@property (nonatomic, retain) NSMutableArray        *staff;
@property (nonatomic, retain) ITQueue               *carsQueue;

@property (nonatomic, retain) ITEmployeeDispatcher  *washersDispatcher;
@property (nonatomic, retain) ITEmployeeDispatcher  *accountantsDispatcher;
@property (nonatomic, retain) ITEmployeeDispatcher  *directorsDispatcher;

- (void)initialSetup;
//- (void)hireEmployee:(ITEmployee *)employee;
//- (void)dismissEmployee:(ITEmployee *)employee;

//- (NSArray *)employeesOfClass:(Class)employeeClass;

- (void)washCar:(ITCar *)car;

//- (ITWasher *)findFreeWasher;

@end

@implementation ITCarWash

#pragma mark-
#pragma mark Initializatinos and Deallocations

- (void)dealloc {
    [self removeConnections];    
    //self.staff = nil;
    self.carsQueue = nil;
    
    self.washersDispatcher = nil;
    self.accountantsDispatcher = nil;
    self.directorsDispatcher = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    //self.staff = [NSMutableArray array];
    self.carsQueue = [ITQueue object];
    [self initialSetup];
    
    return self;
}

- (void)initialSetup {

//    id (^carWashStaff)(Class class, NSUInteger count, id<ITEmloyeeObserver>observer) = ^id(Class class, NSUInteger count, id<ITEmloyeeObserver>observer) {
//        return [NSArray objectsWithCount:count block:^id{
//            ITEmployee *employee = [class object];
//            [employee addObserver:observer];
//            [employee addObserver:self];
//            
//            return employee;
//        }];
//    };
//
//    ITDirector *director = [ITDirector object];
//    NSArray *accountant = carWashStaff([ITAccountant class], kITAccountantsCount, director);
//    NSMutableArray *staff = carWashStaff([ITWasher class], kITWashersCount, [accountant firstObject]);
//    [staff arrayByAddingObjectsFromArray:@[accountant, director]];
//    
//    for (ITEmployee* employee in staff) {
//        [self hireEmployee:employee];
//    }
    
    id (^carWashStaff)(Class class, NSUInteger count, id<ITEmloyeeObserver>observer) = ^id(Class class, NSUInteger count, id<ITEmloyeeObserver>observer) {
        return [[NSArray objectsWithCount:count block:^id{
            ITEmployee *employee = [class object];
            [employee addObserver:observer];
            [employee addObserver:self];
            
            return employee;
        }] autorelease];
    };
    
    self.washersDispatcher = [ITEmployeeDispatcher object];
    self.accountantsDispatcher = [ITEmployeeDispatcher object];
    self.directorsDispatcher = [ITEmployeeDispatcher object];
    
    NSArray *directors = carWashStaff([ITDirector class], kITDirectorsCount, self);
    for (id director in directors) {
        [self.directorsDispatcher addHandler:director];
    }
    
    NSArray *accountants = carWashStaff([ITAccountant class], kITAccountantsCount, self.directorsDispatcher);
    for (id accountant in accountants) {
        [self.accountantsDispatcher addHandler:accountant];
    }
    
    NSArray *washers = carWashStaff([ITWasher class], kITWashersCount, self.accountantsDispatcher);
    for (id washer in washers) {
        [self.washersDispatcher addHandler:washer];
    }
}

- (void)removeConnections {
//    NSArray *accountants = [self employeesOfClass:[ITAccountant class]];
//    NSArray *directors = [self employeesOfClass:[ITDirector class]];
//    NSArray *washers = [self employeesOfClass:[ITWasher class]];
//    
//    ITRemoveCarWashConnections removeCarWashConnections = ^void(NSArray *observableObjects, NSArray *observers) {
//        for (id object in observableObjects) {
//            [object removeObservers:observers];
//        }
//    };
//    
//    removeCarWashConnections(washers, accountants);
//    removeCarWashConnections(washers, @[self]);
//    removeCarWashConnections(accountants, directors);
}

#pragma mark-
#pragma mark Accessors


#pragma mark-
#pragma mark Public

- (void)washCar:(ITCar *)car {
    [self.washersDispatcher performWorkWithObject:car];
}

-(void)washCars:(NSArray *)cars {
    for (ITCar *car in cars) {
        [self washCar:car];
    }
}

//- (NSArray *)employeesOfClass:(Class)employeeClass {
//    NSMutableArray *result = [NSMutableArray array];
//    NSMutableArray *staff = self.staff;
//    for (id item in staff) {
//        if ([item isMemberOfClass:employeeClass]) {
//            [result addObject:item];
//        }
//    }
//    
//    return result;
//}

#pragma mark -
#pragma mark - Private

//- (void)hireEmployee:(ITEmployee *)employee {
//    [self.staff addObject:employee];
//}
//
//- (void)dismissEmployee:(ITEmployee *)employee {
//    [self.staff removeObject:employee];
//}
//
//- (ITWasher *)findFreeWasher {
//    ITWasher *washer= nil;
//    for (washer in [self employeesOfClass:[ITWasher class]]) {
//        if (washer.state == ITEmployeeDidBecomeFree) {
//            break;
//        }
//    }
//    
//    return washer;
//}
//
//- (void)giveWorkToWasher:(ITWasher *)washer {
//    @synchronized (washer) {
//        ITCar *activeCar = [self.carsQueue dequeueObject];
//        if (activeCar) {
//            [washer performWorkWithObject:activeCar];
//        }
//    }
//}

@end
