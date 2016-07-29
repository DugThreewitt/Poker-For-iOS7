//
//  ViewController.m
//  ThreewittDugP4
//
//  Created by CS 4220 on 7/26/16.
//  Copyright © 2016 CS 4220. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property PokerHand *player;
@property PokerHand *dealer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PokerDeck *deck = [[PokerDeck alloc] init];
    
    
//    [deck print];
    [deck shuffleDeck];
    //[deck print];
    self.player = [[PokerHand alloc] initWithCard1: deck.cards[0] andCard2: deck.cards[2] andCard3:deck.cards[4] andCard4:deck.cards[6] andCard5:deck.cards[8]];
    self.dealer = [[PokerHand alloc] initWithCard1: deck.cards[1] andCard2: deck.cards[3] andCard3:deck.cards[5] andCard4:deck.cards[7] andCard5:deck.cards[9]];
    

    
    [self displayCardsPlayer];
    
    NSLog(@"Dealer:\nStraighFlush: %d Straigh: %d Flush: %d Four: %d Three: %d TwoPair: %d Pair: %d HighCard: %i TieBreaker: %i", [self.dealer isStraightFlush], [self.dealer isStraight], [self.dealer isFlush], [self.dealer isFour], [self.dealer isThree], [self.dealer isTwoPair], [self.dealer isPair], (int)[self.dealer.highCard cardValue], (int)[self.dealer.tieBreaker cardValue]);
    
    NSLog(@"Player:\nStraighFlush: %d Straigh: %d Flush: %d Four: %d Three: %d TwoPair: %d Pair: %d HighCard: %i TieBreaker: %i", [self.player isStraightFlush], [self.player isStraight], [self.player isFlush], [self.player isFour], [self.player isThree], [self.player isTwoPair], [self.player isPair], (int)[self.player.highCard cardValue], (int)[self.player.tieBreaker cardValue]);
    
    
 //   [self displayCardsPlayer: player andDealer: dealer];
//    [deck print];
  //  NSLog(@"\nPlayer Hand: %@\nDealer Hand: %@", self.player, self.dealer);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) displayAllCards
{
    [[ self.playerCards objectAtIndex: 0] setImage:[[self.player.hand objectAtIndex:0] cardFace]];
    [[ self.playerCards objectAtIndex: 1] setImage:[[self.player.hand objectAtIndex:1] cardFace]];
    [[ self.playerCards objectAtIndex: 2] setImage:[[self.player.hand objectAtIndex:2] cardFace]];
    [[ self.playerCards objectAtIndex: 3] setImage:[[self.player.hand objectAtIndex:3] cardFace]];
    [[ self.playerCards objectAtIndex: 4] setImage:[[self.player.hand objectAtIndex:4] cardFace]];
    
    [[ self.dealerCards objectAtIndex: 0] setImage:[[self.dealer.hand objectAtIndex:0] cardFace]];
    [[ self.dealerCards objectAtIndex: 1] setImage:[[self.dealer.hand objectAtIndex:1] cardFace]];
    [[ self.dealerCards objectAtIndex: 2] setImage:[[self.dealer.hand objectAtIndex:2] cardFace]];
    [[ self.dealerCards objectAtIndex: 3] setImage:[[self.dealer.hand objectAtIndex:3] cardFace]];
    [[ self.dealerCards objectAtIndex: 4] setImage:[[self.dealer.hand objectAtIndex:4] cardFace]];
}

-(void) displayCardsPlayer
{
    UIImage *cardBack = [UIImage imageNamed:@"card back.png"];
    
    [[ self.playerCards objectAtIndex: 0] setImage:[[self.player.hand objectAtIndex:0] cardFace]];
    [[ self.playerCards objectAtIndex: 1] setImage:[[self.player.hand objectAtIndex:1] cardFace]];
    [[ self.playerCards objectAtIndex: 2] setImage:[[self.player.hand objectAtIndex:2] cardFace]];
    [[ self.playerCards objectAtIndex: 3] setImage:[[self.player.hand objectAtIndex:3] cardFace]];
    [[ self.playerCards objectAtIndex: 4] setImage:[[self.player.hand objectAtIndex:4] cardFace]];
    
    for (int i = 0 ; i < 5 ; i++)
    {
        [[ self.dealerCards objectAtIndex: i] setImage:cardBack];
    }
    
}

- (IBAction)drawButtonPressed:(UIButton *)sender
{
    [self displayAllCards];
}

- (IBAction)dealButtonPressed:(UIButton *)sender {
}

- (IBAction)player0Card:(UIButton *)sender {
    if ([[ self.player.hand objectAtIndex:0 ] hold ] == NO )
    {
        [[ self.player.hand objectAtIndex:0 ] setHold:YES ] ;
        sender.alpha = .1;
    }
    else
    {
        [[ self.player.hand objectAtIndex:0 ] setHold:YES ] ;
        sender.alpha = 0;
    }
    
}

- (IBAction)player1Card:(UIButton *)sender {
    [[ self.player.hand objectAtIndex:1 ] setHold:YES ] ;
    sender.alpha = .1;
}

- (IBAction)player2Card:(UIButton *)sender {
    [[ self.player.hand objectAtIndex:2 ] setHold:YES ] ;
    sender.alpha = .1;
}

- (IBAction)player3Card:(UIButton *)sender {
    [[ self.player.hand objectAtIndex:3 ] setHold:YES ] ;
    sender.alpha = .1;
}

- (IBAction)player4Card:(UIButton *)sender {
    [[ self.player.hand objectAtIndex:4 ] setHold:YES ] ;
    sender.alpha = .1;
}

@end
