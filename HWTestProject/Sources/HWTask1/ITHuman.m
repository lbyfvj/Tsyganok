//
//  ITHuman.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 27.11.16.
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
    self.mutableChildren = nil;
    
    [super dealloc];
}

- (id)initWithName:(NSString *)name gender:(ITGender)gender age:(NSUInteger)age weight:(double)weight {
    self = [super init];
    self.name = name;
    self.gender = gender;
    self.age = age;
    self.weight = weight;
    self.mutableChildren = [[NSMutableArray new] autorelease];
    
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

- (void)fight {
    NSLog(@"Fight!");
}

- (void)giveBirth {
    NSLog(@"Give birth to baby!");
}

- (void)addChild:(ITHuman *)name {
    [self.mutableChildren addObject:name];
}

- (void)removeChild:(ITHuman *)name {
    [self.mutableChildren removeObject:name];

}

- (void)performGenderSpecificOperation {
    
}

@end
