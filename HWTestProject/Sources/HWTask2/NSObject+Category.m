//
//  NSObject+Category.m
//  HWL1T2
//
//  Created by Ivan Tsyganok on 30.11.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "NSObject+Category.h"

@implementation NSObject (ITObject)

+ (instancetype)object {
    return [[[self alloc] init] autorelease];
}

@end
