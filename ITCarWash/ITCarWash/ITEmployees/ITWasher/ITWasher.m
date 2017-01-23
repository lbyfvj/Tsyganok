//
//  ITWasher.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 10.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITWasher.h"
#import "ITCar.h"

@implementation ITWasher

#pragma mark-
#pragma mark Public

- (void)proccessObject:(ITCar *)object {
    NSLog(@"%@(%@) begin procceed %@(%@)", [self class], self.name, [object class], object.name);
    [self washCar:object];
    [self takeMoneyFromObject:object];
    NSLog(@"%@(%@) took money from %@(%@)", [self class], self.name, [object class], object.name);
    NSLog(@"%@(%@) finished procceed %@(%@)", [self class], self.name, [object class], object.name);
}

#pragma mark-
#pragma mark Private

- (void)washCar:(ITCar *)car {
    sleep(arc4random_uniform(kITEmployeeMaxSleepTime));
    car.carState = ITCarClean;
}

@end
