//
//  ITStructure.h
//  ITCHomeWork
//
//  Created by Ivan Tsyganok on 04.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#ifndef ITStructure_h
#define ITStructure_h

#include <stdio.h>
#include <stdbool.h>

struct ITStructure {
    bool bool3;
    long long long1;
    int int1;
    bool bool2;
    short short3;
    bool bool6;
    double double1;
    bool bool5;
    short short1;
    bool bool4;
    char *char1;
    short short2;
    bool bool1;
    float float1;
};

struct ITOptomizedStructure {
    long long long1;
    double double1;
    int int1;
    float float1;
    char *char1;
    short short1;
    short short2;
    short short3;
    bool bool1;
    bool bool2;
    bool bool3;
    bool bool4;
    bool bool5;
    bool bool6;
};

struct ITUnionStructure {
    long long long1;
    double double1;
    int int1;
    float float1;
    char *char1;
    short short1;
    short short2;
    short short3;
    
    union {
        struct {
            bool bool1 : 1;
            bool bool2 : 1;
            bool bool3 : 1;
            bool bool4 : 1;
            bool bool5 : 1;
            bool bool6 : 1;
        } bools;
    } unionData;
};

#endif /* ITStructure_h */
