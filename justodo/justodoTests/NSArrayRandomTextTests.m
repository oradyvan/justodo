//
//  NSArrayRandomTextTests.m
//  justodo
//
//  Created by Oleksiy Radyvanyuk on 5/23/13.
//  Copyright (c) 2013 Oleksiy Radyvanyuk. All rights reserved.
//

#import "NSArrayRandomTextTests.h"
#import "NSArray+RandomText.h"

@implementation NSArrayRandomTextTests

- (void)testArrayOfRandomSentences {
    const NSUInteger numberOfSentences = 100U;
    NSArray *array = [NSArray generateRandomTextStringsWithCount:numberOfSentences];

    STAssertNotNil(array, @"Must return non-nil array");
    STAssertTrue([array count] > 0, @"Must return non-empty array");
    STAssertEquals([array count], numberOfSentences, @"Must return exactly %u sentences", numberOfSentences);
}

@end
