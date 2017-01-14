//
//  ITCar.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 10.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITCar.h"

@implementation ITCar

@synthesize money = _money;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];    
    if (self) {
        self.carState = ITCarDirty;
        self.money = _money;
    }
    
    return self;
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
