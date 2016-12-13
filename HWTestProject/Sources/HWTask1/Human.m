//
//  Human.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 27.11.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "Human.h"

@interface Human ()
@property (nonatomic, assign) NSMutableArray *mutableChildren;

@end

@implementation Human

@dynamic children;

- (id)initWithName:(NSString *)name gender:(Gender)gender age:(NSUInteger)age weight:(double)weight {
    self = [super init];
    _name = name;
    _gender = gender;
    _age = age;
    _weight = weight;
    _mutableChildren = [[[NSMutableArray alloc] init] autorelease];
    
    return self;
}

- (void)dealloc {
    [super dealloc];
}

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

- (void)addChild:(Human *)name {
    [[self mutableChildren] addObject:name];
}

- (void)removeChild:(Human *)name {    
    for (NSUInteger i = 0; i < self.mutableChildren.count; i++) {
        [self.mutableChildren removeObject:name];
    }
}

- (void)performGenderSpecificOperation {
    
}

@end
