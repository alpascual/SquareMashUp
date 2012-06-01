//
//  ItemForCell.h
//  CountGame
//
//  Created by Albert Pascual on 11/25/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMGridViewCell.h"

@interface ItemForCell : NSObject

@property (strong, nonatomic) NSNumber *position;
@property (strong, nonatomic) NSNumber *order;
@property (strong, nonatomic) NSString *word;
@property (strong, nonatomic) GMGridViewCell *cell;

@end
