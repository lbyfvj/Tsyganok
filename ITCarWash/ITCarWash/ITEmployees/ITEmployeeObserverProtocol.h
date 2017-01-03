//
//  ITEmployeeObserverProtocol.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ITEmployee;

@protocol ITEmloyeeObserverProtocol <NSObject>

@optional
- (void)employeeDidBeginWork:(ITEmployee *)employee;


- (void)employeeDidFinishWork:(ITEmployee *)employee;
- (void)employeeDidBecomeReadyForWork:(ITEmployee *)employee;
- (void)employeeWillBeginWork:(ITEmployee *)employee;

- (void)employeeDidPerformWork:(ITEmployee *)employee;

@end

