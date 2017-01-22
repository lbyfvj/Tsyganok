//
//  ITDirector.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 10.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITDirector.h"

@implementation ITDirector

#pragma mark-
#pragma mark Public

-(void)proccessObject:(id)object {
    sleep(arc4random_uniform(kITEmployeeMaxSleepTime));
    [self takeMoneyFromObject:object];
}

- (void)performInBackground:(id)object {
    [self proccessObject:object];
}

@end
