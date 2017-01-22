//
//  ITEmployee.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 10.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITEmployee.h"

@implementation ITEmployee

@synthesize money = _money;

#pragma mark-
#pragma mark Initializatinos and Deallocations

- (void)dealloc {
    
    [super dealloc];
}

#pragma mark-
#pragma mark Public

- (void)proccessObject:(id)object {
    [self doesNotRecognizeSelector:_cmd];
}

#pragma mark-
#pragma mark ITMoneyKeeperProtocol

- (void)takeMoneyFromObject:(id<ITMoneyKeeperProtocol>)object {
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
