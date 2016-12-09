//
//  NSString+ITExtensions.h
//  HWL1T1
//
//  Created by Ivan Tsyganok on 06.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ITExtensions)

+ (id) numericCharacters;
+ (id) symbolCharacters;
+ (id) capitalizedCharacters;
+ (id) lowercaseCharacters;
+ (id) characters;
+ (id) charactersWithUnicodeInRange: (NSRange)range;

+ (id)randomString;
+ (id)randomStringWithLenght:(NSUInteger)lenght;
+ (id)randomStringWithLenght:(NSUInteger)lenght ofCharacters:(NSString *)characters;

- (NSArray *)symbols;

@end
