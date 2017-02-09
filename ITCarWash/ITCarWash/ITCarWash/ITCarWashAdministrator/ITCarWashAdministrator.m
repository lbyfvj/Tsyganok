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
static NSTimeInterval const kITCarProceedInterval = 0.5;

@interface ITCarWashAdministrator ()
@property (nonatomic, retain)   ITCarWash   *carWash;
//@property (nonatomic, retain)   NSTimer     *timer;
@property (nonatomic, assign)   NSUInteger  washedCars;

//- (void)proceed:(NSTimer *)timer;

@end

@implementation ITCarWashAdministrator

//@dynamic running;

#pragma mark -
#pragma mark Initializations and dellocations

- (void)dealloc {
//    self.timer = nil;
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

//- (void)setTimer:(NSTimer *)timer {
//    if (timer != _timer) {
//        [_timer invalidate];        
//        [_timer release];
//        _timer = [timer retain];
//    }
//}
//
//- (BOOL)isRunning {
//    return [self.timer isValid];
//}

#pragma mark -
#pragma mark Private

//- (void)proceed:(NSTimer *)timer {    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
//        NSUInteger carsInPack = MIN(kITDefaultCarsPack, kITCarsQuantity - self.washedCars);
//        NSArray *cars = [NSArray objectsWithCount:carsInPack block:^id{
//            return [ITCar object];
//        }];
//        
//        if (cars.count > 0) {
//            [self.carWash washCars:cars];
//        } else {
//            [self stopTimer];
//        }
//        
//        self.washedCars += carsInPack;
//    });
//}

- (void)beginProcess {
    //dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        NSUInteger carsInPack = MIN(kITDefaultCarsPack, kITCarsQuantity - self.washedCars);
        NSArray *cars = [NSArray objectsWithCount:carsInPack block:^id{
            return [ITCar object];
        }];
        
        if (cars.count > 0) {
            [self.carWash washCars:cars];
        }
        
        self.washedCars += carsInPack;
    //});
}

#pragma mark -
#pragma mark Public

//- (void)startTimer {
//    if (!self.timer) {
//        self.timer = [NSTimer scheduledTimerWithTimeInterval:kITCarProceedInterval
//                                                      target:self
//                                                    selector:@selector(proceed:)
//                                                    userInfo:nil
//                                                     repeats:YES];
//    }
//}

- (void)start {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kITCarProceedInterval * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        [self beginProcess];
        [self start];
    });
}

//- (void)stopTimer {
//    NSTimer *timer = self.timer;
//    if (timer && [timer isValid]) {
//        [timer invalidate];
//    }
//    
//    self.timer = nil;
//}


@end
