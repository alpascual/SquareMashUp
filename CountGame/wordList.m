//
//  wordList.m
//  SpellingBee
//
//  Created by Albert Pascual on 4/11/11.
//  Copyright 2011 Al. All rights reserved.
//

#import "wordList.h"


@implementation wordList

@synthesize _last5;


- (void) BuildWords
{
    _last5 = [[NSMutableArray alloc] initWithCapacity:5];
    
	if ( listOfWords == nil )
		listOfWords = [[NSMutableArray alloc] init];
	else {
		[listOfWords removeAllObjects];
	}       
    
	[listOfWords addObject:@"bake"];
	[listOfWords addObject:@"fake"];	
	[listOfWords addObject:@"cake"];
    [listOfWords addObject:@"lake"];
    [listOfWords addObject:@"make"];
    [listOfWords addObject:@"take"];
    [listOfWords addObject:@"date"];
    [listOfWords addObject:@"fate"];    
    [listOfWords addObject:@"gate"]; 
    [listOfWords addObject:@"hate"]; 
    [listOfWords addObject:@"late"]; 
    [listOfWords addObject:@"mate"]; 
    [listOfWords addObject:@"rate"]; 
    [listOfWords addObject:@"cage"]; 
    [listOfWords addObject:@"page"]; 
    [listOfWords addObject:@"rage"];         
    [listOfWords addObject:@"damp"];     
    [listOfWords addObject:@"lamp"];     
    [listOfWords addObject:@"here"];
    [listOfWords addObject:@"bike"];     
    [listOfWords addObject:@"dike"]; 
    [listOfWords addObject:@"hike"]; 
    [listOfWords addObject:@"like"]; 
    [listOfWords addObject:@"pike"];
    [listOfWords addObject:@"ball"]; 
    [listOfWords addObject:@"call"]; 
    [listOfWords addObject:@"fall"]; 
    [listOfWords addObject:@"hall"];     
    [listOfWords addObject:@"mall"]; 
    [listOfWords addObject:@"tall"];     
    [listOfWords addObject:@"wall"];
    [listOfWords addObject:@"bask"]; 
    [listOfWords addObject:@"mask"];     
    [listOfWords addObject:@"task"]; 
    [listOfWords addObject:@"bent"]; 
    [listOfWords addObject:@"dent"]; 
    [listOfWords addObject:@"lent"];     
    [listOfWords addObject:@"tent"];      
    [listOfWords addObject:@"beef"]; 
    [listOfWords addObject:@"beet"];     
    [listOfWords addObject:@"feet"]; 
    [listOfWords addObject:@"meet"]; 
    [listOfWords addObject:@"beep"]; 
    [listOfWords addObject:@"deep"]; 
    [listOfWords addObject:@"jeep"]; 
    [listOfWords addObject:@"peep"]; 
    [listOfWords addObject:@"bell"]; 
    [listOfWords addObject:@"fell"]; 
    [listOfWords addObject:@"well"]; 
    [listOfWords addObject:@"book"];    
    [listOfWords addObject:@"cook"]; 
    [listOfWords addObject:@"took"]; 
    [listOfWords addObject:@"bold"]; 
    [listOfWords addObject:@"cold"]; 
    [listOfWords addObject:@"fold"]; 
    [listOfWords addObject:@"mold"]; 
    [listOfWords addObject:@"hold"]; 
    
    /*[listOfWords addObject:@"taking"];
    [listOfWords addObject:@"deciding"];
    [listOfWords addObject:@"leaving"];
    [listOfWords addObject:@"tasting"];
    [listOfWords addObject:@"shaking"];
    [listOfWords addObject:@"losing"];
    [listOfWords addObject:@"squeezing"];
    [listOfWords addObject:@"scribbling"];
    [listOfWords addObject:@"pitcher"];
    [listOfWords addObject:@"catcher"];
    [listOfWords addObject:@"zipper"];
    [listOfWords addObject:@"driver"];
    [listOfWords addObject:@"skater"];
    [listOfWords addObject:@"laughed"];
    [listOfWords addObject:@"climbed"];
    [listOfWords addObject:@"wanted"];
    [listOfWords addObject:@"spotted"];
    [listOfWords addObject:@"slipped"];
    [listOfWords addObject:@"chased"];
    [listOfWords addObject:@"saved"];
    [listOfWords addObject:@"skier"];
    [listOfWords addObject:@"discovered"];
    [listOfWords addObject:@"boxes"];
    [listOfWords addObject:@"without"];
    [listOfWords addObject:@"somebody"];
    [listOfWords addObject:@"anything"];
    [listOfWords addObject:@"himself"];
    [listOfWords addObject:@"herself"];
    [listOfWords addObject:@"everyone"];
    [listOfWords addObject:@"playground"];
    [listOfWords addObject:@"snowball"];
    [listOfWords addObject:@"everything"];
    [listOfWords addObject:@"basketball"];
    [listOfWords addObject:@"footprints"];
    [listOfWords addObject:@"forever"];
    [listOfWords addObject:@"nighttime"];
    [listOfWords addObject:@"goldfish"];
    [listOfWords addObject:@"anyone"];
    [listOfWords addObject:@"popcorn"];
    [listOfWords addObject:@"barefoot"];
    [listOfWords addObject:@"watermelon"];
    [listOfWords addObject:@"rainbow"];
    [listOfWords addObject:@"everywhere"];
    [listOfWords addObject:@"sidewalk"];
    [listOfWords addObject:@"typewriter"];
    [listOfWords addObject:@"rocks"];
    [listOfWords addObject:@"uncomfortable"];
    [listOfWords addObject:@"untie"];
    [listOfWords addObject:@"unruly"];
    [listOfWords addObject:@"general"];
    [listOfWords addObject:@"gentle"];
    [listOfWords addObject:@"ginger"];
    [listOfWords addObject:@"college"];
    [listOfWords addObject:@"strange"];
    [listOfWords addObject:@"magic"];
    [listOfWords addObject:@"imagine"];
    [listOfWords addObject:@"emergency"];
    [listOfWords addObject:@"energy"];
    [listOfWords addObject:@"manager"];
    [listOfWords addObject:@"janitor"];
    [listOfWords addObject:@"juice"];
    [listOfWords addObject:@"joke"];
    [listOfWords addObject:@"jealous"];
    [listOfWords addObject:@"object"];
    [listOfWords addObject:@"adjust"];
    [listOfWords addObject:@"injured"];
    [listOfWords addObject:@"garage"];
    [listOfWords addObject:@"soldiers"];
    [listOfWords addObject:@"neighborhood"];
    [listOfWords addObject:@"marbles"];
    [listOfWords addObject:@"wings"];
    [listOfWords addObject:@"miles"];
    [listOfWords addObject:@"rockers"];
    [listOfWords addObject:@"taxis"];
    [listOfWords addObject:@"taxes"];
    [listOfWords addObject:@"witches"];
    [listOfWords addObject:@"police"];
    [listOfWords addObject:@"recess"];
    [listOfWords addObject:@"sugar"];
    [listOfWords addObject:@"island"];
    [listOfWords addObject:@"finished"];
    [listOfWords addObject:@"pushed"];
    [listOfWords addObject:@"followed"];
    [listOfWords addObject:@"discovered"];
    [listOfWords addObject:@"seeing"];
    [listOfWords addObject:@"singing"];
    [listOfWords addObject:@"spelling"];
    [listOfWords addObject:@"watching"];
    [listOfWords addObject:@"stepped"];
    [listOfWords addObject:@"grabbed"];
    [listOfWords addObject:@"shipped"];
    [listOfWords addObject:@"transferred"];
    [listOfWords addObject:@"slammed"];
    [listOfWords addObject:@"cutting"];
    [listOfWords addObject:@"canning"];
    [listOfWords addObject:@"winning"];
    [listOfWords addObject:@"snapping"];
    [listOfWords addObject:@"unfair"];
    [listOfWords addObject:@"bobsledding"];
    [listOfWords addObject:@"looked"];
    [listOfWords addObject:@"pressed"];
    [listOfWords addObject:@"opened"];
    [listOfWords addObject:@"turned"];
    [listOfWords addObject:@"scared"];
    [listOfWords addObject:@"decided"];
    [listOfWords addObject:@"united"];
    [listOfWords addObject:@"noticed"];
    [listOfWords addObject:@"supposed"];
    [listOfWords addObject:@"talking"];
    [listOfWords addObject:@"thinking"];
    [listOfWords addObject:@"parking"];
    [listOfWords addObject:@"hanging"];
    [listOfWords addObject:@"daring"];
    [listOfWords addObject:@"naming"];
    [listOfWords addObject:@"starving"];
    [listOfWords addObject:@"bathing"];
    [listOfWords addObject:@"dividing"];
    [listOfWords addObject:@"algae"];
    [listOfWords addObject:@"buffaloes"];
    [listOfWords addObject:@"preview"];
    [listOfWords addObject:@"prejudge"];
    [listOfWords addObject:@"vacant"];
    [listOfWords addObject:@"ponchos"];
    [listOfWords addObject:@"torpedoes"];
    [listOfWords addObject:@"beliefs"];
    [listOfWords addObject:@"occupied"];
    [listOfWords addObject:@"pianos"];
    [listOfWords addObject:@"prehistoric"];
    [listOfWords addObject:@"casualty"];
    [listOfWords addObject:@"regardless"];
    [listOfWords addObject:@"prolong"];
    [listOfWords addObject:@"prejudiced"];
    [listOfWords addObject:@"manager"];
    [listOfWords addObject:@"thicken"];
    [listOfWords addObject:@"separately"];*/
    
}

- (NSString*) GetRandomWord
{
    if ( listOfWords == nil)
		[self BuildWords];
	
	int ran = -1;
	do{
		ran = arc4random() % listOfWords.count;
	}while (_lastran == ran);
    
    // Check for 5 last duplicates before sending it back
    if ( [_last5 containsObject:[listOfWords objectAtIndex:ran]] == YES )
        [self GetRandomWord];
    else
    {
        if ( [_last5 count] == 5 ) {
            [_last5 removeObjectAtIndex:0];
        }
        
        [_last5 addObject:[listOfWords objectAtIndex:ran]];                    
    }
	
	return [listOfWords objectAtIndex:ran];

}

- (int) GetRandomNumber:(int)max
{
    int ran = -1;
    do {
        ran = arc4random() & max;
    } while ( _lastran == ran);
    
    return ran;
}



@end
