//
//  EuroTests.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 7/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FJCEuro.h"


@interface EuroTests : XCTestCase

@end

@implementation EuroTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


//Test de multiplicacion
-(void) testMulplication {
    
    FJCEuro *euro= [[FJCEuro alloc]initWithAmount:5];
    FJCEuro *total = [euro times:2];
    
    
    XCTAssertEqual(10, total.amount, @"5 * 2 son 10");
    
    
}

@end
