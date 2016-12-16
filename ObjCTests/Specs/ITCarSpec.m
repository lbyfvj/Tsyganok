//
//  ITCarSpec.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 16.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "Kiwi.h"

#import "ITCar.h"
#import "ITCarWash.h"

SPEC_BEGIN(ITCarSpec)

describe(@"ITCar", ^{
    
    __block ITCar *car = nil;
    
    beforeAll(^{
        [ITCar new];
    });
    
    context(@"when observing with ITCarWash", ^{
        
        __block ITCarWash *observer = nil;
        
        beforeAll(^{
            observer = [ITCarWash new];
            observer.car = car;
        });
        
        context(@"ITCar observing", ^{
            it(@"observer should receive carDidBecomeDirty", ^ {
                car.state = 0;
                
                [[observer should] receive:@selector(carDidBecomeDirty:)];
                
                car.state = 1;
            });
            
            it(@"observer should receive carDidBecomeClean", ^ {
                car.state = 1;
                
                [[observer should] receive:@selector(carDidBecomeClean:)];
                
                car.state = 0;
            });
            
            it(@"observer shouldn't change state when receive carDidBecomeDirty", ^ {
                car.state = 0;
                
                [[observer should] receive:@selector(carDidBecomeDirty:)];
                
                car.state = 0;
            });
            
            it(@"observer shouldn't change state when receive carDidBecomeClean", ^ {
                car.state = 1;
                
                [[observer should] receive:@selector(carDidBecomeClean:)];
                
                car.state = 1;
            });
        });
    });
});

SPEC_END
