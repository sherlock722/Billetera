//
//  FJCNSNotificationCenterTests.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 14/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FJCFakeNotificationCenter.h"
#import "FJCWallet.h"

@interface FJCNSNotificationCenterTests : XCTestCase

@end

@implementation FJCNSNotificationCenterTests

- (void)setUp {
    [super setUp];
    
    }

- (void)tearDown {
    [super tearDown];
}

- (void)testThatSubscribesToMemoryWarning{
    
    FJCFakeNotificationCenter *fake = [FJCFakeNotificationCenter new];
    
    FJCWallet *w = [FJCWallet new];
    [w subscribeToMemoryWarning:(NSNotificationCenter*)fake];
    
    NSDictionary *obs = [fake observers];
    id observer = [obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    
    XCTAssertEqualObjects(observer, w, @"Fat object must subscribe to UIApplicationDidReceiveMemoryWarningNotification");
}

@end
