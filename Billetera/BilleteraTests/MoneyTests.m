//
//  MoneyTests.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 7/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FJCMoney.h"
#import "FJCBroker.h"

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

//Metodo que comprueba exceptions
/*-(void)testThatTimesRaisesExceptions{
    
    FJCMoney *money = [[FJCMoney alloc] initWithAmount:1];
    XCTAssertThrows([money times:2],@"Should Raise an Exception");
    
}*/

//Test de divisas
-(void) testCurrency{
    
    XCTAssertEqualObjects(@"EUR", [[FJCMoney euroWithAmount:1] currency], @"The currency of euros should be EUR");
    
    XCTAssertEqualObjects(@"USD", [[FJCMoney dollarWithAmount:1]currency], @"The currency of dollar should be USD");
    
}


-(void) testMulplication {
    
    //Se sustituye initWithAmount por el método de clase euroWithAmount
    
    //FJCMoney *euro= [[FJCEuro alloc]initWithAmount:5];
    //FJCMoney *ten = [[FJCEuro alloc]initWithAmount:10];
    //FJCMoney *total = [euro times:2];
    
    FJCMoney *euro= [FJCMoney euroWithAmount:5];
    FJCMoney *ten = [FJCMoney euroWithAmount:10];
    FJCMoney *total = [euro times:2];
    
    
    //Para poner la propiedad oculta y ya no usarla
    //XCTAssertEqual(10, total.amount, @"5 * 2 should be 10");
    XCTAssertEqualObjects(ten, total, @"5 * 2 should be 10");
    
    
}


-(void)testEquality{
    
    
    //Se sustituye initWithAmount por el método de clase euroWithAmount
    //FJCMoney *five = [[FJCEuro alloc]initWithAmount:5];
    //FJCMoney *ten = [[FJCEuro alloc]initWithAmount:10];
    //FJCMoney *total = [five times:2];
    
    FJCMoney *five = [FJCMoney euroWithAmount:5];
    FJCMoney *ten = [FJCMoney euroWithAmount:10];
    FJCMoney *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent object should be equals");
    XCTAssertEqualObjects([FJCMoney dollarWithAmount:4], [[FJCMoney dollarWithAmount:2] times:2],@"Equivalent object should be equals");

    
}

//Test para diferenciar DIVISAS
-(void) testDiferentsCurrencies{
    
    FJCMoney *euro = [FJCMoney euroWithAmount:1];
    FJCMoney *dollar = [FJCMoney dollarWithAmount:1];
    
    
    XCTAssertNotEqualObjects(euro, dollar,@"Different currencies should not be equals");
    
}


-(void)testHash{
    
    //Se sustituye initWithAmount por el método de clase euroWithAmount
    //FJCMoney *a=[[FJCEuro alloc]initWithAmount:2];
    //FJCMoney *b=[[FJCEuro alloc]initWithAmount:2];
    
    FJCMoney *a=[FJCMoney euroWithAmount:2];
    FJCMoney *b=[FJCMoney euroWithAmount:2];
    
    
    XCTAssertEqual([a hash], [b hash], @"Equal object must have some hash");
    XCTAssertEqual([[FJCMoney dollarWithAmount:1] hash], [[FJCMoney dollarWithAmount:1]hash],@"Equal object must have some hash");
    
}

-(void) testAmountStorage{
    
    
    //Se sustituye initWithAmount por el método de clase euroWithAmount
    //FJCMoney *euro=[[FJCEuro alloc]initWithAmount:2];
    FJCMoney *euro=[FJCMoney euroWithAmount:2];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue],@"The value retrieved should be the same as the stored");
    
    XCTAssertEqual(2, [[[FJCMoney dollarWithAmount:2]performSelector:@selector(amount)]integerValue],@"The value retrieved should be the same as the stored");
    
#pragma clan diagnostic pop
    
    
}


-(void) testSimpleAddition{
    
    
    XCTAssertEqualObjects([[FJCMoney dollarWithAmount:5] plus:[FJCMoney dollarWithAmount:5]],
                             [FJCMoney dollarWithAmount:10],
                             @"$5 + $5 = $10");
    
    
}

//Test para comprobar que el método hash = amount
-(void) testHashIsAmount {
    
    
    FJCMoney * one = [FJCMoney dollarWithAmount:1];
    XCTAssertEqual([one hash], 1, @"The hash must be the same as the amount");
    
}

//Test para la description
-(void) testDescription{
    
    FJCMoney *one = [FJCMoney dollarWithAmount:1];
    NSString *def= @"<FJCMoney: $1>";
    
    XCTAssertEqualObjects(def, [one description],@"Description must match template");
    
}


@end
