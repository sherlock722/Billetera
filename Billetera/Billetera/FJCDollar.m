//
//  FJCDollar.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 7/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import "FJCDollar.h"

@interface FJCDollar ()

@property (nonatomic) NSInteger amount;

@end


@implementation FJCDollar

-(id) initWithAmount:(NSInteger) amount {
    
    if (self= [super init]){
        
        _amount = amount;
        
    }
    
    return self;
    
}

-(FJCDollar *) times: (NSInteger) multiplier{
    
    FJCDollar *newDollar = [[FJCDollar alloc] initWithAmount:self.amount * multiplier];
    
    return newDollar;
    
}

#pragma mark - Overwritten

-(BOOL) isEqual:(id)object{
    
    return [self amount] == [object amount];
    
}

-(NSUInteger)hash{
    
    return (NSUInteger) self.amount;
}

@end


