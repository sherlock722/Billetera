//
//  FJCBroker.h
//  Billetera
//
//  Created by Javier Cazorla Moriche on 10/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FJCMoney.h"

//@class FJCMoney;
@interface FJCBroker : NSObject



-(id<FJCMoney>) reduce : (FJCMoney*) money
         toCurrency : (NSString*) currency;


-(void) addRate: (NSInteger) rate
  fromCurrency : (NSString* ) fromCurrency
     toCurrency: (NSString*)toCurrency;
@end
