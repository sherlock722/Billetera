//
//  EuroTests.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 7/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FJCEuro.h"
#import "FJCMoney.h"


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
    
    //Se sustituye initWithAmount por el método de clase euroWithAmount
    
    //FJCEuro *euro= [[FJCEuro alloc]initWithAmount:5];
    //FJCEuro *ten = [[FJCEuro alloc]initWithAmount:10];
    //FJCEuro *total = [euro times:2];
    
    FJCEuro *euro= [FJCMoney euroWithAmount:5];
    FJCEuro *ten = [FJCMoney euroWithAmount:10];
    FJCEuro *total = [euro times:2];
    
    
    //Para poner la propiedad oculta y ya no usarla
    //XCTAssertEqual(10, total.amount, @"5 * 2 should be 10");
    XCTAssertEqualObjects(ten, total, @"5 * 2 should be 10");
    
    
}


-(void)testEquality{
    
    
    //Se sustituye initWithAmount por el método de clase euroWithAmount
    //FJCEuro *five = [[FJCEuro alloc]initWithAmount:5];
    //FJCEuro *ten = [[FJCEuro alloc]initWithAmount:10];
    //FJCEuro *total = [five times:2];
    
    FJCEuro *five = [FJCMoney euroWithAmount:5];
    FJCEuro *ten = [FJCMoney euroWithAmount:10];
    FJCEuro *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent object should be equals");
    
    
}


-(void)testHash{
    
    //Se sustituye initWithAmount por el método de clase euroWithAmount
    //FJCEuro *a=[[FJCEuro alloc]initWithAmount:2];
    //FJCEuro *b=[[FJCEuro alloc]initWithAmount:2];
    
    FJCEuro *a=[FJCMoney euroWithAmount:2];
    FJCEuro *b=[FJCMoney euroWithAmount:2];
    
    
    XCTAssertEqual([a hash], [b hash], @"Equal object must have some hash");
    
}

-(void) testAmountStorage{
    
    
    //Se sustituye initWithAmount por el método de clase euroWithAmount
    //FJCEuro *euro=[[FJCEuro alloc]initWithAmount:2];
    FJCEuro *euro=[FJCMoney euroWithAmount:2];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue],@"The value retrieved should be the same as the stored");
    
#pragma clan diagnostic pop
    
    
}




@end
