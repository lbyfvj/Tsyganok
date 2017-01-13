//
//  ITQueue.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 13.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITQueue.h"

@interface ITQueue ()
@property (nonatomic, retain)   NSMutableArray  *mutableQueue;

@end

@implementation ITQueue

@dynamic queue;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableQueue = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)queue {
    @synchronized (self) {
        return [[self.mutableQueue copy] autorelease];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)addObjectToQueue:(id)object {
    @synchronized(self) {
        [self.mutableQueue addObject:object];
    }
}

- (void)removeObjectFromQueue:(id)object {
    @synchronized(self) {
        NSMutableArray *array = self.mutableQueue;
        id result = [[[array firstObject] retain] autorelease];
        [array removeObject:result];
    }
}

- (void)performInBackground:(id)object {
    
}

- (void)performOnMainThread:(id)object {
    
}

@end
