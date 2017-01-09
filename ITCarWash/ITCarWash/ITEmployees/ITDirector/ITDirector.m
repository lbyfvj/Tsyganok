//
//  ITDirector.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITDirector.h"

@interface ITDirector()
@property (nonatomic, assign)   NSUInteger  profit;

- (void)getProfit;

@end

@implementation ITDirector

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.profit = 0;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithMoney: 0
                       profit:0];
}

- (instancetype)initWithMoney:(NSUInteger)money
                      profit:(NSUInteger)profit
{
    self = [super initWithMoney:money];
    if (self) {
        self.profit = profit;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)proccessObject:(id<ITMoneyKeeperProtocol>)accountant {
    [self takeMoney: accountant.money fromKeeper:accountant];
    [self getProfit];
}

#pragma mark -
#pragma mark Private Methods

- (void)getProfit {
    NSUInteger profit = self.profit;
    profit = profit + 1;
    NSLog(@"Director %@ get profit %lu moneys", [self class], (NSUInteger)profit);
}

@end
