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

#pragma mark -
#pragma mark Overloaded Methods

- (void)finishProcessing {
    self.state = ITEmployeeDidBecomeFree;
    
}

-(void)proccessObject:(ITAccountant *)object {
    NSLog(@"%@ begin procceed %@(%@)", [self class], [object class], object.name);
    object.state = ITEmployeeDidBecomeFree;
    [self getProfit];
    NSLog(@"%@(%@) finished procceed %@(%@)", [self class], self.name, [object class], object.name);
}

#pragma mark-
#pragma mark Private

- (void)getProfit {
    sleep(arc4random_uniform(kITEmployeeMaxSleepTime));
    NSLog(@"%@ get profit: %lu", [self class], self.money);
}

@end
