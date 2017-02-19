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
@property (nonatomic, retain) ITEmployeeDispatcher  *washersDispatcher;
@property (nonatomic, retain) ITEmployeeDispatcher  *accountantsDispatcher;
@property (nonatomic, retain) ITEmployeeDispatcher  *directorsDispatcher;

- (void)initialSetup;
- (void)washCar:(ITCar *)car;

@end

@implementation ITCarWash

#pragma mark-
#pragma mark Initializatinos and Deallocations

- (void)dealloc {
    [self removeConnections];
    
    self.washersDispatcher = nil;
    self.accountantsDispatcher = nil;
    self.directorsDispatcher = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    [self initialSetup];
    
    return self;
}

- (void)initialSetup {
    id (^carWashFactory)(Class, NSUInteger, id) = ^id(Class handlerClass, NSUInteger count, id handlerObserver) {
        id dispatcher = [ITEmployeeDispatcher object];
        for (NSUInteger i = 0; i < count; i++) {
            ITEmployee *employee = [handlerClass object];
            [employee addObserver:handlerObserver];
            [dispatcher addHandler:employee];
        }
        
        return dispatcher;
    };
    
    self.directorsDispatcher = carWashFactory([ITDirector class], kITDirectorsCount, nil);
    self.accountantsDispatcher = carWashFactory([ITAccountant class], kITAccountantsCount, self.directorsDispatcher);
    self.washersDispatcher = carWashFactory([ITWasher class], kITWashersCount, self.accountantsDispatcher);
}

- (void)removeConnections {
    ITRemoveCarWashConnections removeCarWashConnections = ^void(NSArray *observableObjects, NSArray *observers) {
        for (id object in observableObjects) {
            [object removeObservers:observers];
        }
    };
    
    removeCarWashConnections(self.washersDispatcher.handlers, @[self, self.accountantsDispatcher]);
    removeCarWashConnections(self.accountantsDispatcher.handlers, @[self, self.directorsDispatcher]);
    removeCarWashConnections(self.directorsDispatcher.handlers, @[self]);
}

#pragma mark-
#pragma mark Accessors


#pragma mark-
#pragma mark Public

- (void)washCars:(NSArray *)cars {
    for (ITCar *car in cars) {
        [self performSelectorInBackground:@selector(washCar:)
                               withObject:car];
    }
}

#pragma mark -
#pragma mark - Private

- (void)washCar:(ITCar *)car {
    [self.washersDispatcher performWorkWithObject:car];
}

@end
