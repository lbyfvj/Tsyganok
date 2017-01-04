//
//  ITStructureTests.c
//  ITCHomeWork
//
//  Created by Ivan Tsyganok on 04.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#include "ITStructureTests.h"
#include <stddef.h>

void ITStructureSizeOutput();
void ITStructureOffSetOfElements();
void ITOptomizedStructureSizeOutput();
void ITUnionStructureSizeOutput();


void ITStructureTests(){
    ITStructureSizeOutput();
    ITStructureOffSetOfElements();
    ITOptomizedStructureSizeOutput();
    ITUnionStructureSizeOutput();
}

void ITStructureSizeOutput(){
    struct ITStructure structure;
    printf("Structure size: %lu \n", sizeof(structure));
}

void ITStructureOffSetOfElements(){
    printf("Bool1 offSet: %lu \n", offsetof(struct ITStructure, bool1));
    printf("Bool2 offSet: %lu \n", offsetof(struct ITStructure, bool2));
    printf("Bool3 offSet: %lu \n", offsetof(struct ITStructure, bool3));
    printf("Bool4 offSet: %lu \n", offsetof(struct ITStructure, bool4));
    printf("Bool5 offSet: %lu \n", offsetof(struct ITStructure, bool5));
    printf("Bool6 offSet: %lu \n", offsetof(struct ITStructure, bool6));
    printf("LongLong offSet: %lu \n", offsetof(struct ITStructure, long1));
    printf("Double offSet: %lu \n", offsetof(struct ITStructure, double1));
}

void ITOptomizedStructureSizeOutput(){
    struct ITOptomizedStructure structure;
    printf("Structure size: %lu \n", sizeof(structure));
}

void ITUnionStructureSizeOutput(){
    struct ITUnionStructure structure;
    printf("Structure size: %lu \n", sizeof(structure));
}

