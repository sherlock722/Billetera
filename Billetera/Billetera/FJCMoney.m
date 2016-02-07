//
//  FJCMoney.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 7/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import "FJCMoney.h"

@interface FJCMoney ()

@property (nonatomic) NSInteger amount;

@end

@implementation FJCMoney


-(id) initWithAmount:(NSInteger) amount {
    
    if (self= [super init]){
        
        _amount = amount;
        
    }
    
    return self;
    
}

-(FJCMoney *) times: (NSInteger) multiplier{
    
    //No se debería llamar y se debería usar la de la subclase
    return self;
    
}

@end
