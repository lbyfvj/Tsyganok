//
//  ITEmployee.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 15.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITEmployee.h"

@implementation ITEmployee

@synthesize money = _money;

@dynamic observerSet;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.money = nil;
    
    [self removeObserver:self];
    
    [super dealloc];
}

//- (instancetype)init {
//    return [self initWithMoney:[NSDecimalNumber zero]];
//}

- (instancetype)initWithMoney:(NSDecimalNumber *)money {
    self = [super init];
    if (self) {
        self.money = money;
        
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
            
        case ITEmployeeDidBeginWork:
            return @selector(employeeDidBeginWork:);
            
        case ITEmployeeDidPerformWorkWithObject:
            return @selector(employeeDidPerformWork:);
            
        default:
            return [super selectorForState:state];
    }
}

- (void)performWorkWithObject:(id<ITMoneyChainProtocol> )object {
    NSLog(@"Employee %@ started work yyyyy with object: %@", [self class], object);
    self.state = ITEmployeeDidBeginWork;
}


#pragma mark -
#pragma mark ITMoneyChainProtocol

- (void)takeMoney:(NSDecimalNumber *)money fromObject:(id<ITMoneyChainProtocol>)object {
    self.money = [self.money decimalNumberByAdding:money];
    object.money = [object.money decimalNumberBySubtracting:money];
}


- (void)giveMoney:(NSDecimalNumber *)money toObject:(id<ITMoneyChainProtocol>)object {
    self.money = [self.money decimalNumberBySubtracting:money];
    object.money = [object.money decimalNumberByAdding:money];
}

@end
