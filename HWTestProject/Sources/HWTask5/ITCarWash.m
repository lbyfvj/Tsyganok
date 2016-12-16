//
//  ITCarWash.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 15.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITCarWash.h"

@interface ITCarWash ()
@property (nonatomic, assign) NSMutableArray *mutableStuff;

@end

@implementation ITCarWash

@dynamic stuff;

- (void)dealloc {
    self.mutableStuff = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    self.mutableStuff = [[NSMutableArray new] autorelease];
    
    return self;
}

- (void)carDidBecomeClean:(ITCar *)car {
    NSLog(@"Car %@ is clean", car);
}

- (void)carDidBecomeDirty:(ITCar *)car {
    NSLog(@"Car %@ is dirty", car);
}

- (NSArray *)stuff {
    return [[[self mutableStuff] copy] autorelease];
}

- (void)hireStuff:(ITEmployee *)employee {
    [[self mutableStuff] addObject:employee];
}

- (void)fireStuff:(ITEmployee *)employee {
    for (NSUInteger i = 0; i < self.mutableStuff.count; i++) {
        [self.mutableStuff removeObject:employee];
    }
}

- (void)performWork {
    
}

@end
