//
//  FJCDollar.h
//  Billetera
//
//  Created by Javier Cazorla Moriche on 7/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FJCDollar : NSObject

-(id) initWithAmount:(NSInteger) amount;

-(FJCDollar *) times: (NSInteger) multiplier;

@end
