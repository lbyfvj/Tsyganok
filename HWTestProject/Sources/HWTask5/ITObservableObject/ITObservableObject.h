//
//  ITObservableObject.h
//  HWL1T1
//
//  Created by Ivan Tsyganok on 16.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITObservableObject : NSObject
@property (nonatomic, assign)   NSUInteger  state;
@property (nonatomic, readonly) NSSet       *observerSet;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (BOOL)isObserverByObject:(id)observer;

//This method is intended for subclassing. Never call it directly.
- (SEL)selectorForState:(NSUInteger)state;

@end
