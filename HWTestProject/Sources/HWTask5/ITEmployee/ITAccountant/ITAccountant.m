//
//  ITAccountant.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 15.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITAccountant.h"

@interface ITAccountant ()
@property (nonatomic, retain)   NSDecimalNumber    *revenue;

- (void)calculateRevenue;

@end

@implementation ITAccountant

- (void)dealloc {
    self.revenue = nil;
    
    [super dealloc];
}

- (instancetype)initWithMoney:(NSDecimalNumber *)money
                      revenue:(NSDecimalNumber *)revenue {
    self = [super init];
    if (self) {
        self.money = money;
        self.revenue = revenue;
    }
    
    return self;
}

- (instancetype)init {
    return [self initWithMoney:[NSDecimalNumber zero]];
}

- (void)performWorkWithObject:(id<ITMoneyChainProtocol> )object  {
    [self takeMoney:self.price fromObject:object];
    NSLog(@"Employee %@ started work with %@", [self class], [object class]);
    [self calculateRevenue];
}

- (void)calculateRevenue {
    
}

@end
