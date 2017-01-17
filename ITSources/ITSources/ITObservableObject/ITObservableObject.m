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
    //return self.observersHashTable.setRepresentation;
}

#pragma mark -
#pragma mark Public Methods

- (void)addObserver:(id)observer {
    id observersHashTable = self.observersHashTable;
    @synchronized (observersHashTable) {
        [observersHashTable addObject:observer];
    }
    //[self.observersHashTable addObject:observer];
}

- (void)removeObserver:(id)observer {
    id observersHashTable = self.observersHashTable;
    @synchronized (observersHashTable) {
        [observersHashTable removeObject:observer];
    }
    //[self.observersHashTable removeObject:observer];
}

- (BOOL)containsObserver:(id)observer {
    return [self.observersHashTable containsObject:observer];
    
}

- (SEL)selectorForState:(NSUInteger)state {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

#pragma mark -
#pragma mark Private Methods

- (void)notifyWithSelector:(SEL)selector {
    NSHashTable *observers = self.observersHashTable;
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self];
        }
    }
}


- (void)notifyObserversWithSelector:(SEL)selector {
    NSArray *observers = [self observers];
    for (id <NSObject> observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self];
        }
    }
}

- (void)notifyObserversOnMainThreadWithSelector:(SEL)selector {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self notifyObserversWithSelector:selector];
    });
}

- (void)notifyObserversWithSelector:(SEL)selector andObject:(id)object {
    NSArray *observers = [self observers];
    for (id <NSObject> observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self withObject:object];
        }
    }
    
}

@end
