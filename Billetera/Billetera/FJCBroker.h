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

@property (strong,nonatomic)NSMutableDictionary *rates;



-(FJCMoney*) reduce : (id<FJCMoney>) money
         toCurrency : (NSString*) currency;


-(void) addRate: (NSInteger) rate
  fromCurrency : (NSString* ) fromCurrency
     toCurrency: (NSString*)toCurrency;

-(NSString*) keyFromCurrency: (NSString*)fromCurrency
                  toCurrency: (NSString*)toCurrency;

- (void)parseJSONRates:(NSData *)json;
@end
