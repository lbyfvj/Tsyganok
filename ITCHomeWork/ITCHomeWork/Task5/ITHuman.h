//
//  ITHuman.h
//  ITCHomeWork
//
//  Created by Ivan Tsyganok on 04.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#ifndef ITHuman_h
#define ITHuman_h

#include <stdio.h>

typedef enum ITGender ITGender;
enum ITGender {
    ITMale,
    ITFemale
};

typedef enum ITMaritalStatus ITMaritalStatus;
enum ITMaritalStatus {
    ITMarried,
    ITUnmarried,
    ITDivorced
};

typedef struct ITHuman ITHuman;
struct ITHuman {
    
    char *_name;
    ITHuman *_father;
    ITHuman *_mother;
    
    ITMaritalStatus _meritalStatus;
    ITHuman *_partner;

    ITHuman *_childrenArray[20];
    
    uint8_t _age;
    
    ITGender _gender;
};

extern
ITHuman *ITCreateHuman(char *name, uint8_t age, ITGender gender);

extern
void ITGetMarried(ITHuman *human, ITHuman *partner);

#endif /* ITHuman_h */
