//
//  ITCarWash.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITCarWash.h"

@interface ITCarWash ()

- (void)hireWashers;
- (void)hireAccountant;
- (void)hireDirector;

@end

@implementation ITCarWash

#pragma mark -
#pragma mark - Initialization and Deallocation

- (void)dealloc {
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    return self;
}

#pragma mark -
#pragma mark - Accessors

//- (void)setCar:(ITCar *)car {
//    if (_car != car) {
//        [_car removeObserver:self];
//
//        [_car release];
//        _car = [_car retain];
//
//        [car addObserver:self];
//    }
//}

#pragma mark -
#pragma mark - Private

- (void)hireWashers {
    
}

- (void)hireAccountant {
    
}

- (void)hireDirector {
    
}

#pragma mark -
#pragma mark - Public

- (void)hireEmployees:(ITEmployee *)employee {
    //[self.mutableStaff addObject:employee];
}


@end
