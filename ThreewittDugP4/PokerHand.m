//
//  PokerHand.m
//  ThreewittDugP4
//
//  Created by CS 4220 on 7/26/16.
//  Copyright © 2016 CS 4220. All rights reserved.
//

#import "PokerHand.h"

@implementation PokerHand

-(instancetype) initWithCard1: (PokerCard *)c1 andCard2: (PokerCard *)c2 andCard3: (PokerCard *) c3 andCard4: (PokerCard *) c4 andCard5: (PokerCard *) c5
{
    self = [super init];
    
    if (self)
    {
        self.hand = [ NSMutableArray new ];
       // self.hold = [ NSMutableArray new ];
//        NSString *loc;
        
        for (int i = 0 ; i < 5 ; i++)
        {
//            loc = [NSString stringWithFormat: @"c%i", i+1];
  //          [self.hold addObject:[NSNumber numberWithBool:NO]];
//            [ self.hand addObject: loc ];
        }
        [ self.hand addObject: c1 ];
        [ self.hand addObject: c2 ];
        [ self.hand addObject: c3 ];
        [ self.hand addObject: c4 ];
        [ self.hand addObject: c5 ];
    }
    self.highCard = nil;
    self.handValue = 0;
    
    return self;
}


-(BOOL) isPair
{
    if ( self.isFour || self.isFull || self.isThree || self.isTwoPair )
        return NO;
    
    NSMutableArray *sortedHand = [self sortByFace: self.hand];
    
    bool low=NO, midLow=NO, midHigh=NO, high=NO;
    
    low = ((int)[sortedHand[0] cardValue] == (int)[sortedHand[1] cardValue]);
    midLow = ( (int)[sortedHand[1] cardValue] == (int)[sortedHand[2] cardValue]);
    midHigh = ( (int)[sortedHand[2] cardValue] == (int)[sortedHand[3] cardValue]);
    high = ( (int)[sortedHand[3] cardValue] == (int)[sortedHand[4] cardValue]);
    
    if (low || midLow )
    {
        self.highCard = sortedHand[1];
        self.tieBreaker = sortedHand[4];
        if((int)[sortedHand[0] cardValue] == 0)
            self.tieBreaker = sortedHand[0];
        self.handValue = 2;
        return YES;
    }
    else if ( midHigh || high )
    {
        self.highCard = sortedHand[3];
        self.tieBreaker = sortedHand[4];
        if((int)[sortedHand[0] cardValue] == 0)
            self.tieBreaker = sortedHand[0];
        self.handValue = 1;
        return YES;
    }
    return NO;
}

-(BOOL) isTwoPair
{
    if ( self.isFour || self.isFull || self.isThree )
        return NO;
    
    NSMutableArray *sortedHand = [self sortByFace: self.hand];
    
    bool low2=NO, mid2=NO, high2=NO;
    
    low2 = ( (int)[sortedHand[0] cardValue] == (int)[sortedHand[1] cardValue] && (int)[sortedHand[2] cardValue] == (int)[sortedHand[3] cardValue] );
    mid2 = ( (int)[sortedHand[0] cardValue] == (int)[sortedHand[1] cardValue] && (int)[sortedHand[3] cardValue] == (int)[sortedHand[4] cardValue] );
    high2 = ( (int)[sortedHand[1] cardValue] == (int)[sortedHand[2] cardValue] && (int)[sortedHand[3] cardValue] == (int)[sortedHand[4] cardValue] );
    
    if (mid2 || high2 || low2)
    {
        self.highCard = sortedHand[3];
        self.tieBreaker = sortedHand[4];
        if((int)[sortedHand[0] cardValue] == 0)
            self.tieBreaker = sortedHand[0];
        self.handValue = 2;
        return YES;
    }
    
    return NO;
}

-(BOOL) isThree
{
    if (self.isFour || self.isFull)
        return NO;
    
    NSMutableArray *sortedHand = [self sortByFace: self.hand];
    
    bool low3 = NO, mid3= NO, high3=NO;
    
    low3 = ( (int)[sortedHand[0] cardValue] == (int)[sortedHand[1] cardValue] && (int)[sortedHand[1] cardValue] == (int)[sortedHand[2] cardValue] );
    mid3 = ( (int)[sortedHand[1] cardValue] == (int)[sortedHand[2] cardValue] && (int)[sortedHand[2] cardValue] == (int)[sortedHand[3] cardValue] );
    mid3 = ( (int)[sortedHand[3] cardValue] == (int)[sortedHand[4] cardValue] && (int)[sortedHand[2] cardValue] == (int)[sortedHand[3] cardValue] );
    
    if ( low3 || mid3 || high3 )
    {
        self.highCard = sortedHand[3];
        self.tieBreaker = sortedHand[4];
        if((int)[sortedHand[0] cardValue] == 0)
            self.tieBreaker = sortedHand[0];
        self.handValue = 3;
        return YES;
    }
    
    return NO;
}

-(BOOL) isFour
{
    NSMutableArray *sortedHand = [self sortByFace: self.hand];
    bool high4=NO, low4=NO;
    
    low4 = ( (int)[sortedHand[0] cardValue] == (int)[sortedHand[1] cardValue] && (int)[sortedHand[1] cardValue] == (int)[sortedHand[2] cardValue] && (int)[sortedHand[2] cardValue] == (int)[sortedHand[3] cardValue]);
    
    high4 = ( (int)[sortedHand[3] cardValue] == (int)[sortedHand[4] cardValue] && (int)[sortedHand[1] cardValue] == (int)[sortedHand[2] cardValue] && (int)[sortedHand[2] cardValue] == (int)[sortedHand[3] cardValue]);
    
    if(low4 || high4)
    {
        self.highCard = sortedHand[2];
        self.tieBreaker = sortedHand[4];
        if((int)[sortedHand[0] cardValue] == 0)
            self.tieBreaker = sortedHand[0];
        self.handValue = 25;
        return YES;
    }
    
    return NO;
}

-(BOOL) isFull
{
    NSMutableArray *sortedHand = [self sortByFace: self.hand];
    
    bool highFull=NO, lowFull=NO;
    
    lowFull = ( (int)[sortedHand[0] cardValue] == (int)[sortedHand[1] cardValue] && (int)[sortedHand[1] cardValue] == (int)[sortedHand[2] cardValue] && (int)[sortedHand[3] cardValue] == (int)[sortedHand[4] cardValue]);
    
    highFull = ( (int)[sortedHand[0] cardValue] == (int)[sortedHand[1] cardValue] && (int)[sortedHand[2] cardValue] == (int)[sortedHand[3] cardValue] && (int)[sortedHand[3] cardValue] == (int)[sortedHand[4] cardValue]);
    
    if (highFull || lowFull)
    {
        self.highCard = sortedHand[3];
        self.tieBreaker = sortedHand[4];
        if((int)[sortedHand[0] cardValue] == 0)
            self.tieBreaker = sortedHand[0];
        self.handValue = 9;
        return YES;
    }
    
    return NO;
}

-(BOOL) isStraight
{
    NSMutableArray *sortedHand = [self sortByFace: self.hand];

    
    NSLog(@"%@", sortedHand);
    
    int testRank;
    
    if (sortedHand[0] == 0)
    {
        bool aceHigh, aceLow;
        
        aceHigh = ( (int)[sortedHand[1] cardValue] == 9 && (int)[sortedHand[2] cardValue] == 10 && (int)[ sortedHand[3] cardValue ] == 11 && (int)[ sortedHand[4] cardValue ] == 12 );
        aceLow = ( (int)[sortedHand[1] cardValue] == 1 && (int)[sortedHand[2] cardValue] == 2 && (int)[sortedHand[3] cardValue] == 3 && (int)[sortedHand[4] cardValue] == 4 );
        
        if (aceHigh)
            self.highCard = sortedHand[0];
        else
            self.highCard = sortedHand[4];
        
        self.handValue = 4;
        return ( aceLow || aceHigh );
    }
    else
    {
        testRank = (int)[sortedHand[0] cardValue] + 1;
        for (int i = 1; i < 5 ; i++)
        {
            if (testRank != (int)[sortedHand[i] cardValue])
                return NO;
            
            testRank ++;
        }
        self.highCard = sortedHand[4];
        
        self.handValue = 4;
        return  YES;
    }
    
    return NO;
}

-(BOOL) isFlush
{
    NSString *matchSuit = [[self.hand objectAtIndex: 0] cardSuit];
    
    if ( [ matchSuit compare:[[self.hand objectAtIndex: 1] cardSuit]] == NSOrderedSame && [ matchSuit compare:[[self.hand objectAtIndex: 2] cardSuit]] == NSOrderedSame && [matchSuit compare:[[self.hand objectAtIndex: 3] cardSuit]] == NSOrderedSame && [matchSuit compare:[[self.hand objectAtIndex: 4] cardSuit]] == NSOrderedSame )
    {
        NSMutableArray *sortedHand = [self sortByFace: self.hand];
        self.highCard = sortedHand[4];
        if((int)[sortedHand[0] cardValue] == 0)
            self.tieBreaker = sortedHand[0];
        self.handValue = 6;
        return YES;
    }
    return NO;
}

-(BOOL) isStraightFlush
{
    if (self.isStraight && self.isFlush )
    {
        if(self.highCard == 0)
            self.handValue = 800; //royal flush
        else
            self.handValue = 50; //normal straigh flush
        return YES;
    }
    return NO;
}

-(NSMutableArray *) sortByFace: (NSMutableArray *) toSort
{
    NSMutableArray *sorted = [[NSMutableArray alloc] initWithArray: toSort];
    //
    
    PokerCard *temp;
    int min;
    
    for (int i = 0; i < sorted.count ; i++ )
    {
        min = i;
        
        for (int j = i+1; j < sorted.count ; j++)
        {
            if( [sorted[j] cardValue] < [sorted[min] cardValue] )
                min = j;
        }
        
        temp = sorted[i];
        sorted[i] = sorted[min];
        sorted[min] = temp;
    }
    self.highCard = sorted[4];
    self.tieBreaker = sorted[4];
    if((int)[sorted[0] cardValue] == 0)
        self.tieBreaker = sorted[0];
    
    return sorted;
}

-(NSMutableArray *) sortBySuit: (NSMutableArray *) toSort
{
    NSMutableArray *sorted = [NSMutableArray new];
    
    return sorted;
}


-(NSString *) description
{
    return [NSString stringWithFormat: @"\nCard 1: %@\tCard 2: %@\tCard 3: %@\tCard 4: %@\tCard 5: %@", self.hand[0], self.hand[1], self.hand[2], self.hand[3], self.hand[4]];
}

@end
