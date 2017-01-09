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

#pragma mark -
#pragma mark Accessors

- (NSUInteger)price {
    return kDefaultCarWashPrice;
}

#pragma mark -
#pragma mark Public

- (void)proccessObject:(id<ITMoneyKeeperProtocol>)car {
    [self takeMoney:self.price fromKeeper:car];
    [self washCar:car];
}

#pragma mark -
#pragma mark Private

- (void)washCar:(ITCar *)car {
    car.carState = ITCarClean;
    NSLog(@"Employee %@ wash car %@", [self class], [car class]);
}

@end
