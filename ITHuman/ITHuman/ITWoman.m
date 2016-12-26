//
//  ITWomen.m
//  ITHuman
//
//  Created by Ivan Tsyganok on 18.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITWoman.h"

@implementation ITWoman

- (instancetype)init {
    self = [super init];
    
    if (self) {        
        self.name = [NSString randomNameWithLength:5];
        self.age = ITRandomNumberInRange(18, 32);
        self.weight = ITRandomNumberInRange(45, 64);
        self.gender = ITFemale;
    }
    
    return self;
}

- (void)giveBirth {
    NSLog(@"Give birth to baby!");
}

- (void)performGenderSpecificOperation {
    [self giveBirth];
}

@end
