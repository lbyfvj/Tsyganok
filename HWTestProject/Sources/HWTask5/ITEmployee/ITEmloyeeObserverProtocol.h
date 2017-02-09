//
//  ITEmloyeeObserverProtocol.h
//  HWL1T1
//
//  Created by Ivan Tsyganok on 19.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ITEmployee;

@protocol ITEmloyeeObserverProtocol <NSObject>

@optional
- (void)employeeDidPerformWork:(ITEmployee *)employee;
- (void)employeeDidBecomeFree:(ITEmployee *)employee;
- (void)employeeDidBecomeBusy:(ITEmployee *)employee;

@end
