//
//  FJCMoney.h
//  Billetera
//
//  Created by Javier Cazorla Moriche on 7/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FJCMoney;

@protocol FJCMoney <NSObject>

-(id) initWithAmount:(NSInteger) amount
            currency:(NSString*) currency;

//Devolvemos un id para que cuando se mande el mensaje times sepa que clase lo está llamando y devuelve ese tipo
//-(FJCMoney *) times: (NSInteger) multiplier;
-(id<FJCMoney>) times: (NSInteger) multiplier;

-(id<FJCMoney>) plus:(FJCMoney*) other;


@end

@interface FJCMoney : NSObject <FJCMoney>

@property (nonatomic,readonly) NSString *currency;

//Se crea publica para que pueda ser usada por la clase FJCBroker en su método reduce:xxxx toCurrency: yyyy
@property (nonatomic,strong,readonly) NSNumber *amount;


//Creramos métodos de clase para crear instancias de EURO y DOLLAR. Utilizamos id porque si usamos instancetype devolveria una instancia de FJCMoney y necesitamos instancias de las subclases (FJCEuro y FJCDollar
+(id) euroWithAmount: (NSInteger) amount;
+(id) dollarWithAmount: (NSInteger) amount;

@end
