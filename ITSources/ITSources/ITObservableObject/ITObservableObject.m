//
//  ITObservableObject.m
//  ITSources
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITObservableObject.h"

@interface ITObservableObject ()
@property (nonatomic, retain) NSHashTable   *observersHashTable;

- (void)notifyOfStateWithSelector:(SEL)selector;
- (void)notifyOfStateWithSelector:(SEL)selector object:(id)object;

@end

@implementation ITObservableObject

@dynamic observersSet;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.observersHashTable = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.observersHashTable = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)observersSet {
    id observersHashTable = self.observersHashTable;
    @synchronized (observersHashTable) {
        
        return [observersHashTable setRepresentation];
    }
}

- (void)setState:(NSUInteger)state {
    [self setState:state object:nil];
}

- (void)setState:(NSUInteger)state object:(id)object {
    @synchronized(self) {
        if (state != _state) {
            _state = state;
            [self notifyOfState:_state object:object];
        }
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)addObserver:(id)observer {
    id observersHashTable = self.observersHashTable;
    @synchronized (observersHashTable) {
        [observersHashTable addObject:observer];
    }
}

- (void)removeObserver:(id)observer {
    id observersHashTable = self.observersHashTable;
    @synchronized (observersHashTable) {
        [observersHashTable removeObject:observer];
    }
}

- (BOOL)containsObserver:(id)observer {
    NSHashTable *observers = self.observersHashTable;
    @synchronized (observers) {
        
        return [observers containsObject:observer];
    }
}

- (SEL)selectorForState:(NSUInteger)state {
    
    return nil;
}

#pragma mark -
#pragma mark Private Methods

- (void)notifyOfStateChangeWithSelector:(SEL)selector {
    [self notifyOfStateChangeWithSelector:selector object:nil];
}

- (void)notifyOfState:(NSUInteger)state {
    [self notifyOfState:state object:nil];
}

- (void)notifyOfState:(NSUInteger)state object:(id)object {
    [self notifyOfStateChangeWithSelector:[self selectorForState:state] object:object];
}

- (void)notifyOfStateChangeWithSelector:(SEL)selector object:(id)object {
    NSHashTable *observers = self.observersHashTable;
    @synchronized(observers) {
        for (id observer in observers) {
            if ([observer respondsToSelector:selector]) {
                [observer performSelector:selector withObject:self withObject:object];
            }
        }
    }
}

@end
