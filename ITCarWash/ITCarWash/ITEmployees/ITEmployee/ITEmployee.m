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
@property (nonatomic, assign) NSUInteger money;

- (void)performWorkOnMainThreadWithObject:(ITEmployee *)object;

@end

@implementation ITEmployee

#pragma mark-
#pragma mark Initializatinos and Deallocations

- (void)dealloc {
    self.name = nil;
    
    [super dealloc];
}

- (id)init {
    self = [super init];
    self.name = [NSString randomNameWithLength:7];
    
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

- (void)performWorkInBackgroundWithObject:(id)object {
    [self takeMoneyFromObject:object];
    [self proccessObject:object];
    [self performSelectorOnMainThread:@selector(performWorkOnMainThreadWithObject:)
                           withObject:object
                        waitUntilDone:NO];
}

- (void)finishProcessingingObject:(ITEmployee *)object {
    if ([object isKindOfClass:[ITEmployee class]]) {
        object.state = ITEmployeeDidBecomeFree;
    }
}

- (void)finishProcessing {
    self.state = ITEmployeeDidBecomePending;
}

- (void)print:(NSString *)message withObject:(id)object {
    NSLog(@"%@(%@) %@ %@(%@)", [self class], self.name, message, [object class], ((ITEmployee *)object).name);
}

#pragma mark-
#pragma mark Private

- (void)performWorkOnMainThreadWithObject:(ITEmployee *)object {
    @synchronized (object) {
        [self finishProcessingingObject:object];
    }
    
    @synchronized (self) {
        [self finishProcessing];
    }
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

- (void)takeMoneyFromObject:(id)object {
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
