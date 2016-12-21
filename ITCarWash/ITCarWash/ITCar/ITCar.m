//
//  ITCar.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITCar.h"

@implementation ITCar

@synthesize money = _money;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    
    [super dealloc];
}

- (instancetype)initWithMoney:(NSUInteger)money {
    self = [super init];
    if (self) {
        self.money = money;
    }
    
    return self;
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
