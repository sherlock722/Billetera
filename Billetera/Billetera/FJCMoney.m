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
//#import "FJCMoney-Private.h"


#import "FJCEuro.h"
#import "FJCDollar.h"
#import "FJCBroker.h"

@interface FJCMoney ()

@property (nonatomic,strong) NSNumber *amount;

@end



@implementation FJCMoney

+(id) euroWithAmount: (NSInteger) amount{
    
    //return [[FJCEuro alloc] initWithAmount:amount];
    return [[FJCMoney alloc] initWithAmount:amount currency:@"EUR"];
}



+(id) dollarWithAmount: (NSInteger) amount{
    
    //return [[FJCDollar alloc]initWithAmount:amount];
    return [[FJCMoney alloc] initWithAmount:amount currency:@"USD"];
    
}


-(id) initWithAmount:(NSInteger) amount
            currency:(NSString *)currency{
    
    if (self= [super init]){
        
        //_amount = amount;
        
        //Se empaqueta el parametro como un NSNumber
        _amount = @(amount);
        _currency = currency;
    }
    
    return self;
    
}

//Devolvemos un id para que cuando se mande el mensaje times sepa que clase lo está llamando y devuelve ese tipo

-(id<FJCMoney>) times: (NSInteger) multiplier{
    
    //FJCMoney *newMoney = [[FJCMoney alloc] initWithAmount:[self.amount integerValue] * multiplier]
    
    FJCMoney *newMoney = [[FJCMoney alloc] initWithAmount:[self.amount integerValue] *multiplier
                                                 currency:self.currency];
    return newMoney;
    
}
/*-(FJCMoney *) times: (NSInteger) multiplier{
    
    //No se debería llamar y se debería usar la de la subclase
    //return self;
    
    //Se usa la categoría
    //_cmd es un parametro oculto que te indica cual es el selector actual
    return [self subclassResponsibility:_cmd];
    
}*/


-(id<FJCMoney>) plus:(FJCMoney*) other{
    
    NSInteger totalAmount = [[self amount] integerValue] + [[other amount]integerValue];
    
    FJCMoney *total = [[FJCMoney alloc]initWithAmount:totalAmount currency:[self currency]];
    
    
    return total;
    
}


-(id <FJCMoney>) reduceToCurrency: (NSString*) currency
                       wihtBroker: (FJCBroker*)broker{
    
    //Se comprueba que divisa de origen y destino son las mismas
    FJCMoney *result;
    double rate = [[broker.rates
                    objectForKey:[broker keyFromCurrency:self.currency
                                            toCurrency:currency]]doubleValue];
    
    
    if ([self.currency isEqual: currency]){
        
        result=self;
        
    }else if (rate == 0){
        
        //No Existe una tasa de conversion (rate = 0)
        
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion from %@ to %@" , self.currency,currency];
        
    } else{
        
        //Tenemos conversion
        
        /*double rate = [[[self rates]objectForKey:[self keyFromCurrency:money.currency toCurrency:currency]]doubleValue];*/
        
        NSInteger newAmount= [self.amount integerValue] * rate;
        
        result = [[FJCMoney alloc]initWithAmount:newAmount currency:currency];
        
    }
    
    return result;
    
}



#pragma mark - Overwritten
-(NSString*) description{
    
    //return [NSString stringWithFormat:@"<%@ %d", [self class], [self amount]];
    
    //Para que pase el test testDescription
    //return [NSString stringWithFormat:@"<%@ %ld", [self class], (long)[self amount]];
    return [NSString stringWithFormat:@"<%@: %@ %@>", [self class],self.currency,self.amount];
}


-(BOOL) isEqual:(id)object{
    
    //Para el test de comparar divisas tengo que comprobar que divisas estoy comparando
    if ([[self currency] isEqual:[object currency]]){
        return [self amount] == [object amount];
    }else {
        return NO;
    }
    
}

-(NSUInteger)hash{
    
    //Sólo se compara la cantidad.
    //Deberiamos en el futuro tener en cuenta las divisas
    //return (NSUInteger) self.amount;
    
    //Para pasar el test testHashIsAmount
    return  [[self amount] integerValue];
}




@end
