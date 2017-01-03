//
//  main.c
//  ITCHomeWork
//
//  Created by Ivan Tsyganok on 03.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#include <stdio.h>

#include "ITMultipleValues.h"
#include "ITMultipleValuesTests.h"

const int kITMultipleValuesIterations = 1000;

void ITPerformMultipleValues(int iterations) {
    for (int iteration = 0; iteration < iterations; iteration++) {
        printf("Iteration: %d ", iteration);
        ITMultipleValues(iteration);
    }
}

void ITPerformTask1() {
    ITMultipleValuesTests();
    ITPerformMultipleValues(kITMultipleValuesIterations);
}

int main(int argc, const char * argv[]) {
    
    ITPerformTask1();
    
    return 0;
}
