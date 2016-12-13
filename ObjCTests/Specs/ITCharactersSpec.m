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
    
    
    
    context(@"when initializated with (id)charactersWithRange: 'A', 'B' - 'A'", ^{
        beforeAll(^{
            characters = [ITCharacters charactersWithRange:NSMakeRange('A', 'B' - 'A')];
        });
        
        afterAll(^{
            characters = nil;
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
    });
});

SPEC_END
