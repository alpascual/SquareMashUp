//
//  RandomGenerator.m
//  KidMathGame
//
//  Created by Albert Pascual on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "RandomGenerator.h"
#import "ItemForCell.h"
#import "wordList.h"

@implementation RandomGenerator


- (NSMutableArray*) GiveMeAllRandom:(NSInteger)max {
    
    NSMutableArray *one = [self startRandomArray:max];
    return [self moreRandom:one];
}

- (NSMutableArray*) startRandomArray:(NSInteger)max {
   
    wordList *words = [[wordList alloc] init];
    [words BuildWords];
    
    NSMutableArray *data = [[NSMutableArray alloc] init ];
    
    for (int i = 0; i < 3; i ++) 
    {
        NSString *tempWord = [words GetRandomWord];
        
        ItemForCell *item1 = [[ItemForCell alloc] init];
        item1.position = [[NSNumber alloc] initWithInt:i];
        item1.order = [[NSNumber alloc] initWithInt:1];
        item1.word = [[NSString alloc] initWithFormat:@"%c%c", [tempWord characterAtIndex:0], [tempWord characterAtIndex:1]];
        
        [data addObject:item1];
        
        ItemForCell *item2 = [[ItemForCell alloc] init];
        item2.position = [[NSNumber alloc] initWithInt:i];
        item2.order = [[NSNumber alloc] initWithInt:2];
        item2.word = [[NSString alloc] initWithFormat:@"%c%c", [tempWord characterAtIndex:2], [tempWord characterAtIndex:3]];
        
        [data addObject:item2];
    }
    
    return data;
}

- (NSMutableArray*) moreRandom:(NSMutableArray*)original {   
    
    NSLog(@"Original count %d", [original count]);
    NSMutableArray *firstPass = [[NSMutableArray alloc] initWithCapacity:original.count];
    
    for (NSUInteger i= 1;  i<= original.count; i++) {
        
        // Grabs objects randomly from the array
        ItemForCell *something = [original objectAtIndex: arc4random() % original.count];
                
        BOOL bContains = NO;
        for (int ii=0; ii < firstPass.count; ii++) {
            ItemForCell *tempItem = [firstPass objectAtIndex:ii];
            NSString *temp = tempItem.word;
            if ( [temp isEqualToString:something.word] == YES ) {
                bContains = YES;
                break;
            }                
        }
        
        if ( bContains == NO)
            [firstPass addObject:something];
    }
    NSLog(@"First Pass randoms numbers have %d", [firstPass count]);
    
    /*
    for( NSUInteger u= original.count-1; u >= 1; u--) {
        //Fill the ones we didn't get in the first place
        NSString *something = [original objectAtIndex:u];
        
        if ( [firstPass containsObject:something] == NO )
            [firstPass addObject:something];
    }
    NSLog(@"Second pass randoms numbers have %d", [firstPass count]);
    */
     
   for (NSUInteger t= 0;  t< original.count; t++) {        
        // Grabs objects randomly from the array
        ItemForCell *something = [original objectAtIndex: t];
        
        BOOL bContains = NO;
        for (int i=0; i < firstPass.count; i++) {
            ItemForCell *tempItem = [firstPass objectAtIndex:i];
            NSString *temp = tempItem.word;
            if ( [temp isEqualToString:something.word] == YES ) {
                bContains = YES;
                break;
            }                
        }
        
        if ( bContains == NO)
            [firstPass addObject:something];
        
        NSLog(@"Last pass pos %d Contains %d",t, bContains);
    }
    
    NSLog(@"Third pass randoms numbers have %d", [firstPass count]);
    
    while ( [firstPass count] != [original count] ) {
        NSLog(@"ERROR mismatch!");
        
        firstPass = [self GiveMeAllRandom:original.count/2];
        
    }
    
    return firstPass;    
}

@end
