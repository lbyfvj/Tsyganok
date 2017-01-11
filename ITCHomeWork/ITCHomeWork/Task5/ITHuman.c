//
//  ITHuman.c
//  ITCHomeWork
//
//  Created by Ivan Tsyganok on 04.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#include "ITHuman.h"
#include <stdlib.h>

void ITSetPartner(ITHuman *human, ITHuman *partner);
void ITSetMeritalStatus(ITHuman *human, ITMaritalStatus status);
uint8_t ITGetChildrenCount(ITHuman *human);

void ITSetPartner(ITHuman *human, ITHuman *partner) {
    human->_partner = partner;
}

void ITSetMeritalStatus(ITHuman *human, ITMaritalStatus status) {
    human->_meritalStatus = status;
}

uint8_t ITGetChildrenCount(ITHuman *human) {
    size_t arraySize = *(&human->_childrenArray + 1) - human->_childrenArray;

    return arraySize;
}

ITHuman *ITCreateHuman(char *name, uint8_t age, ITGender gender) {
    ITHuman *human = malloc(sizeof(*human));
    
    human->_name = name;
    human->_age = age;
    human->_gender = gender;
    human->_meritalStatus = ITUnmarried;

    human->_mother = NULL;
    human->_father = NULL;
    human->_partner = NULL;

    return human;
}

void ITGetMarried(ITHuman *human, ITHuman *partner) {
    ITSetPartner(human, partner);
    ITSetPartner(partner, human);
    ITSetMeritalStatus(human, ITMarried);
    ITSetMeritalStatus(partner, ITMarried);
}

void ITGetDivorced(ITHuman *human, ITHuman *partner) {
    ITSetPartner(human, NULL);
    ITSetPartner(partner, NULL);
    ITSetMeritalStatus(human, ITUnmarried);
    ITSetMeritalStatus(partner, ITUnmarried);
}

ITHuman ITMakeChild(ITHuman *human, ITHuman *partner, char *name, uint8_t age, ITGender gender) {
    ITHuman *child = NULL;
    
    if (human->_partner == partner && partner->_partner == human && human->_gender != partner->_gender) {
        ITHuman *mother = human->_gender == ITFemale ? human : partner;
        ITHuman *father = human->_gender == ITMale ? human : partner;
        child = ITCreateHuman(name, age, gender);
        child->_father = father;
        child->_mother = mother;
        uint8_t motherChildrenCount = ITGetChildrenCount(mother);
        uint8_t fatherChildrenCount = ITGetChildrenCount(father);
        mother->_childrenArray[motherChildrenCount + 1] = child;
        father->_childrenArray[fatherChildrenCount + 1] = child;
    }
    
    return *child;
}






