//
//  PokerHand.h
//  ThreewittDugP4
//
//  Created by CS 4220 on 7/26/16.
//  Copyright © 2016 CS 4220. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PokerCard.h"
#import "PokerDeck.h"

@interface PokerHand : NSObject

@property NSMutableArray *hand;
//@property NSMutableArray *hold;
@property PokerCard *highCard;
@property PokerCard *tieBreaker;
@property int handValue;

-(instancetype) initWithCard1: (PokerCard *)c1 andCard2: (PokerCard *)c2 andCard3: (PokerCard *) c3 andCard4: (PokerCard *) c4 andCard5: (PokerCard *) c5;

-(BOOL) isPair;
-(BOOL) isTwoPair;
-(BOOL) isThree;
-(BOOL) isFour;
-(BOOL) isFull;
-(BOOL) isStraight;
-(BOOL) isFlush;
-(BOOL) isStraightFlush;

-(NSMutableArray *) sortByFace: (NSMutableArray *) toSort;
-(NSMutableArray *) sortBySuit: (NSMutableArray *) toSort;

@end
