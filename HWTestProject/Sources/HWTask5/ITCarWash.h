//
//  ITCarWash.h
//  HWL1T1
//
//  Created by Ivan Tsyganok on 15.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITWasher.h"
#import "ITCar.h"

@interface ITCarWash : NSObject <ITCarObserver>
@property (nonatomic, copy, readonly)   NSArray     *stuff;

- (void)hireStuff:(ITEmployee *)employee;
- (void)fireStuff:(ITEmployee *)employee;
- (void)performWork;

@end
