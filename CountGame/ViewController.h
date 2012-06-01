//
//  ViewController.h
//  CountGame
//
//  Created by Albert Pascual on 11/25/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameMainController.h"
#import "SoundManager.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) GameMainController *gameView;
@property (strong, nonatomic) SoundManager *sound;

@end
