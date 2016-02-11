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

@property (strong,nonatomic)NSMutableDictionary *rates;

@end


@implementation FJCBroker

//Se sobreescribe el init de NSObject para darle valor a la propiedad
-(id) init {
    
    if ([super init]){
        
        _rates = [@{}mutableCopy];
    }
    return self;
    
}


-(id<FJCMoney>) reduce : (FJCMoney*) money
         toCurrency : (NSString*) currency{
    
    
    //Se comprueba que divisa de origen y destino son las mismas
    FJCMoney *result;
    double rate = [[self.rates objectForKey:[self keyFromCurrency:money.currency toCurrency:currency]]doubleValue];
    
    
    if ([money.currency isEqual: currency]){
        
        result=money;
        
    }else if (rate == 0){
        
    //No Existe una tasa de conversion (rate = 0)
        
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion from %@ to %@" , money.currency,currency];
    
    } else{
        
        //Tenemos conversion
        
        double rate = [[[self rates]objectForKey:[self keyFromCurrency:money.currency toCurrency:currency]]doubleValue];
        
        NSInteger newAmount= [money.amount integerValue] * rate;
        
        result = [[FJCMoney alloc]initWithAmount:newAmount currency:currency];
        
    }
    
    return result;
    
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
