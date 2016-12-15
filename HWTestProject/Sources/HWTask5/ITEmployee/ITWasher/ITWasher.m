//
//  ITWasher.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 15.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITWasher.h"

@implementation ITWasher

- (void)performWorkWithObject:(ITCar *)car {
    NSLog(@"%@: Wash the car!", [self class]);
    [car changeState:car];
}

@end
