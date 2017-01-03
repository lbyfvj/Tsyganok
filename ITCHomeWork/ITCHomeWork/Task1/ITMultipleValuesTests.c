//
//  ITMultipleValuesTests.c
//  ITCHomeWork
//
//  Created by Ivan Tsyganok on 03.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#include "ITMultipleValuesTests.h"

static
void ITMamaTest();

static
void ITPapaTest();

static
void ITMamaPapaTest();

static
void ITEmptyTest();

void ITMultipleValuesTests(){
    ITMamaTest();
    ITPapaTest();
    ITMamaPapaTest();
    ITEmptyTest();
}

void ITMamaTest(){
    if (ITMamaResult == ITMultipleValues(3)){
        printf("Mama output success test \n");
    }
}

void ITPapaTest(){
    if (ITPapaResult == ITMultipleValues(5)){
        printf("Papa output success test \n");
    }
}

void ITMamaPapaTest(){
    if (ITMamaPapaResult == ITMultipleValues(15)){
        printf("MamaPapa output success test \n");
    }
}

void ITEmptyTest() {
    if (ITEmptyResult == ITMultipleValues(2)){
        printf("Empty output success test \n");
    }
}
