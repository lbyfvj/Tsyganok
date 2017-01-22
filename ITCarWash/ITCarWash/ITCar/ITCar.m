//
//  ITCar.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 10.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITCar.h"

NSUInteger const kITInitialCarMoney = 1;

@implementation ITCar

@synthesize money = _money;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];    
    if (self) {
        self.carState = ITCarDirty;
        self.money = kITInitialCarMoney;
    }
    
    return self;
}

#pragma mark-
#pragma mark ITMoneyKeeperProtocol

- (NSUInteger)giveMoney {
    @synchronized(self) {
        NSUInteger money = self.money;
        self.money = 0;
        return money;
    }
}

@end
