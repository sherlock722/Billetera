//
//  FJCEuro.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 7/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import "FJCEuro.h"


//Se ha creado en un fichero de cabecera privado
#import "FJCMoney-Private.h"
/*@interface FJCEuro ()

@property (nonatomic) NSInteger amount;

@end*/



@implementation FJCEuro

//Lo llevamos a la superclase (FJCMoney)
/*-(id) initWithAmount:(NSInteger) amount {
    
    if (self= [super init]){
        
        _amount = amount;
        
    }
    
    return self;
    
}*/


//Lo llevamos a la superclase (FJCMoney)
/*-(FJCEuro *) times: (NSInteger) multiplier{
    
    //Utilizamos el método integerValue para obtener del NSNumber su parte integer
    FJCEuro *newEuro = [[FJCEuro alloc] initWithAmount:[self.amount integerValue] * multiplier];
    
    return newEuro;
    
}*/


#pragma mark - Overwritten

/*-(BOOL) isEqual:(id)object{
    
    return [self amount] == [object amount];
    
    
}*/

/*-(NSUInteger)hash{
    
    return (NSUInteger) self.amount;
}*/





@end
