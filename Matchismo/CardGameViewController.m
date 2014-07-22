//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Tyler Benziger on 7/22/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "Card.h"
#import "PlayingCard.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@end

@implementation CardGameViewController

- (Deck *)deck
{
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flipCount changed to %d", self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    Card *card = [self.deck drawRandomCard];

    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else if (card) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];

        // Display contents red (hearts & diamonds) vs black (spades & clubs)
        if ([@[@"♥", @"♦"] containsObject:((PlayingCard *)card).suit]) {
            [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        } else {
            [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }

        [sender setTitle:card.contents forState:UIControlStateNormal];
    }
    self.flipCount++;
}

@end
