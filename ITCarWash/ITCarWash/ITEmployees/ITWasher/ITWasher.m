//
//  ITWasher.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITWasher.h"

//static const NSUInteger kDefaultCarWashPrice = 1;

@interface ITWasher ()

- (void)washCar:(ITCar *)car;

@end

@implementation ITWasher

//@dynamic price;

#pragma mark -
#pragma mark Accessors

//- (NSUInteger)price {
//    return kDefaultCarWashPrice;
//}

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(id<ITMoneyKeeperProtocol> )object {
    [self takeMoneyFromObject:object];
    NSLog(@"Employee %@ started work with %@", [self class], [object class]);
    [self washCar:object];
}

#pragma mark -
#pragma mark Private

- (void)washCar:(ITCar *)car {
    car.carState = ITCarClean;
}

@end
