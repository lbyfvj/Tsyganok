//
//  ITMultipleValues.h
//  ITCHomeWork
//
//  Created by Ivan Tsyganok on 03.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#ifndef ITMultipleValues_h
#define ITMultipleValues_h

#include <stdio.h>

enum ITResultValues {
    ITEmptyResult,
    ITMamaResult,
    ITPapaResult,
    ITMamaPapaResult
};

typedef enum ITResultValues ITResultValues;

ITResultValues ITMultipleValues(int inputNumber);

#endif /* ITMultipleValues_h */
