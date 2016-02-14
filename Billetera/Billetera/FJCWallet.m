//
//  FJCWallet.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 11/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import "FJCWallet.h"
#import "FJCMoney.h"
#import "FJCBroker.h"


//Esta clase va a implementar un protocolo definido en FJCMoney


@interface FJCWallet()

//@property (strong,nonatomic) NSMutableArray* moneys;

@property (nonatomic, strong)NSMutableDictionary *moneys;

@end

@implementation FJCWallet


- (NSUInteger)count {
    return [self.moneys count];
}

- (NSArray *)currencies {
    
    return [self.moneys allKeys];
}

-(id)initWithAmount: (NSInteger) amount currency:(NSString *)currency{
    
    if (self = [super init]){
        
        FJCMoney *money = [[FJCMoney alloc] initWithAmount:amount currency:currency];
        //_moneys = [NSMutableArray array];
        
        _moneys = [[NSMutableDictionary alloc] initWithCapacity:1];
        //[_moneys addObject:money];
        
        [_moneys setObject:@[money] forKey:money.currency];
        
    }
    
    return self;
    
}


-(id<FJCMoney>) plus:(FJCMoney*)money{
    
    //Sumar (lo añado al array)
    
    //[self.moneys addObject:money];
    
    //return self;
    NSMutableArray *newMoneys = [self.moneys objectForKey:money.currency];
    
    if (!newMoneys) {
        newMoneys = [NSMutableArray arrayWithObject:money];
    }else{
        newMoneys = [[newMoneys arrayByAddingObject:money] mutableCopy];
    }
    
    [self.moneys setObject:newMoneys forKey:money.currency];
    return self;
    
}

-(id<FJCMoney>) times:(NSInteger)multiplier{
    
    //Multiplicar (Recorro el array y a cada uno le mando el mensaje times). Tendría un nuevo array
    //NSMutableArray *newMoneys= [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    NSMutableDictionary *newMoneys = [[NSMutableDictionary alloc] init];
    
    /*for (FJCMoney *each in self.moneys){
        
        FJCMoney *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
        
        
    }
    self.moneys=newMoneys;
    
    return self;*/
    for (NSString *each in self.currencies) {
        for (FJCMoney *money in [self.moneys objectForKey:each]) {
            FJCMoney *newMoney = [money times:multiplier];
            [newMoneys setObject:@[newMoney] forKey:newMoney.currency];
        }
    }
    self.moneys = newMoneys;
    return self;
    
}

-(id<FJCMoney>) reduceToCurrency:(NSString *)currency
                      wihtBroker:(FJCBroker *)broker{
    
    /*FJCMoney *result = [[FJCMoney alloc]initWithAmount:0 currency:currency];
    
    
    for (FJCMoney *each in self.moneys){
        
        result = [result plus:[each reduceToCurrency:currency wihtBroker:broker]];
        
    }
    return result;*/
    
    FJCMoney *result =  [[FJCMoney alloc]initWithAmount:0 currency:currency];
    
    for (NSString *each in self.currencies) {
        for (FJCMoney *money in [self.moneys objectForKey:each]) {
            //result = [result plus:[money reduceToCurrency:currency withBroker:broker]];
            result = [result plus:[money reduceToCurrency:currency wihtBroker:broker]];
        }
    }
    
    return result;
    
}


#pragma mark - Table

- (NSArray *)moneysForCurrency:(NSString *)currency{
    
    NSArray *moneys = [self.moneys objectForKey:currency];
    
    return moneys;
}

- (id<FJCMoney>)subTotalForCurrency:(NSString *)currency {
    
    FJCMoney *result =  [[FJCMoney alloc]initWithAmount:0 currency:currency];
    
    NSArray *moneys = [self.moneys objectForKey:currency];
    
    for (FJCMoney *money in moneys) {
        result = [result plus:money];
    }
    
    return result;
}


#pragma mark - Notifications

-(void)subscribeToMemoryWarning:(NSNotificationCenter *)nc{
    
    [nc addObserver:self
           selector:@selector(dumpToDisk:)
               name:UIApplicationDidReceiveMemoryWarningNotification
             object:nil];
}

- (void)dumpToDisk:(NSNotification *)notification{
    
}
@end
