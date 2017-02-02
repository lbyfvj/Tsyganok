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
@property (nonatomic, retain) ITQueue *queue;
@property (nonatomic, assign) NSUInteger money;

@end

@implementation ITEmployee

#pragma mark-
#pragma mark Initializatinos and Deallocations

- (void)dealloc {
    self.name = nil;
    self.queue = nil;
    
    [super dealloc];
}

- (id)init {
    self = [super init];
    
    self.name = [NSString randomNameWithLength:7];
    self.queue = [ITQueue object];
    
    return self;
}

#pragma mark-
#pragma mark Public

- (void)proccessObject:(id)object {    
    [self doesNotRecognizeSelector:_cmd];
}

- (void)performWorkWithObject:(ITEmployee *)employee {
    [self performSelectorInBackground:@selector(performWorkInBackgroundWithObject:)
                           withObject:employee];
}

#pragma mark-
#pragma mark Private

- (void)performWorkInBackgroundWithObject:(id<ITMoneyKeeper>)object {
    [self takeMoneyFromObject:object];
    [self proccessObject:object];    
    [self performSelectorOnMainThread:@selector(performWorkOnMainThreadWithObject:)
                           withObject:object
                        waitUntilDone:NO];
}

- (void)performWorkOnMainThreadWithObject:(id<ITMoneyKeeper>)object {
    @synchronized (object) {
        [self finishProccessingObject:object];
    }
    
    @synchronized (self) {
        [self finishProccess];
    }
}

- (void)finishProccessingObject:(id<ITMoneyKeeper>)object {
    ((ITEmployee *)object).state = ITEmployeeDidBecomeFree;
}

- (void)finishProccess {
    self.state = ITEmployeeDidBecomePending;
}

#pragma mark -
#pragma mark ITObservableObjct

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ITEmployeeDidBecomeBusy:
            return @selector(employeeDidBecomeBusy:);
            
        case ITEmployeeDidBecomeFree:
            return @selector(employeeDidBecomeFree:);
            
        case ITEmployeeDidBecomePending:
            return @selector(employeeDidBecomePending:);
            
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

@end
