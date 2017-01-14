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

- (void)giveAllMoneyToObject:(id<ITMoneyKeeperProtocol>)object {
    [self giveMoney:self.money toObject:object];
}

- (void)takeAllMoneyFromObject:(ITEmployee *)object {
    [object giveMoney:object.money toObject:self];
}

#pragma mark-
#pragma mark ITMoneyKeeperProtocol

- (void)giveMoney:(NSUInteger)money toObject:(id<ITMoneyKeeperProtocol>)object {
    if (self.money >= money && (object)) {
        self.money -= money;
        object.money += money;
    }
}

- (void)takeMoney:(NSUInteger)money fromObject:(id<ITMoneyKeeperProtocol>)object {
    if (object) {
       [object giveMoney:money toObject:self];
    }
}

@end
