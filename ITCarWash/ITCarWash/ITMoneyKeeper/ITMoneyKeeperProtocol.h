//
//  ITMoneyKeeperProtocol.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 10.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ITMoneyKeeperProtocol
@property (nonatomic, assign) NSUInteger money;

@optional
- (void)takeMoneyFromObject:(id<ITMoneyKeeperProtocol>)object;
- (void)takeMoney:(NSUInteger)money;

- (NSUInteger)giveMoney;

@end
