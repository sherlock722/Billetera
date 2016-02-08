//
//  FJCEuro.h
//  Billetera
//
//  Created by Javier Cazorla Moriche on 7/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FJCMoney.h"

@interface FJCEuro : FJCMoney

//Se oculta la propiedad amount (ver testMulplication)
//@property (nonatomic,readonly) NSInteger amount;

//Lo llevamos a la superclase (FJCMoney)
//-(id) initWithAmount:(NSInteger) amount;

-(FJCEuro *) times: (NSInteger) multiplier;


@end
