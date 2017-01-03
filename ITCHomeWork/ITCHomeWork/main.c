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

#define ITGenerateTypeValueOutput(type, speceficator) \
type output_##type(type value) { \
printf("Perform Task2 \n"); \
printf("%"#speceficator, value); \
printf("\n"); \
return value; \
}

#define ITOutputData(type, value) output_##type(value);

ITGenerateTypeValueOutput(int, d);

const int kITMultipleValuesIterations = 1000;

void ITPerformMultipleValues(int iterations) {
    for (int iteration = 0; iteration < iterations; iteration++) {
        printf("Iteration: %d ", iteration);
        ITMultipleValues(iteration);
    }
}

void ITPerformTask1() {
    printf("Perform Task1 \n");
    ITMultipleValuesTests();
    ITPerformMultipleValues(kITMultipleValuesIterations);
}

void ITPerformTask2() {
    ITOutputData(int, 15);
}

int main(int argc, const char * argv[]) {
    
    ITPerformTask1();
    printf("\n");
    ITPerformTask2();
    
    return 0;
}
