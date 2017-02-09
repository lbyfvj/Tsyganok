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

- (void)proccessObject:(ITWasher *)object {
    [self print:@"begin procceed" withObject:object];
    [self calculate];
    [self print:@"finished procceed" withObject:object];
}

- (void)calculate {
    sleep(arc4random_uniform(kITEmployeeMaxSleepTime));
    NSLog(@"Money calculated by %@(%@): %lu", [self class], self.name, self.money);
}

@end
