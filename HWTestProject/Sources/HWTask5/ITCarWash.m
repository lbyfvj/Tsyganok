//
//  ITCarWash.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 15.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITCarWash.h"

@interface ITCarWash ()
@property (nonatomic, assign) NSMutableArray *mutableStaff;

@end

@implementation ITCarWash

@dynamic staff;

#pragma mark -
#pragma mark - Initialization and Deallocation

- (void)dealloc {
    self.mutableStaff = nil;
    self.car = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableStaff = [[NSMutableArray new] autorelease];
    
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

- (NSArray *)staff {
    return [[[self mutableStaff] copy] autorelease];
}

- (void)hireStaff:(ITEmployee *)employee {
    [self.mutableStaff addObject:employee];
}

#pragma mark -
#pragma mark - ITCarObserver

- (void)carDidBecomeClean:(ITCar *)car {
    if (self.car == car) {
        NSLog(@"Car %@ is clean", car);
    }
}

- (void)carDidBecomeDirty:(ITCar *)car {
    if (self.car == car) {
        NSLog(@"Car %@ is dirty", car);
    }
}

@end
