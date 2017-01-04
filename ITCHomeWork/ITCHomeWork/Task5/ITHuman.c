//
//  ITHuman.c
//  ITCHomeWork
//
//  Created by Ivan Tsyganok on 04.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#include "ITHuman.h"
#include <stdlib.h>

void ITSetPartner();

void ITSetPartner(){
    
}

ITHuman *ITCreateHuman(char *name, uint8_t age, ITGender gender){
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

void ITGetMarried(ITHuman *human, ITHuman *partner){
    
}
