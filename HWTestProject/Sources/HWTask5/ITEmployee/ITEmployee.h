//
//  ITEmployee.h
//  HWL1T1
//
//  Created by Ivan Tsyganok on 15.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Wash,
    Calculate,
    MakeProfit
} ITWorkType;

@interface ITEmployee : NSObject

- (void)performWorkWithObject:(NSObject *)object;


@end
