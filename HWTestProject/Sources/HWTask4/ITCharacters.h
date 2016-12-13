//
//  ITCharacters.h
//  HWL1T1
//
//  Created by Ivan Tsyganok on 09.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITCharacters : NSObject <NSFastEnumeration>

+ (id)charactersWithRange:(NSRange)range;
+ (id)charactersWithStrings:(NSArray *)strings;
+ (id)charactersWithSymbols:(NSString *)string;
+ (id)charactersWithCharacters:(NSArray *)characters;

- (id)initWithRange:(NSRange)range;
- (id)initWithStrings:(NSArray *)strings;
- (id)initWithSymbols:(NSString *)string;
- (id)initWithCharacters:(NSArray *)characters;

- (NSUInteger)count;
- (NSString *)stringAtIndex:(NSUInteger)index;

- (NSString *)objectAtIndexedSubscript:(NSUInteger)index;

@end
