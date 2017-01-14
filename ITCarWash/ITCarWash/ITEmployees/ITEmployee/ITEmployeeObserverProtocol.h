//
//  ITEmployeeObserverProtocol.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 12.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ITEmployee;

@protocol ITEmloyeeObserverProtocol <NSObject>

@optional
- (void)ITEmployeeDidStartedWork:(ITEmployee *)employee;
- (void)ITEmployeeDidFinishedWork:(ITEmployee *)employee;
- (void)ITEmployeeWillBeginWork:(ITEmployee *)employee;

@end
