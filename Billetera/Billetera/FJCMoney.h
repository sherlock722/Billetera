//
//  FJCMoney.h
//  Billetera
//
//  Created by Javier Cazorla Moriche on 7/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FJCMoney : NSObject

-(id) initWithAmount:(NSInteger) amount;

-(FJCMoney *) times: (NSInteger) multiplier;

@end