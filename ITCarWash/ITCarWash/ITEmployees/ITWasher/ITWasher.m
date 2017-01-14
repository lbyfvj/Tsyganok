//
//  ITWasher.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 10.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITWasher.h"

#import "ITCar.h"

static NSUInteger const kDefaultPrice = 1;

@implementation ITWasher

#pragma mark-
#pragma mark Public

- (void)proccessObject:(id)car {
    self.state = ITEmployeeDidStartedWork;
    [self washCar:car];
    [self notifyWithSelector:@selector(proccessObject:)];
    self.state = ITEmployeeDidFinishedWork;
}

- (void)performInBackground:(id)object {
    [self proccessObject:object];
}

- (void)performOnMainThread:(id)object {
    [self notifyWithSelector:@selector(proccessObject:)];
}

#pragma mark-
#pragma mark Private

- (void)washCar:(ITCar *)car {
    sleep(arc4random_uniform(kITEmployeeMaxSleepTime));
    [self takeMoney:kDefaultPrice fromObject:car];
    car.carState = ITCarClean;
}

@end
