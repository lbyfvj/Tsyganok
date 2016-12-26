//
//  ITMan.m
//  ITHuman
//
//  Created by Ivan Tsyganok on 18.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITMan.h"

@implementation ITMan

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.name = [NSString randomNameWithLength:7];
        self.age = ITRandomNumberInRange(24, 40);
        self.weight = ITRandomNumberInRange(65, 85);
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
