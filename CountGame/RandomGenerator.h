//
//  RandomGenerator.h
//  KidMathGame
//
//  Created by Albert Pascual on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RandomGenerator : NSObject

- (NSMutableArray*) GiveMeAllRandom:(NSInteger)max;
- (NSMutableArray*) startRandomArray:(NSInteger)max;
- (NSMutableArray*) moreRandom:(NSMutableArray*)original;

@end
