//
//  Human.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 27.11.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "Human.h"

@implementation Human

@synthesize humanName, humanGender, humanAge, humanWeight, childrenArray;

-(id)init{
    self = [super init];
    if(self){
        childrenArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (id)initWithName:(NSString *)name andGender:(NSString *)gender andAge:(int)age andWeight:(double)weight{
    humanName = name;
    humanGender = gender;
    humanAge = age;
    humanWeight = weight;
    return self;
}

- (void)sayFamilyHello:(Human *)human
{
    NSMutableArray * elementsInArray = [NSMutableArray array];
    [elementsInArray addObject:human];
    
    while([elementsInArray count])
    {
        Human * current = [elementsInArray objectAtIndex:0];
        NSLog(@"Hello! My name is %@", current.humanName);
        for(Human * child in current.childrenArray)
        {
            [elementsInArray addObject:child];
        }
        
        [elementsInArray removeObjectAtIndex:0];
    }
}

- (void)fight
{
    NSLog(@"Fight!");
}

- (void)giveBirth
{
    NSLog(@"Give birth to baby!");
}

- (void)addChild:(Human *)withName {
    [[self childrenArray] addObject:withName];
}

- (void)removeChild:(Human *)withName {
    [[self childrenArray] removeObject:withName];
}

- (void)performGenderSpecificOperation {
    
}

@end
