//
//  NSString+ITExtensions.h
//  HWL1T1
//
//  Created by Ivan Tsyganok on 06.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ITExtensions)

+(NSString *)randomString;
+(NSString *)randomStringWithLenght:(NSUInteger)lenght;
+(NSString *)randomStringWithLenght:(NSUInteger)lenght ofCharacters:(NSString *)characters;

@end
