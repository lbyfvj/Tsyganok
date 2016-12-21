//
//  ITAccountant.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITAccountant.h"

@interface ITAccountant ()
@property (nonatomic, assign)   NSUInteger  revenue;

- (void)calculateRevenue;

@end

@implementation ITAccountant

- (void)dealloc {
    //self.revenue = nil;
    
    [super dealloc];
}

- (instancetype)initWithMoney:(NSUInteger)money
                      revenue:(NSUInteger)revenue {
    self = [super init];
    if (self) {
        self.money = money;
        self.revenue = revenue;
    }
    
    return self;
}

- (instancetype)init {
    return [self initWithMoney: 0];
}

- (void)performWorkWithObject:(id<ITMoneyKeeperProtocol> )object  {
    [self takeMoney:self.price fromObject:object];
    NSLog(@"Employee %@ started work with %@", [self class], [object class]);
    [self calculateRevenue];
}

- (void)calculateRevenue {
    
}

@end
