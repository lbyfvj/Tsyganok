//
//  ITQueue.h
//  ITCarWash
//
//  Created by Ivan Tsyganok on 13.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <ITSources/ITSources.h>

@interface ITQueue : NSObject
@property (nonatomic, readonly) NSUInteger  count;
@property (nonatomic, readonly)	NSArray     *queue;

- (void)addObjectToQueue:(id)object;
- (id)removeFromQueue;

@end
