//
//  ITClusterCharacters.m
//  HWL1T1
//
//  Created by Ivan Tsyganok on 13.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITClusterCharacters.h"

@interface ITClusterCharacters ()
@property (nonatomic, retain)   NSArray     *characters;
@property (nonatomic, assign)   NSUInteger  count;

- (NSUInteger)countWithCharacters:(NSArray *)characters;

@end

@implementation ITClusterCharacters

#pragma mark -
#pragma mark Initialization and Deallocations

- (void)dealloc {
    self.characters = nil;

    [super dealloc];
}

- (id)initWithCharacters:(NSArray *)characters {
    self = [super init];
    if (self) {
        self.characters = characters;
        self.count = [self countWithCharacters:characters];
    }
    return self;
}

#pragma mark -
#pragma mark Public

- (NSString *)stringAtIndex:(NSUInteger)index {
    NSUInteger count = self.count;
    NSUInteger iteratedIndex = index;
    
    NSAssert(index < count, NSRangeException);
    
    NSUInteger iterator = 0;
    
    for (ITCharacters *characterSet in self.characters) {
        if (iterator >= index) {
            return characterSet[iteratedIndex];
        }
        
        count = [characterSet count];
        iterator += count;
        iteratedIndex -= count;
        
    }
    
    return nil;
}

#pragma mark -
#pragma mark Private

- (NSUInteger)countWithCharacters:(NSArray *)characters {
    NSUInteger count = 0;
    
    for (ITCharacters *charactersSet in characters) {
        count += [charactersSet count];
    }
    
    return count;
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id [])buffer
                                    count:(NSUInteger)resultLength {


    return [super countByEnumeratingWithState:state
                                             objects:buffer
                                               count:resultLength];
}

@end
