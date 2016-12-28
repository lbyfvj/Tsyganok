//
//  NSObject+ITObject.m
//  ITSources
//
//  Created by Ivan Tsyganok on 18.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "NSObject+ITObject.h"

@implementation NSObject (ITObject)

+ (instancetype)object {
    return [[[self alloc] init] autorelease];
}

+ (NSArray *)objectsWithCount:(NSUInteger)count {
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    
    for (NSInteger i = 0; i < count; i++) {
        [result addObject:[self object]];
    }
    
    return result;
}

@end
