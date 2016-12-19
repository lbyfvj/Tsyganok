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

@end
