//
//  ITEmployeeStatus.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 18.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITEmployeeObserverProtocol.h"

@protocol ITEmployeeStatus <ITEmloyeeObserver>

@required
- (BOOL)busy;

@end
