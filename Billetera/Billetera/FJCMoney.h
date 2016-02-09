//
//  FJCMoney.h
//  Billetera
//
//  Created by Javier Cazorla Moriche on 7/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FJCMoney : NSObject

//Creramos métodos de clase para crear instancias de EURO y DOLLAR. Utilizamos id porque si usamos instancetype devolveria una instancia de FJCMoney y necesitamos instancias de las subclases (FJCEuro y FJCDollar
+(id) euroWithAmount: (NSInteger) amount;
+(id) dollarWithAmount: (NSInteger) amount;

-(id) initWithAmount:(NSInteger) amount;

//Devolvemos un id para que cuando se mande el mensaje times sepa que clase lo está llamando y devuelve ese tipo
//-(FJCMoney *) times: (NSInteger) multiplier;
-(id) times: (NSInteger) multiplier;
@end
