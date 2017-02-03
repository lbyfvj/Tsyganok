//
//  main.m
//  ITCarWash
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <ITSources/ITSources.h>

#import "ITCarWashAdministrator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ITCarWashAdministrator *carWashAdminstrator = [ITCarWashAdministrator object];
        
        [carWashAdminstrator startTimer];
        
        [[NSRunLoop mainRunLoop] run];
    }
    
    return 0;
}
