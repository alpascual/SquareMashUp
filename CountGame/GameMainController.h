//
//  GameMainController.h
//  CountGame
//
//  Created by Albert Pascual on 11/25/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "wordList.h"
#import "ItemForCell.h"
#import "RandomGenerator.h"
#import "WonViewController.h"
#import "SoundManager.h"


@interface GameMainController : UIViewController

@property (strong, nonatomic) wordList *words;
@property (strong, nonatomic) NSMutableArray *cellArray;
@property (strong, nonatomic) WonViewController *won;
@property (strong, nonatomic) SoundManager *sound;
@property (strong, nonatomic) NSTimer *timer;

@end
