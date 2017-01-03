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

- (instancetype)initWithMoney:(NSUInteger)money {
    self = [super init];
    
    self.money = money;
    
    return self;
}

#pragma mark -
#pragma mark ITMoneyKeeperProtocol

- (void)takeMoney {
    
}

- (void)giveMoney {
    
}

- (void)takeMoneyFromObject:(id<ITMoneyKeeperProtocol>)object {
    
}

- (void)takeMoney:(NSUInteger)money fromObject:(id<ITMoneyKeeperProtocol>)object {
    self.money =+ money;
    object.money =- money;
}

- (void)giveMoney:(NSUInteger)money toObject:(id<ITMoneyKeeperProtocol>)object {
    self.money =- money;
    object.money =+ money;
}

@end
