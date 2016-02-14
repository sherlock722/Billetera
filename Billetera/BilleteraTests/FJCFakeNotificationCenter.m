//
//  FJCFakeNotificationCenter.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 14/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import "FJCFakeNotificationCenter.h"

@implementation FJCFakeNotificationCenter


- (id) init{
    if (self = [super init]) {
        _observers = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)addObserver:(id)observer
           selector:(nonnull SEL)aSelector
               name:(nullable NSString *)aName
             object:(nullable id)anObject{
    
    [self.observers setObject:observer
                       forKey:aName];
}

@end
