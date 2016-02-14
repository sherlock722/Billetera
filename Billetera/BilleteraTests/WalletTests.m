//
//  WalletTests.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 11/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FJCMoney.h"
#import "FJCBroker.h"
#import "FJCWallet.h"

@interface WalletTests : XCTestCase

@end

@implementation WalletTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// €40 + $20 = $100 Tasa 2:1
/*-(void) testAddictionWithRedaction {
    
    //Se neceita un broker
    FJCBroker *broker = [FJCBroker new];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    FJCWallet *wallet = [[FJCWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus:[FJCMoney dollarWithAmount:20]];
    
    FJCMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    XCTAssertEqualObjects(reduced,[FJCMoney dollarWithAmount:100],@"€40 + $20 = $100 Tasa 2:1");
}*/

@end
