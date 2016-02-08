//
//  DollarTests.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 7/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FJCDollar.h"

@interface DollarTests : XCTestCase

@end

@implementation DollarTests

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
    
    FJCDollar *five = [[FJCDollar alloc]initWithAmount:5];
    FJCDollar *total = [five times:2];
    
    FJCDollar *ten = [[FJCDollar alloc]initWithAmount:10];
    
    
    XCTAssertEqualObjects(ten, total, @"$5 * 2 should be $10");
    
    
}

//Test de Igualdad
-(void)testEquality{
    
    FJCDollar *five = [[FJCDollar alloc]initWithAmount:5];
    FJCDollar *ten = [[FJCDollar alloc]initWithAmount:10];
    FJCDollar *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent object should be equals");
    XCTAssertFalse([total isEqual:five],@"Non equivalent objects should not be equals");
    
    
}


-(void)testHash{
    
    FJCDollar *a=[[FJCDollar alloc]initWithAmount:2];
    FJCDollar *b=[[FJCDollar alloc]initWithAmount:2];
    
    
    XCTAssertEqual([a hash], [b hash], @"Equal object must have some hash");
    
}



@end
