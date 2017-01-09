//
//  ITDirector.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITEmployee.h"

@interface ITDirector : ITEmployee

- (instancetype)initWithMoney:(NSUInteger)money profit:(NSUInteger)profit;

@end
