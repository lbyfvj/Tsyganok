//
//  ITCharacters.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 09.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITCharacters.h"
#import "ITRangeCharacters.h"
#import "ITStringsCharacters.h"
#import "ITClusterCharacters.h"

#import "NSString+ITExtensions.h"

@implementation ITCharacters

#pragma mark -
#pragma mark Class methods

+ (id)charactersWithRange:(NSRange)range {
    return [[[ITRangeCharacters alloc] initWithRange:range] autorelease];
}

+ (id)charactersWithStrings:(NSArray *)strings {
    return [[[ITStringsCharacters alloc] initWithStrings:strings] autorelease];
}

+ (id)charactersWithSymbols:(NSString *)string {
    return [self charactersWithStrings:[string symbols]];
}

+ (id)charactersWithCharacters:(NSArray *)characters {
    return [[[ITClusterCharacters alloc] initWithCharacters:characters] autorelease];
}

#pragma mark -
#pragma mark Initialization

- (id)initWithRange:(NSRange)range {
    [self release];
    
    return [[ITRangeCharacters alloc] initWithRange:range];
}

- (id)initWithStrings:(NSArray *)strings {
    [self release];
    
    return [[ITStringsCharacters alloc] initWithStrings:strings];
}

- (id)initWithSymbols:(NSString *)string {
    return [self initWithStrings:[string symbols]];
}

- (id)initWithCharacters:(NSArray *)characters {
    [self release];
    
    return [self initWithCharacters:characters];
}

#pragma mark -
#pragma mark Public methods

- (NSUInteger)count {
    [self doesNotRecognizeSelector:_cmd];
    
    return 0;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

- (NSString *)objectAtIndexedSubscript:(NSUInteger)index {
    return [self stringAtIndex:index];
}

#pragma mark -
#pragma mark NSFastEnumeration methods

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id  _Nullable [])buffer
                                    count:(NSUInteger)len {
    return 0;
}

@end
