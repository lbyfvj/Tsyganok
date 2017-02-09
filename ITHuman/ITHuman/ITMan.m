//
//  ITMan.m
//  ITHuman
//
//  Created by Ivan Tsyganok on 18.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITMan.h"

static const NSUInteger kITRandomMenNameLength = 7;
static const NSRange kITRandomMenAgeRange = {24, 40};
static const NSRange kITRandomMenWeightRange = {65, 85};

@implementation ITMan

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.name = [NSString randomNameWithLength:kITRandomMenNameLength];
        self.age = ITRandomNumberInRange(kITRandomMenAgeRange);
        self.weight = ITRandomNumberInRange(kITRandomMenWeightRange);
        self.gender = ITMale;
    }
    
    return self;
}

- (void)goFight {
    NSLog(@"Fight!");
}

- (void)performGenderSpecificOperation {
    [self goFight];
}

@end
