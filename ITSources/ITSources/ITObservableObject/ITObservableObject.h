//
//  ITObservableObject.h
//  ITSources
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITObservableObject : NSObject
@property (nonatomic, assign)   NSUInteger  state;
@property (nonatomic, readonly) NSSet       *observersSet;

- (void)addObserver:(id)observer;

- (void)removeObserver:(id)observer;

- (BOOL)containsObserver:(id)observer;

- (SEL)selectorForState:(NSUInteger)state;

- (void)setState:(NSUInteger)state object:(id)object;

- (void)notifyOfState:(NSUInteger)state;
- (void)notifyOfState:(NSUInteger)state object:(id)object;

- (void)notifyOfStateWithSelector:(SEL)selector;
- (void)notifyOfStateWithSelector:(SEL)selector object:(id)object;

@end
