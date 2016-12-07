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

+ (id) numericCharacters {
    return [self charactersWithUnicodeInRange:NSMakeRange(48, 57 - 48 + 1)];
}

+ (id) symbolCharacters {
    return [self charactersWithUnicodeInRange:NSMakeRange(33, 47 - 33 + 1)];
}

+ (id) capitalizedCharacters {
    return [self charactersWithUnicodeInRange:NSMakeRange(65, 90 - 65 + 1)];
}

+ (id) lowercaseCharacters {
    return [self charactersWithUnicodeInRange:NSMakeRange(97, 122 - 97 + 1)];
}

+ (id) characters {
    NSMutableString *result = [NSMutableString stringWithString: [self capitalizedCharacters]];
    [result appendString:[self lowercaseCharacters]];
    [result appendString:[self numericCharacters]];
    return [self stringWithString:result];
}

+ (id) charactersWithUnicodeInRange: (NSRange)range {
    NSMutableString *result = [NSMutableString string];
    for(unichar character = range.location; character < NSMaxRange(range); character++) {
        [result appendFormat:@"%c", character];
    }
    return [self stringWithString:result];
}

+ (id)randomString {
    return [self randomStringWithLenght:kDefaultRandomStringLength];
}

+ (id)randomStringWithLenght:(NSUInteger)lenght {
    return [self randomStringWithLenght:lenght ofCharacters:[self characters]];
}

+ (id)randomStringWithLenght:(NSUInteger)lenght ofCharacters:(NSString *)characters {
    NSMutableString *result = [NSMutableString string];
    for (NSUInteger i = 0; i < lenght; i++) {
        NSUInteger randomCharacter = arc4random_uniform((uint32_t)[characters length]);
        unichar nextCharacter = [characters characterAtIndex: randomCharacter];
        [result appendFormat:@"%c", nextCharacter];
    }
    return [self stringWithString:result];
}

@end
