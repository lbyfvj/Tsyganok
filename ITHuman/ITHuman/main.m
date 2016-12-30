//
//  main.m
//  ITHuman
//
//  Created by Ivan Tsyganok on 17.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ITSources/ITSources.h>

#import "ITMan.h"
#import "ITWoman.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *humansArray = [NSMutableArray array];
        
        NSArray *mensArray = [ITMan objectsWithCount:4];
        NSArray *womensArray = [ITWoman objectsWithCount:4];
        
        for (id women in womensArray) {
            [humansArray addObject:women];
        }
        
        for (id man in mensArray) {
            [humansArray addObject:man];
        }
        
        for (ITHuman *human in humansArray) {
            [human performGenderSpecificOperation];
        }
        
        ITHuman *human = [ITMan object];
        ITHuman *child1 = [ITWoman object];
        ITHuman *childOfChild1 = [ITMan object];
        
        [child1 addChild:childOfChild1];
        [human addChild:child1];
        
        [human sayHello];
    }
    return 0;
}
