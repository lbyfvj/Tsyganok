//
//  ITCar.h
//  HWL1T1
//
//  Created by Ivan Tsyganok on 15.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ITMoneyChainProtocol.h"
//#import "ITObservableObject.h"

//@class ITCar;

typedef NS_ENUM(NSUInteger, ITCarState) {
    ITClean,
    ITDirty
};
//
//@protocol ITCarObserver <NSObject>
//
//@optional
//- (void)carDidBecomeClean:(ITCar *)car;
//- (void)carDidBecomeDirty:(ITCar *)car;
//
//@end

//@interface ITCar : ITObservableObject
@interface ITCar : NSObject  <ITMoneyChainProtocol>
@property (nonatomic, assign)   ITCarState    carState;

- (instancetype)initWithMoney:(NSDecimalNumber *)money;
//@property (nonatomic, assign) NSString      *name;
//@property (nonatomic, assign) NSUInteger    carState;
//@property (nonatomic, assign) NSUInteger    money;
//
//- (id)initWithName:(NSString *)name state:(ITCarState)state;
//- (void)changeState:(ITCar *)car;

@end
