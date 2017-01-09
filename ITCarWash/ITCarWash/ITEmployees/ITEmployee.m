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
    self.money = 0;
    
    [self removeObserver:self];
    
    [super dealloc];
}

- (instancetype)init {

    return [self initWithMoney:0];
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
            return @selector(employeeDidBecomeReadyForWork:);
        
        case ITEmployeeWillBeginWork:
            return @selector(employeeWillBeginWork:);
            
        default:
            return [super selectorForState:state];
    }
}

- (void)proccessObject:(id<ITMoneyKeeperProtocol> )object {
//    NSLog(@"Employee %@ started work yyyyy with object: %@", [self class], object);
//    self.state = ITEmployeeDidBecomeReadyForWork;
}

#pragma mark -
#pragma mark ITMoneyKeeperProtocol

- (void)takeMoney:(NSUInteger)money {
    @synchronized (self) {
        self.money =+ money;
    }
}

- (void)giveMoney:(NSUInteger)money {
    @synchronized (self) {
        self.money =- money;
    }
}

- (void)takeMoney:(NSUInteger)money fromKeeper:(id<ITMoneyKeeperProtocol>)object{
    [self takeMoney:money];
    [object giveMoney:money];
}


@end
