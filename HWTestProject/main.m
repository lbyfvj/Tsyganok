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
#import "NSString+ITExtensions.h"

int main(int argc, const char * argv[]) {

    @autoreleasepool {
        
        ////////HWTask1 Implementation
        NSMutableArray *humansArray = [[NSMutableArray alloc] initWithCapacity:40];
        Human *human = [[[Human alloc]initWithName:@"Ivan" gender:Male age:32 weight:65] init];
        Human *human1 = [[[Human alloc]initWithName:@"Lena" gender:Female age:32 weight:60] init];
        Human *child = [[[Human alloc]initWithName:@"Baby1" gender:Female age:18 weight:50] init];
        Human *childOfChild1 = [[[Human alloc]initWithName:@"ChildOfBaby1" gender:Female age:1 weight:5] init];
        
        [human addChild:child];
        
        [child addChild:childOfChild1];
        [child removeChild:childOfChild1];
        [humansArray addObject:human];
        [humansArray addObject:human1];
        [human sayHello];
        
        for (int i = 0; i < humansArray.count; i++) {
            Human *human = [humansArray objectAtIndex:i];
            if (human.gender == Male) {
                [human fight];
            } else if (human.gender == Female) {
                [human giveBirth];
            }
        }
        
        ////////HWTask2 Implementation
        
        NSMutableArray *peoplesArray = [[NSMutableArray alloc] initWithCapacity:40];
        Men *men = [[Men alloc] initWithName:@"Gray" gender:Male age:18 weight:65];
        Women *women = [[Women alloc] initWithName:@"Gray" gender:Female age:17 weight:55];
        
        //Init with object method from NSObject category
        Men *superman = [Men object];
        [superman initWithName:@"Superman" gender:Male age:7 weight:34];
        
        [humansArray addObject:men];
        [humansArray addObject:women];
        [humansArray addObject:superman];
        
        for (Human *person in peoplesArray){
            [person performGenderSpecificOperation];
        }
        
        /////////HWTask4 Implementation
        
        NSLog(@"%@", [NSString randomString]);
        NSLog(@"%@", [NSString randomStringWithLenght:10]);
        NSLog(@"%@", [NSString randomStringWithLenght:40 ofCharacters:[NSString characters]]);
        NSLog(@"%@", [NSString randomStringWithLenght:5 ofCharacters:[NSString numericCharacters]]);
        NSLog(@"%@", [NSString numericCharacters]);
        NSLog(@"%@", [NSString randomStringWithLenght:5 ofCharacters:[NSString symbolCharacters]]);
    }

    return 0;
}





