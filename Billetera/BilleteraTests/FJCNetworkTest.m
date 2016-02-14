//
//  FJCNetworkTest.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 14/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FJCBroker.h"

@interface FJCNetworkTest : XCTestCase

@end

@implementation FJCNetworkTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatEmptyRatesRaisesException {
    
    FJCBroker *broker = [FJCBroker new];
    NSData *jsonData = nil;
    
    XCTAssertThrows([broker parseJSONRates:jsonData], @"An empty JSON should raise exception");
    
}

@end
