//
//  ITCarWash.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITEmployeeObserverProtocol.h"

@class ITCar;

@interface ITCarWash : NSObject <ITEmloyeeObserverProtocol>
@property (nonatomic, retain)           ITCar       *car;

- (void)hireEmployees:(ITEmployee *)employee;

@end
