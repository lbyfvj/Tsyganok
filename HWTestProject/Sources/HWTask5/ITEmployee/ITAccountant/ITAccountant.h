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
@property (nonatomic, assign) NSUInteger  revenue;

- (void)performWorkWithObject:(ITWasher *)washer;
- (void)calculateRevenue;

@end
