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

- (void)calculate;

@end

@implementation ITAccountant

- (void)dealloc {
    //self.revenue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithMoney: 0];
}

- (instancetype)initWithMoney:(NSUInteger)money
                      revenue:(NSUInteger)revenue {
    self = [super init];
    if (self) {
        //self.money = money;
        self.revenue = revenue;
    }
    
    return self;
}

- (void)performWorkWithObject:(id<ITMoneyKeeperProtocol> )object  {
    [self takeMoneyFromObject:object];
    NSLog(@"Employee %@ started work with %@", [self class], [object class]);
    [self calculateRevenue];
}

- (void)calculate {
    
}

@end
