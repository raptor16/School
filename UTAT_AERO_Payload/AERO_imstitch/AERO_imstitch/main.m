//
//  main.m
//  AERO_imstitch
//
//  Created by Florence Chan on 2016-01-20.
//  Copyright (c) 2016 FlorenceChan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[]) {
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}
