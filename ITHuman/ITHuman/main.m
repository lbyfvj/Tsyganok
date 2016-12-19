//
//  main.m
//  ITHuman
//
//  Created by Ivan Tsyganok on 17.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ITMan.h"
#import "ITWoman.h"
#import <ITSources/NSObject+ITObject.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ITHuman *human = [ITHuman object];
        human.name = @"Ivan";
        human.age = 32;
        human.gender = ITMale;
        human.weight = 65;
        ITHuman *child = [ITHuman object];
        child.name = @"Baby";
        child.age = 5;
        child.gender = ITFemale;
        child.weight = 20;
        ITHuman *child1 = [ITHuman object];
        child1.name = @"BabyOfBaby";
        child1.age = 5;
        child1.gender = ITMale;
        child1.weight = 20;
        [human addChild:child];
        [child addChild:child1];
        [human sayHello];
    }
    return 0;
}
