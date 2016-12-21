//
//  ITObservableObject.h
//  ITSources
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITObservableObject : NSObject
@property (nonatomic, readonly) NSSet   *observersSet;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (BOOL)containsObserver:(id)observer;
- (SEL)selectorForState:(NSUInteger)state;

@end
