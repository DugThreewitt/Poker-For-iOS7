//
//  PokerCard.m
//  ThreewittDugP4
//
//  Created by CS 4220 on 7/26/16.
//  Copyright © 2016 CS 4220. All rights reserved.
//

#import "PokerCard.h"

@implementation PokerCard


-(instancetype) initWithSuit: (NSString *) s AndValue: (int) v AndFaceImage: (UIImage*) img
{
    self = [super init];
    
    if (self)
    {
        self.cardSuit = s;
        self.cardValue = v;
        self.cardFace = img;
        self.hold = NO;
    }
    
    return self;
}

-(NSComparisonResult) compareBySuit:(PokerCard *) otherCard
{
    return [self.cardSuit compare: otherCard.cardSuit];
}

-(NSComparisonResult) compareByFace:(PokerCard *) otherCard
{
    if( self.cardValue < otherCard.cardValue)
        return NSOrderedAscending;
    else if (self.cardValue > otherCard.cardValue)
        return NSOrderedDescending;
    
    return NSOrderedSame;
}

-(NSString *) description
{
    return [ NSString stringWithFormat: @"Suit: %@ Value: %i", self.cardSuit, self.cardValue ];
}

@end
