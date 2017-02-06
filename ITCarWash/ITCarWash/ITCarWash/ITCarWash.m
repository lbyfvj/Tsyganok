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
    
    id (^carWashEmployees)(Class class, NSUInteger count, id<ITEmloyeeObserver>observer) = ^id(Class class, NSUInteger count, id<ITEmloyeeObserver>observer) {
        return [NSArray objectsWithCount:count block:^id{
            ITEmployee *employee = [class object];
            [employee addObserver:observer];
            
            return employee;
        }];
    };
    
    id (^carWashDispatcher)(Class dispatcherClass, Class handlerClass, NSUInteger count, id handlerObserver) = ^id(Class dispatcherClass, Class handlerClass, NSUInteger count, id handlerObserver) {
        id dispatcher = [dispatcherClass object];
        NSArray *handlers = carWashEmployees([handlerClass class], count, handlerObserver);
        for (id handler in handlers) {
            [dispatcher addHandler:handler];
        }
        
        return dispatcher;
    };
    
    self.directorsDispatcher = carWashDispatcher([ITEmployeeDispatcher class], [ITDirector class], kITDirectorsCount, nil);
    self.accountantsDispatcher = carWashDispatcher([ITEmployeeDispatcher class], [ITAccountant class], kITAccountantsCount, self.directorsDispatcher);
    self.washersDispatcher = carWashDispatcher([ITEmployeeDispatcher class], [ITWasher class], kITWashersCount, self.accountantsDispatcher);
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

-(void)washCars:(NSArray *)cars {
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
