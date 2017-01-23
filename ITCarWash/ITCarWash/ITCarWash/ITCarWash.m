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
@property (nonatomic, retain) NSMutableArray    *mutableStaff;
@property (nonatomic, retain) ITQueue           *carsQueue;

- (void)initialSetup;
- (void)hireEmployee:(ITEmployee *)employee;
- (void)dismissEmployee:(ITEmployee *)employee;

- (void)proccessCar:(ITCar *)car;

- (ITWasher *)findFreeWasher;

@end

@implementation ITCarWash

@dynamic staff;

#pragma mark-
#pragma mark Initializatinos and Deallocations

- (void)dealloc {
    [self.mutableStaff removeAllObjects];
    
    self.mutableStaff = nil;
    self.carsQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableStaff = [NSMutableArray array];
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

#pragma mark-
#pragma mark Accessors

- (NSArray *)staff {
    return [[[self  mutableStaff] copy] autorelease];
}

#pragma mark-
#pragma mark Public

- (void)proccessCar:(ITCar *)car {
    @synchronized(car) {
        [self.carsQueue addObjectToQueue:car];
    }
    
    @synchronized(self.mutableStaff) {
        ITWasher *freeWasher = [self findFreeWasher];
        if (freeWasher) {
            [self giveWorkToWasher:freeWasher];
        }
    }
}

-(void)washCars:(NSArray *)cars {
    for (ITCar *car in cars) {
        [self proccessCar:car];
    }
}

- (NSArray *)employeesOfClass:(Class)employeeClass {
    NSMutableArray *result = [NSMutableArray array];
    for (id item in self.mutableStaff) {
        if ([item isMemberOfClass:employeeClass]) {
            [result addObject:item];
        }
    }
    return result;
}

#pragma mark -
#pragma mark - Private

- (void)hireEmployee:(ITEmployee *)employee {
    [self.mutableStaff addObject:employee];
}

- (void)dismissEmployee:(ITEmployee *)employee {
    [self.mutableStaff removeObject:employee];
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
    ITCar *activeCar = [self.carsQueue removeFromQueue];
    if (activeCar) {
        [washer performSelectorInBackground:@selector(performWorkWithObject:) withObject:activeCar];
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
