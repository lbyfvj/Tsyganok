//
//  ITObservableObject.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 16.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITObservableObject.h"

@interface ITObservableObject ()
@property (nonatomic, retain) NSMutableSet *mutableObserverSet;

- (void)notifyOfStateChangeWithSelector:(SEL)selector;
- (SEL)selectorForState:(NSUInteger)state;

@end

@implementation ITObservableObject

@dynamic observerSet;

#pragma mark -
#pragma mark - Initialization and Deallocation

- (void)dealloc {
    self.mutableObserverSet = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    self.mutableObserverSet = [[NSMutableSet new] autorelease];
    
    return self;
}

#pragma mark -
#pragma mark - Accessors

- (NSSet *)observerSet {
    return [[[self mutableObserverSet] copy] autorelease];
}

- (void)setState:(NSUInteger)state {
    if (state != _state) {
        state = _state;
        
        [self notifyOfStateChangeWithSelector:[self selectorForState:state]];
    }
}

#pragma mark -
#pragma mark - Private

- (SEL)selectorForState:(NSUInteger)state {
    [self doesNotRecognizeSelector:_cmd];
    
    return NULL;
}

- (void)notifyOfStateChangeWithSelector:(SEL)selector {
    NSMutableSet *observers = self.mutableObserverSet;
    for (id observer in observers) {
        if ([observers respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self];
        }
    }
}

@end
