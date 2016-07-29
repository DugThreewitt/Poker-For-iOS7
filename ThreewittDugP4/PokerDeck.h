//
//  PokerDeck.h
//  ThreewittDugP4
//
//  Created by CS 4220 on 7/26/16.
//  Copyright © 2016 CS 4220. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PokerCard.h"

@interface PokerDeck : NSObject

@property NSMutableArray *cards;
@property NSMutableArray *images;

-(void) print;
-(void) shuffleDeck;


@end
