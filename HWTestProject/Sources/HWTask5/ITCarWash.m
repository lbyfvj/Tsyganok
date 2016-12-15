//
//  ITCarWash.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 15.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITCarWash.h"

@interface ITCarWash ()
@property (nonatomic, assign) NSMutableArray *employees;

@end

@implementation ITCarWash

- (instancetype)init {
    self = [super init];
    
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (NSArray *)stuff {
    return [[[self employees] copy] autorelease];
}

- (void)hireStuff:(ITEmployee *)employee {
    [[self employees] addObject:employee];
}

- (void)fireStuff:(ITEmployee *)employee {
    for (NSUInteger i = 0; i < self.employees.count; i++) {
        [self.employees removeObject:employee];
    }
}

- (void)performWork {
    
}

@end
