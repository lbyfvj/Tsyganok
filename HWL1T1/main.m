//
//  main.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 27.11.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Human.h"

int main(int argc, const char * argv[]) {

    NSMutableArray *humansArray = [[NSMutableArray alloc] initWithCapacity:40];
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    Human *human = [[[Human alloc]initWithName:@"Ivan" andGender:@"Male" andAge:32 andWeight:65] init];
    Human *child = [[[Human alloc]initWithName:@"Baby1" andGender:@"Female" andAge:18 andWeight:50] init];
    Human *childOfChild1 = [[[Human alloc]initWithName:@"ChildOfBaby1" andGender:@"Female" andAge:1 andWeight:5] init];
    [human addChild:child];
    [child addChild:childOfChild1];
    [humansArray addObject:human];
    
    [human sayFamilyHello:human];
    

    for (int i = 0; i < humansArray.count; i++) {
        Human *human = [humansArray objectAtIndex:i];
        if ([human.humanGender  isEqual: @"Male"]) {
            [human fight];
        } else if ([human.humanGender  isEqual: @"Female"]) {
            [human giveBirth];
        }
    }
    
    [pool drain];
    return 0;
}



