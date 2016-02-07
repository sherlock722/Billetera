//
//  FJCEuro.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 7/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import "FJCEuro.h"

@interface FJCEuro ()

@property (nonatomic) NSInteger amount;

@end



@implementation FJCEuro

-(id) initWithAmount:(NSInteger) amount {
    
    if (self= [super init]){
        
        _amount = amount;
        
    }
    
    return self;
    
}


-(FJCEuro *) times: (NSInteger) multiplier{
    
    FJCEuro *newEuro = [[FJCEuro alloc] initWithAmount:self.amount * multiplier];
    
    return newEuro;
    
}


@end
