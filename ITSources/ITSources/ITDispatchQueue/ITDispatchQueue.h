//
//  ITDispatchQueue.h
//  ITSources
//
//  Created by Ivan Tsyganok on 13.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ITGCDBlock)(void);

typedef NSUInteger ITDelayInSeconds;

typedef enum {
    ITDispatchQueueHighPriority        = DISPATCH_QUEUE_PRIORITY_HIGH,
    ITDispatchQueueDefaultPriority     = DISPATCH_QUEUE_PRIORITY_DEFAULT,
    ITDispatchQueueLowPriority         = DISPATCH_QUEUE_PRIORITY_LOW,
    ITDispatchQueueBackgroundPriority  = DISPATCH_QUEUE_PRIORITY_BACKGROUND
} ITDispatchQueuePriority;

void ITAsyncPerformInBackgroundQueue(ITGCDBlock block);

void ITAsyncPerformInQueue(ITDispatchQueuePriority type, ITGCDBlock block);

void ITAsyncPerformInMainQueue(ITGCDBlock block);

void ITDispatchAfter(NSTimeInterval delay, ITDispatchQueuePriority type, ITGCDBlock block);

void ITCancelDispatchBlock(ITGCDBlock block);

dispatch_queue_t ITGetDispatchGlobalQueueWithType(ITDispatchQueuePriority type);
