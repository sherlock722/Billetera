//
//  FJCBroker.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 10/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import "FJCBroker.h"
#import "FJCMoney.h"

@interface FJCBroker()

//Se lleva al FJCBroker.h para que sea visible
//@property (strong,nonatomic)NSMutableDictionary *rates;

@end


@implementation FJCBroker

//Se sobreescribe el init de NSObject para darle valor a la propiedad
-(id) init {
    
    if ([super init]){
        
        _rates = [@{}mutableCopy];
    }
    return self;
    
}


-(id<FJCMoney>) reduce : (id<FJCMoney>) money
         toCurrency : (NSString*) currency{
    
    
    
    //double dispatch (la informacu¡ión va y vuelve)
    return [money reduceToCurrency:currency wihtBroker:self];
    
}


-(void) addRate: (NSInteger) rate
  fromCurrency : (NSString* ) fromCurrency
     toCurrency: (NSString*)toCurrency{
    
    //Guardamos las tasas de conversión en un diccionario.
    [[self rates] setObject:@(rate) //Lo convierto en un NSNumber
                    forKey:[self keyFromCurrency:fromCurrency
                                      toCurrency:toCurrency]];
    
    
    NSNumber *invRate = @(1.0/rate);
    [[self rates] setObject:invRate //Lo convierto en un NSNumber
                     forKey:[self keyFromCurrency:toCurrency toCurrency: fromCurrency]];

    
}
#pragma mark - Utils
-(NSString*) keyFromCurrency: (NSString*)fromCurrency
                  toCurrency: (NSString*)toCurrency{
    
    return [NSString stringWithFormat:@"%@-%@",fromCurrency,toCurrency];
    
    
}


@end
