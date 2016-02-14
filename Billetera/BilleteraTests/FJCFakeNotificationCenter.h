//
//  FJCFakeNotificationCenter.h
//  Billetera
//
//  Created by Javier Cazorla Moriche on 14/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FJCFakeNotificationCenter : NSObject

@property (nonatomic,strong) NSMutableDictionary *observers;

- (void)addObserver:(id)observer
           selector:(nonnull SEL)aSelector
               name:(nullable NSString *)aName
             object:(nullable id)anObject;

@end
