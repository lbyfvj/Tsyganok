//
//  ITAccountant.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 15.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITAccountant.h"

@implementation ITAccountant

- (void)performWorkWithObject:(id<ITMoneyChainProtocol> )object  {
    [self takeMoney:self.price fromObject:object];
    NSLog(@"Employee %@ started work with %@", [self class], [object class]);
}

- (void)calculateRevenue {
    
}

@end
