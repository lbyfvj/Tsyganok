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

SPEC_BEGIN(ITCharactersSpec)

describe(@"ITCharacters", ^{
    
    __block ITCharacters *characters = nil;
    
//    + (id)charactersWithRange:(NSRange)range;
//    + (id)charactersWithStrings:(NSArray *)strings;
//    + (id)charactersWithSymbols:(NSString *)string;
//    
//    - (id) initWithRange:(NSRange)range;
//    - (id)initWithStrings:(NSArray *)strings;
//    - (id)initWithSymbols:(NSString *)string;
//    
//    - (NSUInteger)count;
//    - (NSString *)stringAtIndex:(NSUInteger)index;
    
    afterAll(^{
        characters = nil;
    });
    
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
            characters = [[ITCharacters alloc] initWithStrings:@[@"a", @"b"]];
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
    
});

SPEC_END
