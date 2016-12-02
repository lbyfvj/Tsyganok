//
//  main.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 27.11.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Human.h"
#import "Men.h"
#import "Women.h"
#import "NSObject+Category.h"

int main(int argc, const char * argv[]) {

    
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    ////////HWTask1 Implementation
    NSMutableArray *humansArray = [[NSMutableArray alloc] initWithCapacity:40];
    Human *human = [[[Human alloc]initWithName:@"Ivan" andGender:@"Male" andAge:32 andWeight:65] init];
    Human *human1 = [[[Human alloc]initWithName:@"Lena" andGender:@"Female" andAge:32 andWeight:60] init];
    Human *child = [[[Human alloc]initWithName:@"Baby1" andGender:@"Female" andAge:18 andWeight:50] init];
    Human *childOfChild1 = [[[Human alloc]initWithName:@"ChildOfBaby1" andGender:@"Female" andAge:1 andWeight:5] init];
    [human addChild:child];
    [child addChild:childOfChild1];
    [humansArray addObject:human];
    [humansArray addObject:human1];
    [human sayFamilyHello:human];
    

    for (int i = 0; i < humansArray.count; i++) {
        Human *human = [humansArray objectAtIndex:i];
        if ([human.humanGender  isEqual: @"Male"]) {
            [human fight];
        } else if ([human.humanGender  isEqual: @"Female"]) {
            [human giveBirth];
        }
    }
    
    ////////HWTask2 Implementation
    
    NSMutableArray *peoplesArray = [[NSMutableArray alloc] initWithCapacity:40];
    Men *men = [[[Men alloc]initWithName:@"Gray"] init];
    Women *women = [[[Women alloc]initWithName:@"Maredit"] init];
    
    //Init with object method from NSObject category
    Men *superman = [Men object];
    [superman initWithName:@"Superman"];
    
    [humansArray addObject:men];
    [humansArray addObject:women];
    [humansArray addObject:superman];
    
    for (Human *person in peoplesArray){
        [person performGenderSpecificOperation];
    }
    
    [pool drain];
    return 0;
}



