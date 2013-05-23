//
//  NSString+RandomText.m
//  justodo
//
//  Created by Oleksiy Radyvanyuk on 5/23/13.
//  Copyright (c) 2013 Oleksiy Radyvanyuk. All rights reserved.
//

#import "NSString+RandomText.h"

NSString *const kVerbs[] = {
    @"Package",
    @"Contact",
    @"Visit",
    @"Rectify",
    @"Propose",
    @"Enter",
    @"Eat",
    @"Drink",
    @"Buy",
};
NSUInteger const kVerbsCount = sizeof(kVerbs) / sizeof(kVerbs[0]);

NSString *const kPreps[] = {
    @"From",
    @"To",
    @"By",
    @"At",
    @"In",
    @"With",
    @"For"
};
NSUInteger const kPrepsCount = sizeof(kPreps) / sizeof(kPreps[0]);

NSString *const kAdjectives[] = {
    @"Better",
    @"Wider",
    @"Greater",
    @"Deeper",
    @"Stronger",
    @"Longer",
    @"Louder",
    @"Farther",
    @"More"
};
NSUInteger const kAdjectivesCount = sizeof(kAdjectives) / sizeof(kAdjectives[0]);

NSString *const kNouns[] = {
    @"Creahoof",
    @"Soostev",
    @"Swopom",
    @"Grodsaar",
    @"Bumooxa",
    @"Safome",
    @"Burder",
    @"Olielle",
    @"Chillpal",
    @"Modgone",
    @"Sooprno",
    @"Johackle",
    @"Cazoova",
    @"Unelind",
    @"Gorealm",
    @"Digisol",
    @"Luwest",
    @"Roinad",
    @"Sorson",
    @"Bumola",
    @"Tomash",
    @"Pruvia",
    @"Wazzasoft",
    @"Ploosnar",
    @"Minivivi",
    @"Looplab",
    @"Grynn",
    @"Peloozoid",
    @"Sassee",
    @"Vallume",
    @"Boaconic",
    @"Voov",
    @"Nedril",
    @"Jovaphile",
    @"Swoquix",
    @"Glowl",
    @"Tribepop",
    @"Goocrux",
    @"Modeflick",
    @"Neoskizzle",
    @"Bopster",
    @"Locobot",
    @"Goulbap",
    @"Yokovich",
    @"Hioffpo",
    @"Momoweb",
    @"Ethosien",
    @"Mogotrevo"
};
NSUInteger const kNounsCount = sizeof(kNouns) / sizeof(kNouns[0]);

@implementation NSString (RandomText)

+ (NSString *)randomTextString {
    // obtaining random indexes and appropriate words
    NSUInteger index = (NSUInteger)((double)random() / LONG_MAX * kVerbsCount);
    NSString *randVerb = [kVerbs[index] capitalizedString];
    
    index = (NSUInteger)((double)random() / LONG_MAX * kNounsCount);
    NSString *randNoun1 = [kNouns[index] lowercaseString];
    
    index = (NSUInteger)((double)random() / LONG_MAX * kPrepsCount);
    NSString *randPrep = [kPreps[index] lowercaseString];
    
    index = (NSUInteger)((double)random() / LONG_MAX * kAdjectivesCount);
    NSString *randAdjective = [kAdjectives[index] lowercaseString];
    
    index = (NSUInteger)((double)random() / LONG_MAX * kNounsCount);
    NSString *randNoun2 = [kNouns[index] lowercaseString];
    
    // building sentence with all the random words
    return [NSString stringWithFormat:@"%@ %@ %@ %@ %@", randVerb, randNoun1, randPrep, randAdjective, randNoun2];
}

@end
