//
//  NSString+ITExtensions.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 06.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "NSString+ITExtensions.h"

static const NSUInteger defaultRandomStringLength = 30;

static const NSString *defaultCharactersSet = @"abcdferfvvxcsdzcdfbsfgbfgbdfvwedcasczd";

@implementation NSString (ITExtensions)

+(NSString *)randomString {
    return [self randomStringWithLenght:defaultRandomStringLength];
}

+(NSString *)randomStringWithLenght:(NSUInteger)lenght {
    return [self randomStringWithLenght:lenght ofCharacters:defaultCharactersSet];
}

+(NSString *)randomStringWithLenght:(NSUInteger)lenght ofCharacters:(NSString *)characters {
    NSMutableString *result = [NSMutableString string];
    
    for (NSUInteger i = 0; i < lenght; i++) {
        NSUInteger random = arc4random_uniform([characters length]);
        unichar nextChar = [characters characterAtIndex: random];
        [result appendFormat:@"%c", nextChar];
    }
    
    return [self stringWithString:result];
}

@end
