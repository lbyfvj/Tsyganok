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

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.revenue = 0;
    
    [super dealloc];
}



- (instancetype)init {
    return [self initWithMoney: 0
                 revenue:0];
}

- (instancetype)initWithMoney:(NSUInteger)money
                      revenue:(NSUInteger)revenue
{
    self = [super initWithMoney:money];
    if (self) {
        self.revenue = revenue;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)proccessObject:(id<ITMoneyKeeperProtocol>)washer {
    [self takeMoney:washer.money fromKeeper:washer];
    NSLog(@"Employee %@ started work with %@", [self class], [washer class]);
    [self calculate];
}

#pragma mark -
#pragma mark Private Methods

- (void)calculate {
    NSUInteger revenue = self.revenue;
    revenue = revenue + 1;
    NSLog(@"Revenue calculated by %@. Revenue is %lu moneys", [self class], (NSUInteger)revenue);
}

@end
