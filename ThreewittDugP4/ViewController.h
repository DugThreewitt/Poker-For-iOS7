//
//  ViewController.h
//  ThreewittDugP4
//
//  Created by CS 4220 on 7/26/16.
//  Copyright © 2016 CS 4220. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PokerCard.h"
#import "PokerDeck.h"
#import "PokerHand.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *dealerCards;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *playerCards;

-(void) displayAllCards;
-(void) displayCardsPlayer;
- (IBAction)drawButtonPressed:(UIButton *)sender;
- (IBAction)dealButtonPressed:(UIButton *)sender;

- (IBAction)player0Card:(UIButton *)sender;
- (IBAction)player1Card:(UIButton *)sender;
- (IBAction)player2Card:(UIButton *)sender;
- (IBAction)player3Card:(UIButton *)sender;
- (IBAction)player4Card:(UIButton *)sender;

@end

