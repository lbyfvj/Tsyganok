//
//  ITMultipleValues.c
//  ITCHomeWork
//
//  Created by Ivan Tsyganok on 03.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#include "ITMultipleValues.h"

const char kMamaResult[] = "Mama";
const char kPapaResult[] = "Papa";

ITResultValues ITMultipleValues(int inputNumber) {
    
    ITResultValues result = ITEmptyResult;
    
    if (0 == inputNumber) {
        return result;
    }
    
    if (0 == (inputNumber % 3)) {
        result += ITMamaResult;
        printf("%s", kMamaResult);
    }
    
    if (0 == (inputNumber % 5)) {
        result += ITPapaResult;
        printf("%s", kPapaResult);
    }
    
    printf("\n");
    
    return result;
}
