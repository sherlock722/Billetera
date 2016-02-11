//
//  BrokerTests.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 9/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FJCMoney.h"
#import "FJCBroker.h"

@interface BrokerTests : XCTestCase

@property (strong,nonatomic) FJCBroker *emptyBroker;
@property (strong,nonatomic) FJCMoney *oneDollar;


@end

@implementation BrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.emptyBroker = [FJCBroker new];
    self.oneDollar = [FJCMoney dollarWithAmount:1];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    self.emptyBroker = nil;
    self.oneDollar = nil;
}



- (void)testSimpleReduction {
    
    //Utilizo el broker del metodo setUp
    //FJCBroker *broker = [[FJCBroker alloc] init];
    
    FJCMoney * sum =[[FJCMoney dollarWithAmount:5] plus:[FJCMoney dollarWithAmount:5]];
                     
    FJCMoney *reduced = [self.emptyBroker reduce : sum toCurrency : @"USD"];
    
    XCTAssertEqualObjects(sum, reduced,@"Conversion to some currency should be a NOP");
    
}



//Test $10 = €5 tasa 2:1
-(void) testReduction {
    
    //FJCBroker * broker = [FJCBroker new];
    
    //Broker tiene que saber las tasas de conversion
    [self.emptyBroker addRate:2 fromCurrency : @"EUR" toCurrency: @"USD"];
    
    
    FJCMoney *dollar = [FJCMoney dollarWithAmount:10];
    FJCMoney *euro = [FJCMoney euroWithAmount:5];
    
    FJCMoney * converted = [self.emptyBroker reduce:dollar toCurrency:@"EUR"];
    
    
    XCTAssertEqualObjects(converted, euro, @"$10 = €5 tasa 2:1");
    
}

//Test cuando no tengo rate (tasa de conversion)
-(void) testThatNoRateRaisesException {
    
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"],@"No rate should case exception");
    
}

//Si conviertes de EUR a EUR el money no debería de cambiar
-(void)testThatNilConversionNotChangeMoney{
    
    //Si comparo oneDollar (dollar) debería seguir siendo dollar
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:@"USD"],
                             @"A nil conversion should have no effect");
    
    
}

@end
