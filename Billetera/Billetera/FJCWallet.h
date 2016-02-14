//
//  FJCWallet.h
//  Billetera
//
//  Created by Javier Cazorla Moriche on 11/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FJCMoney.h"
@import UIKit;

@interface FJCWallet : NSObject <FJCMoney>

@property (nonatomic,readonly)NSUInteger count;
@property (nonatomic,strong)NSArray *currencies;

- (void)subscribeToMemoryWarning:(NSNotificationCenter *)nc;

- (NSArray *)moneysForCurrency:(NSString *)currency;
- (id<FJCMoney>)subTotalForCurrency:(NSString *)currency;



@end
