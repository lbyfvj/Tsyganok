//
//  Women.m
//  HWL1T2
//
//  Created by Ivan Tsyganok on 30.11.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "Women.h"

@implementation Women

- (id)initWithName:(NSString *)name {
    name = name;
    return self;
}
- (void)performGenderSpecificOperation {
    [self giveBirth];
}

@end
