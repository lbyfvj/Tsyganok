//
//  ITMoneyKeeperProtocol.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ITEmployee;

@protocol ITMoneyKeeperProtocol <NSObject>
@property (nonatomic, retain) NSUInteger money;

- (void)takeMoney;
- (void)giveMoney;
- (void)takeMoneyFromObject:(id<ITMoneyKeeperProtocol>)object;

- (void)takeMoney:(NSUInteger)money fromObject:(id<ITMoneyKeeperProtocol>)object;
- (void)giveMoney:(NSUInteger)money toObject:(id<ITMoneyKeeperProtocol>)object;

@end
