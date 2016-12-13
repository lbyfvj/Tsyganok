//
//  Human.h
//  HWL1T1
//
//  Created by Ivan Tsyganok on 27.11.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Male,
    Female
} Gender;

@interface Human: NSObject
@property (nonatomic, assign) NSString *name;
@property (nonatomic, assign) Gender gender;
@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, assign) double weight;

@property (nonatomic, copy, readonly) NSArray *children;

- (id)initWithName:(NSString *)name gender:(Gender)gender age:(NSUInteger)age weight:(double)weight;
- (void)fight;
- (void)giveBirth;
- (void)addChild:(Human *)name;
- (void)removeChild:(Human *)name;
- (void)sayHello;
- (void)performGenderSpecificOperation;

@end


