//
//  ITHuman.m
//  ITHuman
//
//  Created by Ivan Tsyganok on 18.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITHuman.h"

@interface ITHuman ()
@property (nonatomic, assign) NSMutableArray *mutableChildren;

@end

@implementation ITHuman

@dynamic children;

#pragma mark -
#pragma mark - Initialization and Deallocation

- (void)dealloc {
    self.name = nil;
    self.mutableChildren = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.name = _name;
        self.mutableChildren = [[NSMutableArray new] autorelease];
    }
    
    return self;
}

#pragma mark -
#pragma mark - Accessors

- (NSArray *)children {
    return [[[self mutableChildren] copy] autorelease];
}

- (void)sayHello {
    NSLog(@"Hello, my name is %@, I'm %lu years old", self.name, self.age);
    for (id child in self.children) {
        [child sayHello];
    }
}

- (void)goFight {
    NSLog(@"Fight!");
}

- (void)giveBirth {
    NSLog(@"Give birth to baby!");
}

- (void)addChild:(ITHuman *)child {
    [self.mutableChildren addObject:child];
}

- (void)removeChild:(ITHuman *)child {
    [self.mutableChildren removeObject:child];
}

- (void)performGenderSpecificOperation {
    
}

@end
