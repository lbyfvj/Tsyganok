//
//  ITCarWashAdministrator.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 01.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <ITSources/ITDispatchQueue.h>

@interface ITCarWashAdministrator : NSObject
@property (nonatomic, assign)   BOOL    running;

- (void)start;

@end
