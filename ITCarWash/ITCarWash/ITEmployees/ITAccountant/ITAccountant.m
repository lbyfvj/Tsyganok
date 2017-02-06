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
#pragma mark Public

- (void)processObject:(ITWasher *)object {
    NSLog(@"%@ begin procceed %@(%@)", [self class], [object class], object.name);
    [self calculate];
    NSLog(@"%@ finished procceed %@(%@)", [self class], [object class], object.name);
}

- (void)calculate {
    sleep(arc4random_uniform(kITEmployeeMaxSleepTime));
    NSLog(@"Money calculated by %@: %lu", [self class], self.money);
}

@end
