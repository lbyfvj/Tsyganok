//
//  ITCar.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 10.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ITSources/ITSources.h>

#import "ITMoneyKeeperProtocol.h"

typedef NS_ENUM(NSUInteger, ITCarState) {
    ITCarClean,
    ITCarDirty
};

@interface ITCar : NSObject <ITMoneyKeeper>
@property (nonatomic, copy)     NSString      *name;
@property (nonatomic, assign)   ITCarState    carState;

@end
