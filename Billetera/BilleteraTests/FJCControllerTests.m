//
//  FJCControllerTests.m
//  Billetera
//
//  Created by Javier Cazorla Moriche on 13/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FJCSimpleViewController.h"
#import "FJCWalletTableViewController.h"
#import "FJCWallet.h"

@interface FJCControllerTests : XCTestCase

@property (nonatomic,strong) FJCSimpleViewController *simpleVC;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;

@property (nonatomic,strong) FJCWalletTableViewController *walletVC;
@property (nonatomic,strong) FJCWallet *wallet;
@end

@implementation FJCControllerTests

- (void)setUp {
    [super setUp];
    
    self.simpleVC = [[FJCSimpleViewController alloc]initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc]initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
    
    self.wallet = [[FJCWallet alloc]initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[FJCMoney euroWithAmount:1]];
    
    self.walletVC = [[FJCWalletTableViewController alloc]initWithModel:self.wallet];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
}

- (void)testThatTextOnLabelIsEqualToTextOnButton {
    
    // Mandamos el mensaje
    [self.simpleVC displayText:self.button];
    
    // Comprobamos que etiqueta y botón tienen el mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button and label should have the same text");
}

-(void) testThatTableHasNumberOfSectionsIsNumberOfCurrenciesPlusOne{
    
    NSInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    NSUInteger currencies = [self.wallet.currencies count];
    
    //XCTAssertEqual(sections, 3, @"There can be only one");
    XCTAssertEqual(sections,
                   currencies + 1,
                   @"Number of sections should be the number of currencies plus one");
    
    
}

-(void)testThatTableHasNumberOfCellsIsNumberOfMoneyOfThisCurrencyPlusOne{
    
    NSString *currency = [self.wallet.currencies objectAtIndex:0];
    NSArray *moneys = [self.wallet moneysForCurrency: currency];
    
    /*XCTAssertEqual([self.wallet count] + 1,
                   [self.walletVC tableView:nil
                     numberOfRowsInSection:0], 
     @"Number of cells is the the number of moneys plus 1 (the total)");*/
    
    XCTAssertEqual([moneys count] + 1,
                   [self.walletVC tableView:nil numberOfRowsInSection:0],
                   @"Number of cells should be the number of moneys plus 1");
    
}

- (void)testThatLastSectionHasOnlyOneCell {
    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    
    XCTAssertEqual(1, [self.walletVC
                       tableView:nil numberOfRowsInSection:sections],
                        @"Number of cells in last section should be 1");
}



@end
