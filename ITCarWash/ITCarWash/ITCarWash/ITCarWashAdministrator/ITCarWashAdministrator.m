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
static NSTimeInterval const kITCarProcceedInterval = 2;

@interface ITCarWashAdministrator ()
@property (nonatomic, retain)   ITCarWash   *carWash;
@property (nonatomic, retain)   NSTimer     *timer;
@property (nonatomic, retain)   NSArray     *cars;

- (void)procceed:(NSTimer *)timer;

@end

@implementation ITCarWashAdministrator

#pragma mark -
#pragma mark Initializations and dellocations

- (void)dealloc {
    self.timer = nil;
    self.carWash = nil;
    self.cars = nil;
    
    [super dealloc];
}

- (instancetype)init
{
    self = [super init];
    self.carWash = [ITCarWash object];
    self.cars = [NSArray objectsWithCount:kITCarsQuantity block:^id{
        return [ITCar object];
    }];
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)procceed:(NSTimer *)timer {
    [self.carWash washCars:self.cars];
}

#pragma mark -
#pragma mark Public

- (void)startTimer {
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:kITCarProcceedInterval
                                                      target:self
                                                    selector:@selector(procceed:)
                                                    userInfo:nil
                                                     repeats:YES];
    }
}

- (void)stopTimer {
    NSTimer *timer = self.timer;
    if (timer && [timer isValid]) {
        [timer invalidate];
    }
    
    self.timer = nil;
}


@end
