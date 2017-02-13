//
//  ITDispatchQueue.m
//  ITSources
//
//  Created by Ivan Tsyganok on 13.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITDispatchQueue.h"

void ITAsyncPerformInBackgroundQueue(ITGCDBlock block) {
    ITAsyncPerformInQueue(ITDispatchQueueBackgroundPriority, block);
}

void ITAsyncPerformInQueue(ITDispatchQueuePriority type, ITGCDBlock block) {
    dispatch_async(ITGetDispatchGlobalQueueWithType(type), block);
}

void ITAsyncPerformInMainQueue(ITGCDBlock block) {
    dispatch_async(dispatch_get_main_queue(), block);
}

dispatch_queue_t ITGetDispatchGlobalQueueWithType(ITDispatchQueuePriority type) {
    return dispatch_get_global_queue(type, 0);
}

void ITDispatchAfter(NSUInteger delay, ITDispatchQueuePriority type, ITGCDBlock block) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), ITGetDispatchGlobalQueueWithType(type), block);
}

