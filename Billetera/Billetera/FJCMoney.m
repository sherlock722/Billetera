//
//  FJCMoney.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 7/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import "FJCMoney.h"
#import "NSObject+GNUStepAddons.h"

//Se ha creado en un fichero de cabecera privado la propiedad amount
#import "FJCMoney-Private.h"

/*@interface FJCMoney ()

@property (nonatomic) NSInteger amount;

@end*/

#import "FJCEuro.h"
#import "FJCDollar.h"


@implementation FJCMoney

+(id) euroWithAmount: (NSInteger) amount{
    
    return [[FJCEuro alloc] initWithAmount:amount];
}



+(id) dollarWithAmount: (NSInteger) amount{
    
    return [[FJCDollar alloc]initWithAmount:amount];
    
    
}


-(id) initWithAmount:(NSInteger) amount {
    
    if (self= [super init]){
        
        //_amount = amount;
        
        //Se empaqueta el parametro como un NSNumber
        _amount = @(amount);
    }
    
    return self;
    
}

//Devolvemos un id para que cuando se mande el mensaje times sepa que clase lo está llamando y devuelve ese tipo

-(id) times: (NSInteger) multiplier{
    
    FJCMoney *newMoney = [[FJCMoney alloc] initWithAmount:[self.amount integerValue] * multiplier];
    
    return newMoney;
    
}
/*-(FJCMoney *) times: (NSInteger) multiplier{
    
    //No se debería llamar y se debería usar la de la subclase
    //return self;
    
    //Se usa la categoría
    //_cmd es un parametro oculto que te indica cual es el selector actual
    return [self subclassResponsibility:_cmd];
    
}*/



#pragma mark - Overwritten
-(NSString*) description{
    
    //return [NSString stringWithFormat:@"<%@ %d", [self class], [self amount]];
    return [NSString stringWithFormat:@"<%@ %ld", [self class], (long)[self amount]];
}


-(BOOL) isEqual:(id)object{
    
    return [self amount] == [object amount];
    
}

-(NSUInteger)hash{
    
    //Sólo se compara la cantidad.
    //Deberiamos en el futuro tener en cuenta las divisas
    return (NSUInteger) self.amount;
}




@end
