//
//  ITEmployeeDispatcher.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 31.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITEmployeeDispatcher.h"

#import <ITSources/ITSources.h>

#import "ITQueue.h"
#import "ITEmployee.h"

@interface ITEmployeeDispatcher ()
@property (nonatomic, retain)   NSMutableArray  *mutableHandlers;
@property (nonatomic, retain)   ITQueue         *objectsQueue;

- (ITEmployee *)findFreeEmployee;
- (void)giveWorkToEmployee:(ITEmployee *)employee;

@end

@implementation ITEmployeeDispatcher

@dynamic handlers;

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableHandlers = nil;
    self.objectsQueue = nil;
    
    [super dealloc];
}

- (id)init {
    self = [super init];
    if (self) {
        self.mutableHandlers = [NSMutableArray array];
        self.objectsQueue = [ITQueue object];
    }
    return self;
}

#pragma mark-
#pragma mark Accessors

- (NSArray *)handlers {
    id handlers = self.mutableHandlers;
    @synchronized (handlers) {
        return [[handlers copy] autorelease];
    }
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(id)object {
    id handlers = self.mutableHandlers;
    @synchronized (handlers) {
        [handlers addObject:object];
    }
}

- (void)removeHandler:(id)object {
    id handlers = self.mutableHandlers;
    @synchronized (handlers) {
        [handlers removeObject:object];
    }
}

- (void)performWorkWithObject:(id <ITMoneyKeeper>)object {
    ITEmployee *employee = [self findFreeEmployee];
    
    if (employee) {
        employee.state = ITEmployeeDidBecomeBusy;
        [self giveWorkToEmployee:employee];
    }
}

#pragma mark -
#pragma mark Private

- (ITEmployee *)findFreeEmployee {
    NSArray *employees = self.handlers;
    @synchronized (employees) {
        ITEmployee *employee= nil;
        for (employee in employees) {
            if (employee.state == ITEmployeeDidBecomeFree) {
                break;
            }
        }
        
        return employee;
    }
}

- (void)giveWorkToEmployee:(ITEmployee *)employee {
    @synchronized(self.objectsQueue) {
        id object = [self.objectsQueue dequeueObject];
        if (!object) {
            return;
        }
        
        [employee performSelectorInBackground:@selector(performWorkWithObject:)
                                   withObject:object];
    }
}

#pragma mark -
#pragma mark - ITEmployeeObserver Protocol

- (void)employeeDidBecomeFree:(ITEmployee *)employee {
    NSArray *handlers = self.handlers;
    @synchronized(handlers) {
        if (![handlers containsObject:employee]) {
            return;
        }
        
        if (ITEmployeeDidBecomeFree == employee.state) {
            employee.state = ITEmployeeDidBecomeBusy;
            
            [self giveWorkToEmployee:employee];
        }
    }
}

- (void)employeeDidBecomePending:(ITEmployee *)employee {
    NSArray *handlers = self.handlers;
    if (![handlers containsObject:employee]) {
        [self performSelectorInBackground:@selector(performWorkWithObject:)
                               withObject:employee];
    }
}

@end
