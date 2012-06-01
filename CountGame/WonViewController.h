//
//  WonViewController.h
//  KidMathGame
//
//  Created by Albert Pascual on 11/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameProtocol.h"

@interface WonViewController : UIViewController

@property (strong, nonatomic) id <GameProtocol> delegateGame;

- (IBAction)againPressed:(id)sender;

@end
