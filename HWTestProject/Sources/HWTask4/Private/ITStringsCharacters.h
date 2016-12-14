//
//  ITStringsCharacters.h
//  HWL1T1
//
//  Created by Ivan Tsyganok on 09.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITCharacters.h"

@interface ITStringsCharacters : ITCharacters
@property (nonatomic, readonly) NSArray *strings;

- (id)initWithStrings:(NSArray *)strings;

@end
