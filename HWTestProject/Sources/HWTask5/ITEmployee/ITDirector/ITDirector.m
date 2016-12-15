//
//  ITDirector.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 15.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITDirector.h"

@implementation ITDirector

- (void)performWorkWithObject:(ITAccountant *)accountant {
    NSLog(@"%@: Take moneys from Accountant!", [self class]);
}

@end
