//
//  ITWasher.h
//  HWL1T1
//
//  Created by Ivan Tsyganok on 15.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITEmployee.h"
#import "ITCar.h"

@interface ITWasher : ITEmployee
@property (nonatomic, readonly) NSDecimalNumber *price;

@end
