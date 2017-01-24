//
//  ITCar.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 10.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITCar.h"

NSUInteger const kITInitialCarMoney = 1;

@interface ITCar ()
@property (nonatomic, assign) NSUInteger money;

@end

@implementation ITCar

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {    
    self.name = nil;
    [super dealloc];
}

- (instancetype)init {
    self = [super init];    
    if (self) {
        self.name = [NSString randomNameWithLength:4];
        self.carState = ITCarDirty;
        self.money = kITInitialCarMoney;
    }
    
    return self;
}

#pragma mark-
#pragma mark ITMoneyKeeper

- (NSUInteger)giveMoney {
    @synchronized(self) {
        NSUInteger money = self.money;
        self.money = 0;
        return money;
    }
}

@end
