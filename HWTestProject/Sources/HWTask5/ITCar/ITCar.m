//
//  ITCar.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 15.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITCar.h"

@implementation ITCar

#pragma mark -
#pragma mark - Accessors

- (void)setState:(NSUInteger)state {
    
}

#pragma mark -
#pragma mark - Overloaded Methods

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ITClean:
            return @selector(carDidBecomeClean:);
        case ITDirty:
            return @selector(carDidBecomeDirty:);
            
        default:
            return [super selectorForState:state];
    }
}



//- (id)initWithName:(NSString *)name state:(ITCarState)state {
//    self = [super init];
//    _name = name;
//    _state = state;
//    _cash = YES;
//    
//    return self;
//}
//
//- (void)changeState:(ITCar *)car {
//    car.state = Clean;
//    NSLog(@"%@: Car washed!", [self class]);    
//}

@end
