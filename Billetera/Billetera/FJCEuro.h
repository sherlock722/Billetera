//
//  FJCEuro.h
//  Billetera
//
//  Created by Javier Cazorla Moriche on 7/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FJCEuro : NSObject

@property (nonatomic,readonly) NSInteger amount;

-(id) initWithAmount:(NSInteger) amount;

-(FJCEuro *) times: (NSInteger) multiplier;


@end
