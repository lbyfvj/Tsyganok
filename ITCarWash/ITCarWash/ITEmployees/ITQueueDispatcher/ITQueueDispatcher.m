//
//  ITQueueDispatcher.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 19.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITQueueDispatcher.h"

@interface ITQueueDispatcher ()
@property (nonatomic, retain)   NSMutableArray  *mutableDispatchers;
@property (nonatomic, retain)   NSMutableArray  *mutableQueue;

@end

@implementation ITQueueDispatcher

@synthesize mutableDispatchers = _mutableDispatchers;
@synthesize mutableQueue  = _mutableQueue;

@dynamic dispatchers;
@dynamic queue;

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableDispatchers = nil;
    self.mutableQueue = nil;
    
    [super dealloc];
}

- (id)init {
    self = [super init];
    if (self) {
        self.mutableDispatchers = [NSMutableArray array];
        self.mutableQueue = [NSMutableArray array];
    }
    return self;
}

#pragma mark-
#pragma mark Accessors

- (NSArray *)queue {
    id queue = self.mutableQueue;
    @synchronized (queue) {
        return [[queue copy] autorelease];
    }
}

- (NSArray *)dispatchers {
    id dispatchers = self.mutableDispatchers;
    @synchronized (dispatchers) {
        return [[dispatchers copy] autorelease];
    }
}

#pragma mark-
#pragma mark Public Methods

- (void)addDispatcher:(id <ITEmployeeStatus>)object {
    id dispatchers = self.mutableDispatchers;
    @synchronized (dispatchers) {
        [dispatchers addObject:object];
    }
}

- (void)removeDispatcher:(id <ITEmployeeStatus>)object {
    id dispatchers = self.mutableDispatchers;
    @synchronized (dispatchers) {
        [dispatchers removeObject:object];
    }
}

#pragma mark-
#pragma mark Private Methods

- (id)availableDispatcher {
   	@synchronized (self) {
        for (id object in self.dispatchers) {
            if (![object busy]) {
                
                return object;
            }
        }
        
        return nil;
    }
}

- (void)addToQueue:(id)object {
    id queue = self.mutableQueue;
    @synchronized (queue) {
        [queue addObject:object];
    }
}

- (void)removeFromQueue:(id)object {
    id queue = self.mutableQueue;
    @synchronized (queue) {
        [queue removeObject:object];
    }
}

#pragma mark-
#pragma mark ITEmployeeObservable Protocol

- (void)processObject:(id)object {
    @synchronized (self) {
        if ([self availableDispatcher] == nil) {
            [self addToQueue:object];
        } else {
            [self.availableDispatcher processObject:object];
        }
    }
}

- (void)employeeReadyToWork:(id)object {
    @synchronized (self) {
        NSArray *queue = self.queue;
        id object = [queue firstObject];
        [self removeFromQueue:object];
        [self processObject:object];
    }
}

@end
