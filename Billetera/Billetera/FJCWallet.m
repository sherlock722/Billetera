//
//  FJCWallet.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 11/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import "FJCWallet.h"


//Esta clase va a implementar un protocolo definido en FJCMoney


@interface FJCWallet()

@property (strong,nonatomic) NSMutableArray* moneys;

@end

@implementation FJCWallet

-(id)initWithAmount: (NSInteger) amount currency:(NSString *)currency{
    
    if (self = [super init]){
        
        FJCMoney *money = [[FJCMoney alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        
        [_moneys addObject:money];
        
    }
    
    return self;
    
}


-(id<FJCMoney>) plus:(FJCMoney*)money{
    
    //Sumar (lo añado al array)
    
    [self.moneys addObject:money];
    
    return self;
    
}

-(id<FJCMoney>) times:(NSInteger)multiplier{
    
    //Multiplicar (Recorro el array y a cada uno le mando el mensaje times). Tendría un nuevo array
    NSMutableArray *newMoneys= [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (FJCMoney *each in self.moneys){
        
        FJCMoney *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
        
        
    }
    self.moneys=newMoneys;
    
    return self;
    
}

@end
