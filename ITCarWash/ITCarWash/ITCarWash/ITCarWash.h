//
//  ITCarWash.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITEmployeeObserverProtocol.h"
#import "ITCar.h"

@interface ITCarWash : NSObject <ITEmloyeeObserverProtocol>

- (void)washCar:(ITCar *)car;

@end
