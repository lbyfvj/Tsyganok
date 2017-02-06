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

#pragma mark -
#pragma mark Overloaded Methods

- (void)finishProcessingingObject:(ITCar *)object {
    if ([object isKindOfClass:[ITCar class]]) {
        object.carState = ITCarClean;
    }
}

- (void)proccessObject:(ITCar *)object {
    [self print:@"begin procceed" withObject:((ITCar *)object)];
    [self washCar:object];
    [self print:@"took money from" withObject:((ITCar *)object)];
    [self print:@"finished procceed" withObject:((ITCar *)object)];
}

#pragma mark-
#pragma mark Private

- (void)washCar:(ITCar *)car {
    sleep(arc4random_uniform(kITEmployeeMaxSleepTime));
}

@end
