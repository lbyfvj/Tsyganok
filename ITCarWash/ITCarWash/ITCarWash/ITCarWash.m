//
//  ITCarWash.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <ITSources/ITSources.h>

#import "ITCarWash.h"
#import "ITWasher.h"
#import "ITAccountant.h"
#import "ITDirector.h"

static const NSUInteger kITWashersCount = 5;
static const NSUInteger kITAccountantsCount = 1;
static const NSUInteger kITDirectorsCount = 1;

@interface ITCarWash ()
@property (nonatomic, retain)   ITWasher   *washer;
@property (nonatomic, retain)   ITAccountant   *accountant;
@property (nonatomic, retain)   ITDirector   *director;

- (void)hireWashers;
- (void)hireAccountant;
- (void)hireDirector;
- (void)hireEmployeesWithClass:(Class)class count:(NSUInteger)count;

@end

@implementation ITCarWash

#pragma mark -
#pragma mark - Initialization and Deallocation

- (void)dealloc {
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    [self hireEmployees];
    
    return self;
}

#pragma mark -
#pragma mark - Public

- (void)hireEmployees {
    [self hireWashers];
    [self hireAccountant];
    [self hireDirector];
}

- (void)washCar:(ITCar *)car {
    [self.washer proccessObject:car];
}

#pragma mark -
#pragma mark - Private

- (void)hireWashers:(NSUInteger)count {
    for (NSUInteger i =0; i < count; i++) {
        self.washer = [ITWasher object];
    }
}

- (void)hireAccountant:(NSUInteger)count {
    [self hireEmployeesWithClass: [ITAccountant class] count:kITAccountantsCount];
}

- (void)hireDirector:(NSUInteger)count {
    [self hireEmployeesWithClass: [ITDirector class] count:kITDirectorsCount];
}

- (void)hireEmployeesWithClass:(Class)class count:(NSUInteger)count {
    for (NSUInteger i = 0; i < count; i++) {
        if (class == [ITWasher class]) {
            self.washer = [ITWasher object];
            [self.washer addObserver:self];
        } else if (class == [ITAccountant class]) {
            self.accountant = [ITAccountant object];
            [self.accountant addObserver:self];
        } else if (class == [ITDirector class]) {
            self.director = [ITDirector object];
        }
    }
}

@end
