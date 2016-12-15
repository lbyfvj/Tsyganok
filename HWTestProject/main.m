//
//  main.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 27.11.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ITMen.h"
#import "ITWomen.h"

#import "NSObject+Category.h"
#import "NSString+ITExtensions.h"
#import "ITCharacters.h"

#import "ITCarWash.h"
#import "ITCar.h"

int main(int argc, const char * argv[]) {

    @autoreleasepool {
        
        ////////HWTask1 Implementation
        NSMutableArray *humansArray = [[NSMutableArray alloc] initWithCapacity:40];
        ITHuman *human = [[[ITHuman alloc]initWithName:@"Ivan" gender:Male age:32 weight:65] init];
        ITHuman *human1 = [[[ITHuman alloc]initWithName:@"Lena" gender:Female age:32 weight:60] init];
        ITHuman *child = [[[ITHuman alloc]initWithName:@"Baby1" gender:Female age:18 weight:50] init];
        ITHuman *childOfChild1 = [[[ITHuman alloc]initWithName:@"ChildOfBaby1" gender:Female age:1 weight:5] init];
        
        [human addChild:child];
        
        [child addChild:childOfChild1];
        [child removeChild:childOfChild1];
        [humansArray addObject:human];
        [humansArray addObject:human1];
        [human sayHello];
        
        for (int i = 0; i < humansArray.count; i++) {
            ITHuman *human = [humansArray objectAtIndex:i];
            if (human.gender == Male) {
                [human fight];
            } else if (human.gender == Female) {
                [human giveBirth];
            }
        }
        
        ////////HWTask2 Implementation
        
        NSMutableArray *peoplesArray = [[NSMutableArray alloc] initWithCapacity:40];
        ITMen *men = [[ITMen alloc] initWithName:@"Gray" gender:Male age:18 weight:65];
        ITWomen *women = [[ITWomen alloc] initWithName:@"Gray" gender:Female age:17 weight:55];
        
        //Init with object method from NSObject category
        ITMen *superman = [ITMen object];
        [superman initWithName:@"Superman" gender:Male age:7 weight:34];
        
        [humansArray addObject:men];
        [humansArray addObject:women];
        [humansArray addObject:superman];
        
        for (ITHuman *person in peoplesArray){
            [person performGenderSpecificOperation];
        }
        
        /////////HWTask4 Implementation
        
        NSLog(@"%@", [NSString randomString]);
        NSLog(@"%@", [NSString randomStringWithLenght:10]);
        NSLog(@"%@", [NSString randomStringWithLenght:40 ofCharacters:[ITCharacters characters]]);
        
        /////////CarWash initialization
        
        ITCar *mazda = [[ITCar alloc] initWithName:@"Mazda3" state:Dirty];        
        ITCarWash *carWash = [ITCarWash object];
        ITWasher *washer = [ITWasher object];
        [washer performWorkWithObject:mazda];
        
    
    }

    return 0;
}





