//
//  NSArray+RandomText.m
//  justodo
//
//  Created by Oleksiy Radyvanyuk on 5/23/13.
//  Copyright (c) 2013 Oleksiy Radyvanyuk. All rights reserved.
//

#import "NSArray+RandomText.h"
#import "NSString+RandomText.h"

@implementation NSArray (RandomText)

+ (void)initialize {
    if (self == [NSArray class]) {
        // seeding random numbers generator
        srandom((unsigned int)[NSDate timeIntervalSinceReferenceDate]);
    }
}

+ (NSArray *)generateRandomTextStringsWithCount:(NSUInteger)numberOfStrings {
    // create array of string composed in format of:
    // <verb> <noun> <preposition> <adjective> <noun>

    // initializing storage array
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:numberOfStrings];

    for (NSUInteger i = 0; i < numberOfStrings; i++) {
        // building sentence with all the random words
        NSString *sentence = [NSString randomTextString];

        // adding it to the resulting array
        [result addObject:sentence];
    }

    return result;
}

@end
