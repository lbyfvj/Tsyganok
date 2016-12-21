//
//  ITWasher.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITWasher.h"

static const NSUInteger kDefaultCarWashPrice = 1;

@interface ITWasher ()

- (void)washCar:(ITCar *)car;

@end

@implementation ITWasher

@dynamic price;

- (NSUInteger)price {
    return kDefaultCarWashPrice;
}

- (void)performWorkWithObject:(id<ITMoneyKeeperProtocol> )object {
    [self takeMoney:self.price fromObject:object];
    NSLog(@"Employee %@ started work with %@", [self class], [object class]);
    [self washCar:object];
}

- (void)washCar:(ITCar *)car {
    car.carState = ITClean;
}

@end
