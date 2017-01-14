//
//  ITAccountant.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 10.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITAccountant.h"
#import "ITWasher.h"

@implementation ITAccountant

#pragma mark-
#pragma mark Accessors


#pragma mark-
#pragma mark Public

- (void)proccessObject:(id)object {
    sleep(arc4random_uniform(kITEmployeeMaxSleepTime));
    [self takeAllMoneyFromObject:object];
    [self notifyWithSelector:@selector(proccessObject:)];
}


- (void)performInBackground:(id)object {
    [self proccessObject:object];
}

- (void)performOnMainThread:(id)object {
    [self notifyWithSelector:@selector(proccessObject:)];
}

@end
