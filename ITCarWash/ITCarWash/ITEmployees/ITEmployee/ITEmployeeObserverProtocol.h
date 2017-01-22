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
- (void)employeeDidFinishWork:(ITEmployee *)employee;
- (void)employeeDidBeginWork:(ITEmployee *)employee;
- (void)employeeWaitingForWork:(ITEmployee *)employee;

@end
