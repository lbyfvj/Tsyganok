//
//  ITWomen.m
//  ITHuman
//
//  Created by Ivan Tsyganok on 18.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITWoman.h"

static const NSUInteger kITRandomWomenNameLength = 7;
static const NSRange kITRandomWomenAgeRange = {24, 40};
static const NSRange kITRandomWomenWeightRange = {65, 85};

@implementation ITWoman

- (instancetype)init {
    self = [super init];
    
    if (self) {        
        self.name = [NSString randomNameWithLength:kITRandomWomenNameLength];
        self.age = ITRandomNumberInRange(kITRandomWomenAgeRange);
        self.weight = ITRandomNumberInRange(kITRandomWomenWeightRange);
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
