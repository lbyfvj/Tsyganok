//
//  ITCar.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 15.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITCar.h"

@implementation ITCar

@synthesize money = _money;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.money = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithMoney:[NSDecimalNumber zero]];
}

- (instancetype)initWithMoney:(NSDecimalNumber *)money {
    self = [super init];
    if (self) {
        self.money = money;
    }
    
    return self;
}

#pragma mark -
#pragma mark ITMoneyChainProtocol

- (void)takeMoney:(NSDecimalNumber *)money fromObject:(id<ITMoneyChainProtocol>)object {
    self.money = [self.money decimalNumberByAdding:money];
    object.money = [object.money decimalNumberBySubtracting:money];
}


- (void)giveMoney:(NSDecimalNumber *)money toObject:(id<ITMoneyChainProtocol>)object {
    self.money = [self.money decimalNumberBySubtracting:money];
    object.money = [object.money decimalNumberByAdding:money];
}

//#pragma mark -
//#pragma mark - Accessors
//
//- (void)setState:(NSUInteger)state {
//    if (state != _carState) {
//        _carState = state;
//        
//        self.state = (0 == state) ? ITClean : ITDirty;
//    }
//}
//
//#pragma mark -
//#pragma mark - Overloaded Methods
//
//- (SEL)selectorForState:(NSUInteger)state {
//    switch (state) {
//        case ITClean:
//            return @selector(carDidBecomeClean:);
//        case ITDirty:
//            return @selector(carDidBecomeDirty:);
//            
//        default:
//            return [super selectorForState:state];
//    }
//}
//
//

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
