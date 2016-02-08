//
//  FJCMoney-Private.h
//  Billetera
//
//  Created by Javier Cazorla Moriche on 8/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FJCMoney.h"

@interface FJCMoney ()

//@property (nonatomic) NSInteger amount;

//Se cambia para poder corregir pasar el test testAmountStorage de FJCEuro
@property (nonatomic,strong) NSNumber* amount;

@end