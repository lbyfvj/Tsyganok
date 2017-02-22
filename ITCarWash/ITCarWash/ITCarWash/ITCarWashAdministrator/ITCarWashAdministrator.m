//
//  ITCarWashAdministrator.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 01.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITCarWashAdministrator.h"

#import <ITSources/ITSources.h>

#import "ITCarWash.h"

static NSUInteger const kITCarsQuantity = 100;
static NSUInteger const kITDefaultCarsPack = 4;
static NSTimeInterval const kITCarProceedInterval = 2;

@interface ITCarWashAdministrator ()
@property (nonatomic, retain)   ITCarWash   *carWash;
@property (nonatomic, assign)   NSUInteger  washedCars;

- (void)beginCarWashProcess;

@end

@implementation ITCarWashAdministrator

@synthesize running = _running;

#pragma mark -
#pragma mark Initializations and dellocations

- (void)dealloc {
    self.carWash = nil;
    
    [super dealloc];
}

- (instancetype)init
{
    self = [super init];
    self.carWash = [ITCarWash object];
    self.washedCars = 0;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (BOOL)running {
    return _running;
}
- (void)setRunning:(BOOL)newValue {
    _running = newValue;
}

#pragma mark -
#pragma mark Private

- (void)beginCarWashProcess {
        ITAsyncPerformInBackgroundQueue(^{
            NSUInteger carsInPack = MIN(kITDefaultCarsPack, kITCarsQuantity - self.washedCars);
            NSArray *cars = [ITCar objectsWithCount:carsInPack];
            
            if (cars.count > 0) {
                self.running = YES;
                [self.carWash washCars:cars];
            } else {
                self.running = NO;
                return;
            }
            
            self.washedCars += carsInPack;
        });
}

#pragma mark -
#pragma mark Public

- (void)start {
    ITDispatchAfter(kITCarProceedInterval, ITDispatchQueueBackgroundPriority, ^{
        [self beginCarWashProcess];
        if (self.running) {
            [self start];
        }
    });
}

@end
