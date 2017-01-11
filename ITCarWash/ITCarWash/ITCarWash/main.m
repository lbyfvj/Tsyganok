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

NSUInteger const kInitialCarMoney = 1;
NSUInteger const kCarsQuantity = 50;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ITCarWash *carWash = [ITCarWash object];
        [carWash initialSetup];
        
        NSMutableArray *cars = [NSMutableArray array];
        for (NSUInteger i = 0; i < kCarsQuantity; i++) {
            ITCar *car = [ITCar object];
            car.money = kInitialCarMoney;
            [cars addObject:car];
        }
        
        [carWash washCars:cars];
        
        for (ITDirector *director in [carWash employeeOfClass:[ITDirector class]]) {
            NSLog(@"CarWash profit: %lu", (unsigned long)director.money);
        }
        
        cars = nil;
        carWash = nil;
        
    }
    
    return 0;
}
