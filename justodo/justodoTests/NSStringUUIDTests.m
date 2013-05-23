//
//  justodoTests.m
//  justodoTests
//
//  Created by Oleksiy Radyvanyuk on 5/23/13.
//  Copyright (c) 2013 Oleksiy Radyvanyuk. All rights reserved.
//

#import "NSStringUUIDTests.h"
#import "NSString+UUID.h"

@implementation NSStringUUIDTests

- (void)testUniqueUUIDStrings {
    const NSUInteger numberOfUUIDStrings = 100;
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:numberOfUUIDStrings];

    // creating 100 UUID strings and storing them into array
    for (NSUInteger i = 0; i < numberOfUUIDStrings; i++) {
        [array addObject:[NSString UUIDString]];
    }

    // verifying that every UUID string in the array is unique
    while ([array count] > 0) {
        // taking last UUID string from the array...
        NSString *aString = [array lastObject];
        // ...and removing it from the array
        [array removeLastObject];
        // then, making sure the string is no longer present in the array
        STAssertFalse([array containsObject:aString], @"The string %@ should be unique", aString);
    }
}

@end
