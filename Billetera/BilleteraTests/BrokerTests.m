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

@end

@implementation BrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}



- (void)testSimpleReduction {
    
    FJCBroker *broker = [[FJCBroker alloc] init];
    
    FJCMoney * sum =[[FJCMoney dollarWithAmount:5] plus:[FJCMoney dollarWithAmount:5]];
                     
    FJCMoney *reduced = [broker reduce : sum toCurrency : @"USD"];
    
    XCTAssertEqualObjects(sum, reduced,@"Conversion to some currency should be a NOP");
    
}



//Test $10 = €5 tasa 2:1
-(void) testReduction {
    
    FJCBroker * broker = [FJCBroker new];
    
    //Broker tiene que saber las tasas de conversion
    [broker addRate:2 fromCurrency : @"USD" toCurrency: @"EUR"];
    
    
    FJCMoney *dollar = [FJCMoney dollarWithAmount:10];
    FJCMoney *euro = [FJCMoney euroWithAmount:5];
    
    FJCMoney * converted = [broker reduce:dollar toCurrency:@"EUR"];
    
    
    XCTAssertEqualObjects(converted, euro, @"$10 = €5 tasa 2:1");
    
    
    
    
    
}



@end
