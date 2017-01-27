//
//  ITEmployeeObserverProtocol.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 12.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ITEmployee;

@protocol ITEmloyeeObserver <NSObject>

@optional
- (void)employeeDidBecomeFree:(ITEmployee *)employee;
- (void)employeeDidBecomeBusy:(ITEmployee *)employee;
- (void)employeeDidBecomePending:(ITEmployee *)employee;

@end
