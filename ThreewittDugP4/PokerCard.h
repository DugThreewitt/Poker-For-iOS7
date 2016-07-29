//
//  PokerCard.h
//  ThreewittDugP4
//
//  Created by CS 4220 on 7/26/16.
//  Copyright © 2016 CS 4220. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PokerCard : NSObject

@property int cardValue;
@property NSString *cardSuit;
@property UIImage *cardFace;
@property BOOL hold;

-(instancetype) initWithSuit: (NSString *) s AndValue: (int) v AndFaceImage: (UIImage*) img;

-(NSComparisonResult) compareBySuit:(PokerCard *) otherCard;
-(NSComparisonResult) compareByFace:(PokerCard *) otherCard;

@end
