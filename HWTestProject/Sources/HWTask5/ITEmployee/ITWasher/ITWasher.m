//
//  ITWasher.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 15.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITWasher.h"

static const NSString *kDefaultCarWashPrice = @"1";

@interface ITWasher ()

- (void)washCar:(ITCar *)car;

@end

@implementation ITWasher

@dynamic price;

- (NSDecimalNumber *)price {
    return [NSDecimalNumber decimalNumberWithString:(NSString *)kDefaultCarWashPrice];
}

- (void)performWorkWithObject:(id<ITMoneyChainProtocol> )object {
    [self takeMoney:self.price fromObject:object];
    NSLog(@"Employee %@ started work with %@", [self class], [object class]);
    [self washCar:object];
}

- (void)washCar:(ITCar *)car {
    car.carState = ITClean;
}

@end
