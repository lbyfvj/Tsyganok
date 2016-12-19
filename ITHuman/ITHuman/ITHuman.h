//
//  ITHuman.h
//  ITHuman
//
//  Created by Ivan Tsyganok on 18.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ITMale,
    ITFemale
} ITGender;

@interface ITHuman : NSObject
@property (nonatomic, copy)     NSString      *name;
@property (nonatomic, assign)   ITGender      gender;
@property (nonatomic, assign)   NSUInteger    age;
@property (nonatomic, assign)   double        weight;

@property (nonatomic, copy, readonly) NSArray *children;

- (void)sayHello;
- (void)goFight;
- (void)giveBirth;

- (void)addChild:(ITHuman *)child;
- (void)removeChild:(ITHuman *)child;

- (void)performGenderSpecificOperation;

@end
