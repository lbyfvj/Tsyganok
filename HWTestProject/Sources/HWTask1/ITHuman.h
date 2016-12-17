//
//  ITHuman.h
//  HWL1T1
//
//  Created by Ivan Tsyganok on 27.11.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Male,
    Female
} ITGender;

@interface ITHuman: NSObject
@property (nonatomic, copy) NSString    *name;
@property (nonatomic, assign) ITGender    gender;
@property (nonatomic, assign) NSUInteger  age;
@property (nonatomic, assign) double      weight;

@property (nonatomic, copy, readonly)   NSArray     *children;

- (id)initWithName:(NSString *)name gender:(ITGender)gender age:(NSUInteger)age weight:(double)weight;
- (void)fight;
- (void)giveBirth;
- (void)addChild:(ITHuman *)name;
- (void)removeChild:(ITHuman *)name;
- (void)sayHello;
- (void)performGenderSpecificOperation;

@end


