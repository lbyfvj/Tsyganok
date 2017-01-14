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
#import "ITCar.h"

@interface ITCarWash ()
@property (nonatomic, retain) NSMutableArray *mutableStaff;

@end

@implementation ITCarWash

@dynamic staff;

#pragma mark-
#pragma mark Initializatinos and Deallocations

- (void)dealloc {
    self.mutableStaff = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableStaff = [NSMutableArray array];
    
    return self;
}

#pragma mark-
#pragma mark Accessors

- (NSArray *)staff {
    return [[[self  mutableStaff] copy] autorelease];
}

#pragma mark-
#pragma mark Public

- (void)hireEmployee:(ITEmployee *)employee {
    [self.mutableStaff addObject:employee];
}

- (void)dismissEmployee:(ITEmployee *)employee {
    [self.mutableStaff removeObject:employee];
}

-(NSArray *)employeesOfClass:(Class)employeeClass {
    NSMutableArray *result = [NSMutableArray array];
    for (id item in self.mutableStaff) {
        if ([item isMemberOfClass:employeeClass]) {
            [result addObject:item];
        }
    }
    return result;
}

- (void)initialSetup {
    ITWasher *washer =[ITWasher object];
    ITAccountant *accountant = [ITAccountant object];
    ITDirector *director = [ITDirector object];
    
    NSArray *staff = @[washer, accountant, director];
    for (ITEmployee* emlpoyee in staff) {
        [self hireEmployee:emlpoyee];
    }

    [washer addObserver:accountant];
    [accountant addObserver:director];
}

-(void)washCars:(NSArray *)cars {
    for (ITCar *car in cars) {
        
        ITWasher *washer = [self findFreeWasher];
        if (washer) {
            [washer proccessObject:car];
        }
    }
}

-(ITWasher *)findFreeWasher {
    ITWasher *washer= nil;
    for (washer in [self employeesOfClass:[ITWasher class]]) {
        if (ITEmployeeDidFinishedWork == washer.state) {
            
            break;
        }
    }
    
    return washer;
}

@end
