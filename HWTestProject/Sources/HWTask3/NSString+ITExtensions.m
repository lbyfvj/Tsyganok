//
//  NSString+ITExtensions.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 06.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "NSString+ITExtensions.h"

static const NSUInteger kDefaultRandomStringLength = 30;

@implementation NSString (ITExtensions)

+ (id)randomString {
    return [self randomStringWithLenght:kDefaultRandomStringLength];
}

+ (id)randomStringWithLenght:(NSUInteger)lenght {
    return [self randomStringWithLenght:lenght ofCharacters:[ITCharacters characters]];
}

+ (id)randomStringWithLenght:(NSUInteger)lenght ofCharacters:(ITCharacters *)characters {
    NSMutableString *result = [NSMutableString string];
    for (NSUInteger i = 0; i < lenght; i++) {
        NSUInteger randomCharacter = arc4random_uniform((uint32_t)[characters count]);
        NSString *nextCharacter = [characters stringAtIndex: randomCharacter];
        [result appendFormat:@"%@", nextCharacter];
    }
    
    return [self stringWithString:result];
}

- (NSArray *)symbols {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self length]];
    NSUInteger lenght = [self length];
    for (NSUInteger index = 0; index < lenght; index++) {
        unichar resultChar = [self characterAtIndex:index];
        [result addObject:[NSString stringWithFormat:@"%c", resultChar]];
    }
    
    return [[result copy] autorelease];
}

@end
