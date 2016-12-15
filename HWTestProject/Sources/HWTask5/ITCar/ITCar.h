//
//  ITCar.h
//  HWL1T1
//
//  Created by Ivan Tsyganok on 15.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Clean,
    Dirty
} ITCarState;

@interface ITCar : NSObject
@property (nonatomic, assign) NSString      *name;
@property (nonatomic, assign) BOOL          cash;
@property (nonatomic, assign) ITCarState    state;

- (id)initWithName:(NSString *)name state:(ITCarState)state;
- (void)changeState:(ITCar *)car;


@end
