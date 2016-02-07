//
//  NSObject+GNUStepAddons.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 7/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

//Para usar el RUNTME de ObjC
#import <objc/runtime.h>
#import "NSObject+GNUStepAddons.h"

@implementation NSObject (GNUStepAddons)

-(id) subclassResponsibility:(SEL) aSel{
    
    char prefix = class_isMetaClass (object_getClass(self)) ? '+' : '-'; //Utiliza el RUNTIME de ObjC
    [NSException raise:NSInvalidArgumentException
                format: @"%@%c%@ should be overriden by it subclass",
     NSStringFromClass([self class]),prefix,NSStringFromSelector(aSel)];
    
    return self; //not reached
    
}


@end