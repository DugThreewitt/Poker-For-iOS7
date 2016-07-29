//
//  PokerDeck.m
//  ThreewittDugP4
//
//  Created by CS 4220 on 7/26/16.
//  Copyright © 2016 CS 4220. All rights reserved.
//

#import "PokerDeck.h"




@implementation PokerDeck

-(instancetype) init
{
    self = [super init];
    self.cards = [NSMutableArray new];
    self.images = [NSMutableArray new];
    
    NSString *filename;
    
    for (int suit = 0 ; suit < 4 ; suit++)
    {
        for (int val = 0; val < 13; val++)
        {
            switch (suit) {
                case 0:
                    filename = [NSString stringWithFormat:@"%i_of_spades.png", val+1];
                    self.images[suit + val] = [UIImage imageNamed:filename];
                    [ self.cards addObject: [[PokerCard alloc] initWithSuit: @"Spades" AndValue:val AndFaceImage:self.images[suit + val]]];
                    break;
                case 1:
                    filename = [NSString stringWithFormat:@"%i_of_clubs.png", val+1];
                    self.images[suit + val] = [UIImage imageNamed:filename];
                    [ self.cards addObject: [[PokerCard alloc] initWithSuit: @"Clubs" AndValue:val AndFaceImage:self.images[suit + val]]];
                    break;
                case 2:
                    filename = [NSString stringWithFormat:@"%i_of_hearts.png", val+1];
                    self.images[suit + val] = [UIImage imageNamed:filename];
                    [ self.cards addObject: [[PokerCard alloc] initWithSuit: @"Hearts" AndValue:val AndFaceImage:self.images[suit + val]]];
                    break;
                case 3:
                    filename = [NSString stringWithFormat:@"%i_of_diamonds.png", val+1];
                    self.images[suit + val] = [UIImage imageNamed:filename];
                    [ self.cards addObject: [[PokerCard alloc] initWithSuit: @"Diamonds" AndValue:val AndFaceImage:self.images[suit + val]]];
                    break;
                    
                default:
                    break;
            }
        }
    }
    
    return self;
}

-(void)print
{
    for (PokerCard *card in self.cards)
        NSLog(@"Suit: %@\tValue: %i", card.cardSuit, card.cardValue);
}

-(void) shuffleDeck
{
    int rand;
    PokerCard *tempCard;
    
    for(int i = 0; i < 52; i++)
    {
        rand = arc4random() %52;
        tempCard = self.cards[0];
        self.cards[0] = self.cards[rand];
        self.cards[rand] = tempCard;
    }
}
@end
