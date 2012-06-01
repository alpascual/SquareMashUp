//
//  GameMainController.m
//  CountGame
//
//  Created by Albert Pascual on 11/25/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "GameMainController.h"

#import "GMGridView.h"
#import "GMGridViewCell.h"
#import "GameProtocol.h"


#define INTERFACE_IS_PAD     ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) 
#define INTERFACE_IS_PHONE   ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) 

@interface GameMainController ()  <GMGridViewDataSource, GMGridViewSortingDelegate, GMGridViewTransformationDelegate, GMGridViewActionDelegate, GameProtocol>
{
    NSMutableArray *_data;
}

@property (strong, nonatomic) GMGridView *gmGridView;

@end

@implementation GameMainController

@synthesize gmGridView = _gmGridView;
@synthesize words = _words;
@synthesize cellArray = _cellArray;
@synthesize won = _won;
@synthesize sound = _sound;
@synthesize timer = _timer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        _data = [[NSMutableArray alloc] init];
        
        
        RandomGenerator *ran = [[RandomGenerator alloc] init];
        // Building the objects for iPhone
        if ( INTERFACE_IS_PHONE ) {
            
            _data = [ran GiveMeAllRandom:3];
        }
        else {
            _data = [ran GiveMeAllRandom:15];
        }
        
        self.cellArray = [[NSMutableArray alloc] init];
        self.sound = [[SoundManager alloc] init];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}


- (void)loadView 
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSInteger spacing = INTERFACE_IS_PHONE ? 10 : 15;
    
    self.gmGridView = [[GMGridView alloc] initWithFrame:self.view.bounds];
    self.gmGridView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.gmGridView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.gmGridView];
    
    
    self.gmGridView.style = GMGridViewStyleSwap;
    self.gmGridView.itemSpacing = spacing;
    self.gmGridView.minEdgeInsets = UIEdgeInsetsMake(spacing, spacing, spacing, spacing);
    self.gmGridView.centerGrid = YES;
    self.gmGridView.actionDelegate = self;
    self.gmGridView.sortingDelegate = self;
    self.gmGridView.transformDelegate = self;
    self.gmGridView.dataSource = self;
    
    /*UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    infoButton.frame = CGRectMake(self.view.bounds.size.width - 40, 
                                  self.view.bounds.size.height - 40, 
                                  40,
                                  40);
    infoButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    [infoButton addTarget:self action:@selector(presentInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:infoButton];*/
    
    
    /*OptionsViewController *optionsController = [[OptionsViewController alloc] init];
    optionsController.gridView = gmGridView;
    optionsController.contentSizeForViewInPopover = CGSizeMake(400, 500);
    
    _optionsNav = [[UINavigationController alloc] initWithRootViewController:optionsController];
    
     
    if (INTERFACE_IS_PHONE)
    {
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(optionsDoneAction)];
        optionsController.navigationItem.rightBarButtonItem = doneButton;
    }*/
}

- (NSInteger)numberOfItemsInGMGridView:(GMGridView *)gridView
{
    return [_data count];
}

- (CGSize)sizeForItemsInGMGridView:(GMGridView *)gridView
{
    if (INTERFACE_IS_PHONE) 
    {
        return CGSizeMake(140, 110);
    }
    else
    {
        return CGSizeMake(230, 175);
    }
}

- (GMGridViewCell *)GMGridView:(GMGridView *)gridView cellForItemAtIndex:(NSInteger)index
{
    //NSLog(@"Creating view indx %d", index);
    
    CGSize size = [self sizeForItemsInGMGridView:gridView];
    
    GMGridViewCell *cell = [gridView dequeueReusableCell];
    
    if (!cell) 
    {
        cell = [[GMGridViewCell alloc] init];
        cell.deleteButtonIcon = [UIImage imageNamed:@"close_x.png"];
        cell.deleteButtonOffset = CGPointMake(-15, -15);
        
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        view1.backgroundColor = [UIColor redColor];
        view1.layer.masksToBounds = NO;
        view1.layer.cornerRadius = 8;
        view1.layer.shadowColor = [UIColor grayColor].CGColor;
        view1.layer.shadowOffset = CGSizeMake(5, 5);
        view1.layer.shadowPath = [UIBezierPath bezierPathWithRect:view1.bounds].CGPath;
        view1.layer.shadowRadius = 8;
        
        cell.contentView = view1;
    }
    
    [[cell.contentView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:cell.contentView.bounds];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    ItemForCell *tempItem = [_data objectAtIndex:index];
    label.text = tempItem.word;
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont boldSystemFontOfSize:20];
    [cell.contentView addSubview:label];
    
    cell.tag = [tempItem.position intValue];
    [self.cellArray addObject:cell];
    tempItem.cell = cell;
    
    return cell;
}

- (void)GMGridView:(GMGridView *)gridView deleteItemAtIndex:(NSInteger)index
{
    [_data removeObjectAtIndex:index];
}

//////////////////////////////////////////////////////////////
#pragma mark GMGridViewActionDelegate
//////////////////////////////////////////////////////////////

- (void)GMGridView:(GMGridView *)gridView didTapOnItemAtIndex:(NSInteger)position
{
    NSLog(@"DId tap at index %d", position);
}



//////////////////////////////////////////////////////////////
#pragma mark GMGridViewSortingDelegate
//////////////////////////////////////////////////////////////

- (void)GMGridView:(GMGridView *)gridView didStartMovingCell:(GMGridViewCell *)cell
{
    [UIView animateWithDuration:0.3 
                          delay:0 
                        options:UIViewAnimationOptionAllowUserInteraction 
                     animations:^{
                         cell.contentView.backgroundColor = [UIColor orangeColor];
                         cell.contentView.layer.shadowOpacity = 0.7;
                     } 
                     completion:nil
     ];
}

- (void)GMGridView:(GMGridView *)gridView didEndMovingCell:(GMGridViewCell *)cell
{
    [UIView animateWithDuration:0.3 
                          delay:0 
                        options:UIViewAnimationOptionAllowUserInteraction 
                     animations:^{  
                         cell.contentView.backgroundColor = [UIColor redColor];
                         cell.contentView.layer.shadowOpacity = 0;
                     }
                     completion:nil
     ];
    
    [self.sound addSoundToQueue:@"yes"];
    [self.sound playQueue];
    
    // check all the squares
    //cell.contentView.backgroundColor = [UIColor greenColor];
    int winning = 0;
    for (int i=0; i<_data.count; i++) {
        ItemForCell *item1 = [_data objectAtIndex:i];
        ItemForCell *item2 = [_data objectAtIndex:i+1];
        
        item1.cell.contentView.backgroundColor = [UIColor redColor];
        item2.cell.contentView.backgroundColor = [UIColor redColor];
        
        if ( item1.position == item2.position ){
            
            if ( [item1.order intValue] == 1 && [item2.order intValue] == 2 ) {
                item1.cell.contentView.backgroundColor = [UIColor greenColor];
                item2.cell.contentView.backgroundColor = [UIColor greenColor]; 
                winning++;
                
            }
        }
                    
        i++;
    }
    
    if ( (winning *2) == _data.count)
    {
        [self.sound addSoundToQueue:@"won"];
        [self.sound playQueue];
        
        // TODO create a timer
        self.timer = [NSTimer scheduledTimerWithTimeInterval: 0.6 target: self selector: @selector(checktimerCallback:) userInfo: nil repeats: NO];
    }
}

- (void)checktimerCallback:(NSTimer *)timer {
    
    [self.timer invalidate];
    self.timer = nil;;
    
    self.won = [[WonViewController alloc] initWithNibName:@"WonViewController" bundle:nil];
    self.won.delegateGame = self;
    
    self.modalPresentationStyle = UIModalPresentationPageSheet;
    
    [self presentModalViewController:self.won animated:YES];
}

- (BOOL)GMGridView:(GMGridView *)gridView shouldAllowShakingBehaviorWhenMovingCell:(GMGridViewCell *)cell atIndex:(NSInteger)index
{
    return YES;
}

- (void)GMGridView:(GMGridView *)gridView moveItemAtIndex:(NSInteger)oldIndex toIndex:(NSInteger)newIndex
{
    NSObject *object = [_data objectAtIndex:oldIndex];
    [_data removeObject:object];
    [_data insertObject:object atIndex:newIndex];
}

- (void)GMGridView:(GMGridView *)gridView exchangeItemAtIndex:(NSInteger)index1 withItemAtIndex:(NSInteger)index2
{
    [_data exchangeObjectAtIndex:index1 withObjectAtIndex:index2];
}


//////////////////////////////////////////////////////////////
#pragma mark DraggableGridViewTransformingDelegate
//////////////////////////////////////////////////////////////

- (CGSize)GMGridView:(GMGridView *)gridView sizeInFullSizeForCell:(GMGridViewCell *)cell
{
    if (INTERFACE_IS_PHONE) 
    {
        return CGSizeMake(310, 310);
    }
    else
    {
        return CGSizeMake(700, 530);
    }
}

- (UIView *)GMGridView:(GMGridView *)gridView fullSizeViewForCell:(GMGridViewCell *)cell
{
    UIView *fullView = [[UIView alloc] init];
    fullView.backgroundColor = [UIColor yellowColor];
    fullView.layer.masksToBounds = NO;
    fullView.layer.cornerRadius = 8;
    
    CGSize size = [self GMGridView:gridView sizeInFullSizeForCell:cell];
    fullView.bounds = CGRectMake(0, 0, size.width, size.height);
    
    UILabel *label = [[UILabel alloc] initWithFrame:fullView.bounds];
    label.text = @"Fullscreen View";
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    if (INTERFACE_IS_PHONE) 
    {
        label.font = [UIFont boldSystemFontOfSize:15];
    }
    else
    {
        label.font = [UIFont boldSystemFontOfSize:20];
    }
    
    [fullView addSubview:label];
    
    
    return fullView;
}

- (void)GMGridView:(GMGridView *)gridView didStartTransformingCell:(GMGridViewCell *)cell
{
    [UIView animateWithDuration:0.5 
                          delay:0 
                        options:UIViewAnimationOptionAllowUserInteraction 
                     animations:^{
                         cell.contentView.backgroundColor = [UIColor blueColor];
                         cell.contentView.layer.shadowOpacity = 0.7;
                     } 
                     completion:nil];
}

- (void)GMGridView:(GMGridView *)gridView didEndTransformingCell:(GMGridViewCell *)cell
{
    [UIView animateWithDuration:0.5 
                          delay:0 
                        options:UIViewAnimationOptionAllowUserInteraction 
                     animations:^{
                         cell.contentView.backgroundColor = [UIColor redColor];
                         cell.contentView.layer.shadowOpacity = 0;
                     } 
                     completion:nil];
}

- (void)GMGridView:(GMGridView *)gridView didEnterFullSizeForCell:(UIView *)cell
{
    
}

- (void) AgainPressed
{
    /*NSUserDefaults *myPrefs = [NSUserDefaults standardUserDefaults];
    
    NSString *stringPoints = [myPrefs objectForKey:@"Points"];
    NSInteger intPoints = [stringPoints intValue];
    intPoints++;*/
    
    /*stringPoints = [[NSString alloc] initWithFormat:@"%d", intPoints];
    self.pointsLabel.text = stringPoints;
    [myPrefs setObject:stringPoints forKey:@"Points"];*/    
    
    [self dismissModalViewControllerAnimated:YES];
    //[self.gmGridView removeFromSuperview];
    
    [_data removeAllObjects];    
    
    RandomGenerator *ran = [[RandomGenerator alloc] init];
    // Building the objects for iPhone
    if ( INTERFACE_IS_PHONE ) {
        
        _data = [ran GiveMeAllRandom:3];
    }
    
    [self.gmGridView reloadData];
}

@end
