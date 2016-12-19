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

#import "NSObject+ITObject.h"
#import "NSString+ITExtensions.h"
#import "ITCharacters.h"

#import "ITCarWash.h"
#import "ITCar.h"
#import "ITWasher.h"
#import "ITAccountant.h"

int main(int argc, const char * argv[]) {

    @autoreleasepool {
        
//        ////////HWTask1 Implementation
//        NSMutableArray *humansArray = [[NSMutableArray alloc] initWithCapacity:40];
//        ITHuman *human = [[[ITHuman alloc]initWithName:@"Ivan" gender:ITMale age:32 weight:65] init];
//        ITHuman *human1 = [[[ITHuman alloc]initWithName:@"Lena" gender:ITFemale age:32 weight:60] init];
//        ITHuman *child = [[[ITHuman alloc]initWithName:@"Baby1" gender:ITFemale age:18 weight:50] init];
//        ITHuman *childOfChild1 = [[[ITHuman alloc]initWithName:@"ChildOfBaby1" gender:ITFemale age:1 weight:5] init];
//        
//        [human addChild:child];
//        
//        [child addChild:childOfChild1];
//        [child removeChild:childOfChild1];
//        [humansArray addObject:human];
//        [humansArray addObject:human1];
//        [human sayHello];
//        
//        for (int i = 0; i < humansArray.count; i++) {
//            ITHuman *human = [humansArray objectAtIndex:i];
//            if (human.gender == ITMale) {
//                [human fight];
//            } else if (human.gender == ITFemale) {
//                [human giveBirth];
//            }
//        }
//        
//        ////////HWTask2 Implementation
//        
//        NSMutableArray *peoplesArray = [[NSMutableArray alloc] initWithCapacity:40];
//        ITMen *men = [[ITMen alloc] initWithName:@"Gray" gender:ITMale age:18 weight:65];
//        ITWomen *women = [[ITWomen alloc] initWithName:@"Gray" gender:ITFemale age:17 weight:55];
//        
//        //Init with object method from NSObject category
//        ITMen *superman = [ITMen object];
//        [superman initWithName:@"Superman" gender:ITMale age:7 weight:34];
//        
//        [humansArray addObject:men];
//        [humansArray addObject:women];
//        [humansArray addObject:superman];
//        
//        for (ITHuman *person in peoplesArray){
//            [person performGenderSpecificOperation];
//        }
//        
//        ITHuman *human = [ITHuman object];
//        human.name = @"Ivan";
//        human.age = 32;
//        human.gender = ITMale;
//        human.weight = 65;
//        ITHuman *child = [ITHuman object];
//        child.name = @"Baby";
//        child.age = 5;
//        child.gender = ITFemale;
//        child.weight = 20;
//        ITHuman *child1 = [ITHuman object];
//        child1.name = @"BabyOfBaby";
//        child1.age = 5;
//        child1.gender = ITMale;
//        child1.weight = 20;
//        [human addChild:child];
//        [child addChild:child1];
//        [human sayHello];
//        
//        /////////HWTask4 Implementation
//        
//        NSLog(@"%@", [NSString randomString]);
//        NSLog(@"%@", [NSString randomStringWithLenght:10]);
//        NSLog(@"%@", [NSString randomStringWithLenght:40 ofCharacters:[ITCharacters characters]]);
        
        ITCar *car = [ITCar object];
        ITWasher *washer = [ITWasher object];
        ITAccountant *accountant = [ITAccountant object];
    
        [washer performWorkWithObject:car];
        [accountant performWorkWithObject:washer];
        
    }

    return 0;
}





