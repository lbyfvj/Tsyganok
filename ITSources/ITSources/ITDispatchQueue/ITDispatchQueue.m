//
//  ITDispatchQueue.m
//  ITSources
//
//  Created by Ivan Tsyganok on 13.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITDispatchQueue.h"

static inline dispatch_time_t ITTimeDelay(NSTimeInterval delay) {
    int64_t time = (int64_t)(NSEC_PER_SEC * delay);
    return dispatch_time(DISPATCH_TIME_NOW, time);
}

void ITAsyncPerformInBackgroundQueue(ITGCDBlock block) {
    ITAsyncPerformInQueue(ITDispatchQueueBackgroundPriority, block);
}

void ITAsyncPerformInQueue(ITDispatchQueuePriority type, ITGCDBlock block) {
    dispatch_async(ITGetDispatchGlobalQueueWithType(type), block);
}

void ITAsyncPerformInMainQueue(ITGCDBlock block) {
    dispatch_async(dispatch_get_main_queue(), block);
}

void ITSyncPerformInBackgroundQueue(ITGCDBlock block) {
    ITSyncPerformInQueue(ITDispatchQueueBackgroundPriority, block);
}

void ITSyncPerformInQueue(ITDispatchQueuePriority type, ITGCDBlock block) {
    dispatch_sync(ITGetDispatchGlobalQueueWithType(type), block);
}

void ITSyncPerformInMainQueue(ITGCDBlock block) {
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

dispatch_queue_t ITGetDispatchGlobalQueueWithType(ITDispatchQueuePriority type) {
    return dispatch_get_global_queue(type, 0);
}

void ITDispatchAfter(NSTimeInterval delay, ITDispatchQueuePriority type, ITGCDBlock block) {
    if (!block) {
       return; 
    }
    
    __block BOOL cancelled = NO;
    
    void (^executedBlock)(BOOL) = ^(BOOL cancel) {
        if (cancel) {
            cancelled = YES;
            return;
        }
        
        if (!cancelled) {
            block();
        }
    };
    
    executedBlock = [[executedBlock copy] autorelease];
    
    dispatch_after(ITTimeDelay(delay), ITGetDispatchGlobalQueueWithType(type), ^{
        executedBlock(NO);
    });
}

void ITCancelDispatchBlock(ITGCDBlock block) {
    if (!block) {
       return;
    }
    
    void (^executedBlock)(BOOL) = (void(^)(BOOL))block;
    executedBlock(YES);
}


//SMDelayedBlockHandle perform_block_after_delay(CGFloat seconds, dispatch_block_t block) {
//    
//    if (nil == block) {
//        return nil;
//    }
//    
//    // block is likely a literal defined on the stack, even though we are using __block to allow us to modify the variable
//    // we still need to move the block to the heap with a copy
//    __block dispatch_block_t blockToExecute = [block copy];
//    __block SMDelayedBlockHandle delayHandleCopy = nil;
//    
//    SMDelayedBlockHandle delayHandle = ^(BOOL cancel){
//        if (NO == cancel && nil != blockToExecute) {
//            dispatch_async(dispatch_get_main_queue(), blockToExecute);
//        }
//        
//        // Once the handle block is executed, canceled or not, we free blockToExecute and the handle.
//        // Doing this here means that if the block is canceled, we aren't holding onto retained objects for any longer than necessary.
//#if !__has_feature(objc_arc)
//        [blockToExecute release];
//        [delayHandleCopy release];
//#endif
//        
//        blockToExecute = nil;
//        delayHandleCopy = nil;
//    };
//    
//    // delayHandle also needs to be moved to the heap.
//    delayHandleCopy = [delayHandle copy];
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//        if (nil != delayHandleCopy) {
//            delayHandleCopy(NO);
//        }
//    });
//    
//    return delayHandleCopy;
//};
//
//void cancel_delayed_block(SMDelayedBlockHandle delayedHandle) {
//    if (nil == delayedHandle) {
//        return;
//    }
//    
//    delayedHandle(YES);
//}

