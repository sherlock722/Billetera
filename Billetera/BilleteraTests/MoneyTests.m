//
//  MoneyTests.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 7/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FJCMoney.h"

@interface MoneyTests : XCTestCase

@end

@implementation MoneyTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testThatTimesRaisesExceptions{
    
    FJCMoney *money = [[FJCMoney alloc] initWithAmount:1];
    XCTAssertThrows([money times:2],@"Should Raise an Exception");
    
}

@end
