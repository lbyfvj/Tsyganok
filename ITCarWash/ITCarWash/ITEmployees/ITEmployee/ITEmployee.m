//
//  ITEmployee.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 10.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITEmployee.h"

#import "ITQueue.h"

@interface ITEmployee ()
@property (nonatomic, retain) ITQueue *employeesQueue;
@property (nonatomic, assign) NSUInteger money;

@end

@implementation ITEmployee

#pragma mark-
#pragma mark Initializatinos and Deallocations

- (void)dealloc {
    self.name = nil;
    self.employeesQueue = nil;
    
    [super dealloc];
}

- (id)init {
    self = [super init];
    
    self.name = [NSString randomNameWithLength:7];
    self.employeesQueue = [ITQueue object];
    
    return self;
}

#pragma mark-
#pragma mark Public

- (void)proccessObject:(id)object {    
    [self doesNotRecognizeSelector:_cmd];
}

- (void)performWorkWithObject:(ITEmployee *)employee {
    @synchronized(self) {
        if (ITEmployeeFree != self.state) {
            [self.employeesQueue addObjectToQueue:employee];
        } else {
            self.state = ITEmployeeWorking;
            
            [self performSelectorInBackground:@selector(performWorkInBackgroundWithObject:) withObject:employee];
        }
    }
}

#pragma mark-
#pragma mark Private

- (void)performWorkInBackgroundWithObject:(id<ITMoneyKeeper>)employee {
    [self proccessObject:employee];
    
    [self performSelectorOnMainThread:@selector(performWorkOnMainThreadWithObject:) withObject:employee waitUntilDone:NO];
}

- (void)performWorkOnMainThreadWithObject:(id<ITMoneyKeeper>)employee {
    @synchronized (employee) {
        ((ITEmployee *)employee).state = ITEmployeeFree;
    }
    
    @synchronized(self) {
        ITQueue *employeesQueue = self.employeesQueue;
        if (employeesQueue.count > 0 ) {
            id object = [employeesQueue removeFromQueue];            
            [self performSelectorInBackground:@selector(performWorkInBackgroundWithObject:) withObject:object];
        } else {
            self.state = ITEmployeeWaiting;
        }
    }
}

#pragma mark -
#pragma mark ITObservableObjct

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ITEmployeeWorking:
            return @selector(employeeDidBeginWork:);
            
        case ITEmployeeFree:
            return @selector(employeeDidFinishWork:);
            
        case ITEmployeeWaiting:
            return @selector(employeeWillBeginWork:);
            
        default:
            return [super selectorForState:state];
    }
}

#pragma mark-
#pragma mark ITMoneyKeeper Protocol

- (void)takeMoneyFromObject:(id<ITMoneyKeeper>)object {
    [self takeMoney:[object giveMoney]];
}

- (void)takeMoney:(NSUInteger)money {
    @synchronized(self) {
        self.money += money;
    }
}

- (NSUInteger)giveMoney {
    @synchronized(self) {
        NSUInteger money = self.money;
        self.money = 0;
        return money;
    }
}

#pragma mark-
#pragma mark ITEmployeeObserver Protocol

- (void)employeeDidFinishWork:(ITEmployee *)employee {
    
}

- (void)employeeDidBeginWork:(ITEmployee *)employee {
    
}

- (void)employeeWillBeginWork:(ITEmployee *)employee {
    [self performSelectorInBackground:@selector(performWorkWithObject:) withObject:employee];
}

@end
