//
//  ITMoneyChainProtocol.h
//  HWL1T1
//
//  Created by Ivan Tsyganok on 19.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ITEmployee;

@protocol ITMoneyChainProtocol <NSObject>
@property (nonatomic, assign) NSDecimalNumber *money;

- (void)takeMoney:(NSDecimalNumber *)money fromObject:(id<ITMoneyChainProtocol>)object;
- (void)giveMoney:(NSDecimalNumber *)money toObject:(id<ITMoneyChainProtocol>)object;

@end
