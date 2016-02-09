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

-(FJCMoney *) times: (NSInteger) multiplier;

@end
