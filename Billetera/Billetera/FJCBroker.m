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


-(FJCMoney*) reduce : (FJCMoney*) money
         toCurrency : (NSString*) currency{
    
    return money;
    
}


-(void) addRate: (NSInteger) rate
  fromCurrency : (NSString* ) fromCurrency
     toCurrency: (NSString*)toCurrency{
    
    //Guardamos las tasas de conversión en un diccionario.
    [[self rates] setObject:@(rate) //Lo convierto en un NSNumber
                    forKey:[self keyFromCurrency:fromCurrency toCurrency: toCurrency]];
    
}
#pragma mark - Utils
-(NSString*) keyFromCurrency: (NSString*)fromCurrency
                  toCurrency: (NSString*)toCurrency{
    
    return [NSString stringWithFormat:@"%@-%@",fromCurrency,toCurrency];
    
    
}


@end
