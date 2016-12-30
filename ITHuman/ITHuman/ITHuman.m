//
//  ITHuman.m
//  ITHuman
//
//  Created by Ivan Tsyganok on 18.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITHuman.h"

NSUInteger ITRandomNumberInRange(NSRange range) {
    
    unichar min = range.location;
    unichar max = min + range.length;
    
    return min + arc4random_uniform(max - min +1);
}

@interface ITHuman ()
@property (nonatomic, retain) NSMutableArray *mutableChildren;

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
        self.name = self.name;
        self.mutableChildren = [NSMutableArray array];
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

- (void)addChild:(ITHuman *)child {
    [self.mutableChildren addObject:child];
}

- (void)removeChild:(ITHuman *)child {
    [self.mutableChildren removeObject:child];
}

- (void)performGenderSpecificOperation {
    
}

@end
