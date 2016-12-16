//
//  ITCharactersSpec.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 09.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "Kiwi.h"

#import "ITCharacters.h"
#import "ITRangeCharacters.h"
#import "ITStringsCharacters.h"
#import "ITClusterCharacters.h"

SPEC_BEGIN(ITCharactersSpec)

describe(@"ITCharacters", ^{
    
    __block ITCharacters *characters = nil;
    
    afterAll(^{
        characters = nil;
    });
    
    // ITRangeCharacters Tests
    
    context(@"when initializated with charactersWithRange: 'A', 'B'", ^{
        beforeAll(^{
            characters = [ITCharacters charactersWithRange:ITMakeCharactersRange('A', 'B')];
        });
        
        it(@"should be of class ITRangeCharacters", ^ {
            [[characters should] beKindOfClass:[ITRangeCharacters class]];
        });
        
        it(@"should be count of 2", ^ {
            [[theValue([characters count]) should] equal:@(2)];
        });
        
        it(@"should contain @\"A\" at index = 0", ^ {
            [[[characters stringAtIndex:0] should] equal:@"A"];
        });
        
        it(@"should contain @\"B\" at index = 1", ^ {
            [[[characters stringAtIndex:1] should] equal:@"B"];
        });
        
        it(@"should raise when request object at index = 3", ^ {
            [[theBlock(^{
                [characters stringAtIndex:3];
            }) should] raise];
            
            [[theBlock(^{
                id a = characters[3];
                [a description];
            }) should] raise];
        });
        
        it(@"should return @\"AB\" from string", ^ {
            [[[characters string] should] equal:@"AB"];
        });
    });
    
    context(@"when initialized with initWithRange: 'A', 'B' - 'A'", ^{
        beforeAll(^{
            characters = [[ITCharacters alloc] initWithRange:ITMakeCharactersRange('A', 'B')];
        });
        
        it(@"should be of class ITRangeCharacters", ^ {
            [[characters should] beKindOfClass:[ITRangeCharacters class]];
        });
    });
    
    context(@"when initializated with charactersWithRange: 'A' - 'z' when enumerated", ^{
        NSRange range = ITMakeCharactersRange('A', 'z');
        
        beforeAll(^{
            characters = [[ITCharacters alloc] initWithRange:range];
        });
        
        it(@"shouldn't raise", ^ {
            [[theBlock(^{
                for (id symbol in characters) {
                    [symbol description];
                }
            }) shouldNot] raise];
        });
        
        it(@"should return count of symbols equek to range from 'A' to 'z'", ^{
            NSUInteger count = 0;
            for (NSString *symbol in characters) {
                [symbol description];
                count++;
            }
            [[theValue(count) should] equal:theValue(range.length)];
        });
        
        it(@"should return symbols in range: 'A' - 'z'", ^{
            unichar character = range.location;
            for (NSString *symbol in characters) {
                [[symbol should] equal:[NSString stringWithFormat:@"%c", character]];
                character++;
            }
        });
    });
    
    // ITStringsCharacters Tests
    
    context(@"when initializated with charactersWithStrings: @[@\"a\", @\"b\"]", ^{
        beforeAll(^{
            characters = [ITCharacters charactersWithStrings:@[@"a", @"b"]];
        });
        
        it(@"should be of class ITStringsCharacters", ^ {
            [[characters should] beKindOfClass:[ITStringsCharacters class]];
        });
        
        it(@"should be count of 2", ^ {
            [[characters should] haveCountOf:2];
        });
        
        it(@"should contain @\"a\" at index = 0", ^ {
            [[[characters stringAtIndex:0] should] equal:@"a"];
        });
        
        it(@"should contain @\"b\" at index = 1", ^ {
            [[[characters stringAtIndex:1] should] equal:@"b"];
        });
        
        it(@"should raise when request object at index = 3", ^ {
            [[theBlock(^{
                [characters stringAtIndex:3];
            }) should] raise];
            
            [[theBlock(^{
                id a = characters[3];
                [a description];
            }) should] raise];
        });
        
        it(@"should return @\"ab\" from string", ^ {
            [[[characters string] should] equal:@"ab"];
        });
    });
    
    context(@"when initialized with initWithStrings: @[@\"a\", @\"b\"]", ^{
        beforeAll(^{
            characters = [[ITStringsCharacters alloc] initWithStrings:@[@"a", @"b"]];
        });
        
        it(@"should be of class ITStringsCharacters", ^ {
            [[characters should] beKindOfClass:[ITStringsCharacters class]];
        });
    });
    
    context(@"when initializated with array containing: 'A' - 'z' when enumerated", ^{
        NSRange range = ITMakeCharactersRange('A', 'z');
        NSMutableArray *strings = [NSMutableArray new];
        
        beforeAll(^{
            for (unichar symbol = range.location; symbol < NSMaxRange(range); symbol++) {
                [strings addObject:[NSString stringWithFormat:@"%c", symbol]];
            }
            
            characters = [[ITCharacters alloc] initWithStrings:strings];
        });
        
        it(@"shouldn't raise", ^ {
            [[theBlock(^{
                for (id symbol in characters) {
                    [symbol description];
                }
            }) shouldNot] raise];
        });
        
        it(@"should return count of symbols equek to range from 'A' to 'z'", ^{
            NSUInteger count = 0;
            for (NSString *symbol in characters) {
                [symbol description];
                count++;
            }
            [[theValue(count) should] equal:theValue(range.length)];
        });
        
        it(@"should return symbols in range: 'A' - 'z'", ^{
            unichar character = range.location;
            for (NSString *symbol in characters) {
                [[symbol should] equal:[NSString stringWithFormat:@"%c", character]];
                character++;
            }
        });
    });
    
    // ITClusterCharacters Tests
    
    context(@"when initializated with charactersWithCharacters with characters in range 'A' - 'Z' and 'a' - 'z'", ^{
        ITCharacters *capitalizedCharacters = [ITCharacters charactersWithRange:ITMakeCharactersRange('A', 'Z')];
        ITCharacters *lowercasedCharacters = [ITCharacters charactersWithRange:ITMakeCharactersRange('a', 'z')];
        
        beforeAll(^{
            characters = [ITCharacters charactersWithCharacters:@[capitalizedCharacters, lowercasedCharacters]];
        });
        
        it(@"should be of class ITClusterCharacters", ^ {
            [[characters should] beKindOfClass:[ITClusterCharacters class]];
        });
        
        it(@"should be count of 52", ^ {
            [[characters should] haveCountOf:52];
        });
        
        it(@"should contain @\"a\" at index = 0", ^ {
            [[[characters stringAtIndex:0] should] equal:@"A"];
        });
        
        it(@"should contain @\"z\" at index = 51", ^ {
            [[[characters stringAtIndex:51] should] equal:@"z"];
        });
        
        it(@"should raise when request object at index = 53", ^ {
            [[theBlock(^{
                [characters stringAtIndex:53];
            }) should] raise];
            
            [[theBlock(^{
                id a = characters[53];
                [a description];
            }) should] raise];
        });
        
        it(@"should return @\"A-Za-z\" from string", ^ {
            NSString *string = [NSString stringWithFormat:@"%@%@",
                                [capitalizedCharacters string],
                                [lowercasedCharacters string]];
            [[[characters string] should] equal:string];
        });
    });
    
    context(@"when initialized with charactersWithCharacters with characters in range 'A' - 'Z' and 'a' - 'z'", ^{
        ITCharacters *capitalizedCharacters = [ITCharacters charactersWithRange:ITMakeCharactersRange('A', 'Z')];
        ITCharacters *lowercasedCharacters = [ITCharacters charactersWithRange:ITMakeCharactersRange('a', 'z')];
        
        beforeAll(^{
            characters = [[ITClusterCharacters alloc] initWithCharacters:@[capitalizedCharacters, lowercasedCharacters]];
        });
        
        it(@"should be of class ITClusterCharacters", ^ {
            [[characters should] beKindOfClass:[ITClusterCharacters class]];
        });
    });
    
    context(@"when initializated with array containing: 'A' - 'z' when enumerated", ^{
        NSRange capitalizedRange = ITMakeCharactersRange('A', 'Z');
        NSRange lowercasedRange = ITMakeCharactersRange('a', 'z');
        ITCharacters *capitalizedCharacters = [ITCharacters charactersWithRange:capitalizedRange];
        ITCharacters *lowercasedCharacters = [ITCharacters charactersWithRange:lowercasedRange];
        
        beforeAll(^{
            characters = [[ITClusterCharacters alloc] initWithCharacters:@[capitalizedCharacters, lowercasedCharacters]];
        });
        
        it(@"shouldn't raise", ^ {
            [[theBlock(^{
                for (id symbol in characters) {
                    [symbol description];
                }
            }) shouldNot] raise];
        });
        
        it(@"should return count of symbols equel to range 'A'-'Z', 'a'-'z'", ^{
            NSUInteger count = 0;
            for (NSString *symbol in characters) {
                [symbol description];
                count++;
            }
            [[theValue(count) should] equal:@([capitalizedCharacters count] + [lowercasedCharacters count])];
        });
        
        it(@"should return symbols in range 'A'-'Z', 'a'-'z'", ^{
            NSMutableString *string = [NSMutableString stringWithString:[capitalizedCharacters string]];
            [string appendString:[lowercasedCharacters string]];
            
            NSUInteger index = 0;
            
            for (NSString *symbol in characters) {
                [[symbol should] equal:[NSString stringWithFormat:@"%c", [string characterAtIndex:index]]];
                index++;
            }
        });
    });
    
});

SPEC_END
