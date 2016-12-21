//
//  ITCar.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ITMoneyKeeperProtocol.h"

typedef NS_ENUM(NSUInteger, ITCarState) {
    ITClean,
    ITDirty
};

@interface ITCar : NSObject  <ITMoneyKeeperProtocol>
@property (nonatomic, assign)   ITCarState    carState;

- (instancetype)initWithMoney:(NSUInteger)money;

@end
