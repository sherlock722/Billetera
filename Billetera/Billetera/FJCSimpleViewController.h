//
//  FJCSimpleViewController.h
//  Billetera
//
//  Created by Javier Cazorla Moriche on 13/2/16.
//  Copyright © 2016 FJC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FJCSimpleViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
- (IBAction)displayText:(id)sender;

@end
