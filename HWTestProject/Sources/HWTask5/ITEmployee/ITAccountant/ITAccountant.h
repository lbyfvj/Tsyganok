//
//  ITAccountant.h
//  HWL1T1
//
//  Created by Ivan Tsyganok on 15.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITEmployee.h"
#import "ITWasher.h"

@interface ITAccountant : ITEmployee
@property (nonatomic, readonly) NSDecimalNumber *price;

- (instancetype)initWithMoney:(NSDecimalNumber *)money revenue:(NSDecimalNumber *)revenue;

- (void)performWorkWithObject:(ITWasher *)washer;

@end
