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
        
        for (NSUInteger i = 0; i < 3; i++) {
            NSString *capitalizedLetter = [NSString randomStringWithLenght:1 ofCharacters:[ITCharacters capitalizedCharacters]];
            NSString *humanName = [capitalizedLetter stringByAppendingString:[NSString randomStringWithLenght:5 ofCharacters:[ITCharacters lowercaseCharacters]]];
            
            ITHuman *human = [ITHuman object];
            human.name = humanName;
            human.age = arc4random_uniform(100);
            human.gender = arc4random_uniform(2);
            human.weight = arc4random_uniform(80);
            [humansArray addObject:human];
        }
        
        for (ITHuman *human in humansArray) {
            switch (human.gender) {
                case ITFemale:
                    [human giveBirth];
                case ITMale:
                    [human goFight];
            }
        }
        
        ITHuman *human = [ITHuman object];
        NSString *capitalizedLetter = [NSString randomStringWithLenght:1 ofCharacters:[ITCharacters capitalizedCharacters]];
        
        human.name = [capitalizedLetter stringByAppendingString:[NSString randomStringWithLenght:5 ofCharacters:[ITCharacters lowercaseCharacters]]];
        human.age = 32;
        human.gender = arc4random_uniform(2);
        human.weight = 65;
        ITHuman *child = [ITHuman object];
        child.name = [[NSString randomStringWithLenght:1 ofCharacters:[ITCharacters capitalizedCharacters]] stringByAppendingString:[capitalizedLetter stringByAppendingString:[NSString randomStringWithLenght:5 ofCharacters:[ITCharacters lowercaseCharacters]]]];
        child.age = 5;
        child.gender = arc4random_uniform(2);
        child.weight = 20;
        ITHuman *child1 = [ITHuman object];
        child1.name = [[NSString randomStringWithLenght:1 ofCharacters:[ITCharacters capitalizedCharacters]] stringByAppendingString:[capitalizedLetter stringByAppendingString:[NSString randomStringWithLenght:5 ofCharacters:[ITCharacters lowercaseCharacters]]]];
        child1.age = 5;
        child1.gender = arc4random_uniform(2);
        child1.weight = 20;
        [human addChild:child];
        [child addChild:child1];
        [human sayHello];
    }
    return 0;
}
