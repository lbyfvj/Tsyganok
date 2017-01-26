//
//  main.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <ITSources/ITSources.h>

#import "ITCarWash.h"
#import "ITCar.h"
#import "ITWasher.h"
#import "ITEmployee.h"
#import "ITDirector.h"
#import "ITAccountant.h"

NSUInteger const kITCarsQuantity = 100;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *cars = [NSArray objectsWithCount:kITCarsQuantity block:^id{
            return [ITCar object];
        }];
        
        ITCarWash *carWash = [ITCarWash object];
        
        [carWash performSelectorInBackground:@selector(washCars:) withObject:cars];
        
        [[NSRunLoop mainRunLoop] run];
    }
    
    return 0;
}
