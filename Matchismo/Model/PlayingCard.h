//
//  PlayingCard.h
//  Matchismo
//
//  Created by Tyler Benziger on 7/22/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
