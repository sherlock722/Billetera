//
//  FJCDollar.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 7/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import "FJCDollar.h"


//Se ha creado en un fichero de cabecera privado la propiedad amount
#import "FJCMoney-Private.h"
/*@interface FJCDollar ()

@property (nonatomic) NSInteger amount;

@end*/


@implementation FJCDollar

//Lo llevamos a la superclase (FJCMoney)
/*-(id) initWithAmount:(NSInteger) amount {
    
    if (self= [super init]){
        
        _amount = amount;
        
    }
    
    return self;
    
}*/

//Lo llevamos a la superclase (FJCMoney)
/*-(FJCDollar *) times: (NSInteger) multiplier{
    
    //Utilizamos el método integerValue para obtener del NSNumber su parte integer
    FJCDollar *newDollar = [[FJCDollar alloc] initWithAmount:[self.amount integerValue] * multiplier];
    
    return newDollar;
    
}*/

#pragma mark - Overwritten

/*-(BOOL) isEqual:(id)object{
    
    return [self amount] == [object amount];
    
}*/

/*-(NSUInteger)hash{
    
    return (NSUInteger) self.amount;
}*/

@end


