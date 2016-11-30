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

@property (nonatomic, assign) NSString* humanName;
@property (nonatomic, assign) Gender humanGender;
@property (nonatomic, assign) int humanAge;
@property (nonatomic, assign) double humanWeight;
@property (nonatomic, strong) NSMutableArray* childrenArray;

- (id)initWithName:(NSString *)name andGender:(Gender)gender andAge:(int)age andWeight:(double)weight;
- (void)fight;
- (void)giveBirth;
- (void)addChild:(Human *)withName;
- (void)removeChild:(Human *)withName;
- (void)sayFamilyHello:(Human *)human;
- (NSArray *)allChildrenArray;

@end
