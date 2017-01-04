//
//  ITHumanTests.c
//  ITCHomeWork
//
//  Created by Ivan Tsyganok on 04.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#include "ITHumanTests.h"
#include "ITHuman.h"

ITHuman ITCreateMan();
ITHuman ITCreateWoman();

ITHuman ITCreateMan(){
    ITHuman man = *ITCreateHuman("Ivashka", 32, ITMale);
    printf("Human %s created", man._name);
    
    return man;
}

ITHuman ITCreateWoman(){
    ITHuman woman = *ITCreateHuman("Lena", 32, ITFemale);
    printf("Human %s created", woman._name);
    
    return woman;
}

void ITHumanTests(){
    ITHuman man = ITCreateMan();
    printf("\n");
    ITHuman woman = ITCreateWoman();
    printf("\n");
    ITGetMarried(&man, &woman);
    printf("%s's partner is %s \n", man._name, man._partner->_name);
    printf("%s's partner is %s \n", woman._name, woman._partner->_name);
    ITHuman child = ITMakeChild(&man, &woman, "Baby", 2, ITFemale);
    printf("Child %s father is %s \n", child._name, child._father->_name);
    printf("Child %s mother is %s \n", child._name, child._mother->_name);
}

