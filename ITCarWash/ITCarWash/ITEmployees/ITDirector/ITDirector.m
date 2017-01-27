//
//  ITDirector.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 10.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITDirector.h"

#import "ITAccountant.h"

@implementation ITDirector

#pragma mark-
#pragma mark Public

-(void)proccessObject:(ITAccountant *)object {
    NSLog(@"%@ begin procceed %@", [self class], [object class]);
    [self takeMoneyFromObject:object];
    object.state = ITEmployeeDidBecomeFree;
    [self getProfit];
}

- (void)getProfit {
    sleep(arc4random_uniform(kITEmployeeMaxSleepTime));
    NSLog(@"%@ get profit: %lu", [self class], self.money);
}

@end
