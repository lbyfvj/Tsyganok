//
//  ITAccountant.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITEmployee.h"
#import "ITWasher.h"

@interface ITAccountant : ITEmployee

- (instancetype)initWithMoney:(NSUInteger)money revenue:(NSUInteger)revenue;

@end
