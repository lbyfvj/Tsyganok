//
//  ITEmployee.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITEmployee.h"

@implementation ITEmployee

@synthesize money = _money;

@dynamic observersSet;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self removeObserver:self];
    
    [super dealloc];
}

- (instancetype)initWithMoney:(NSUInteger)money {
    self = [super init];
    if (self) {
        self.money = money;
        self.state = ITEmployeeDidFinishWork;
        
        [self addObserver:self];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ITEmployeeDidFinishWork:
            return @selector(employeeDidFinishWork:);
            
        case ITEmployeeDidBecomeReadyForWork:
            return @selector(employeeDidBecomeReadyForWork::);
        
        case ITEmployeeWillBeginWork:
            return @selector(employeeWillBeginWork::);
            
        default:
            return [super selectorForState:state];
    }
}

- (void)proccessWorkWithObject:(id<ITMoneyKeeperProtocol> )object {
    NSLog(@"Employee %@ started work yyyyy with object: %@", [self class], object);
    self.state = ITEmployeeDidBecomeReadyForWork;
}

#pragma mark -
#pragma mark ITMoneyKeeperProtocol



- (void)takeMoney:(NSUInteger)money fromObject:(id<ITMoneyKeeperProtocol>)object {
    self.money =+ money;
    object.money =- money;
}

- (void)giveMoney:(NSUInteger)money toObject:(id<ITMoneyKeeperProtocol>)object {
    self.money =- money;
    object.money =+ money;
}

@end
