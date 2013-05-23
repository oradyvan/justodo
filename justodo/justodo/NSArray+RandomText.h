//
//  NSArray+RandomText.h
//  justodo
//
//  Created by Oleksiy Radyvanyuk on 5/23/13.
//  Copyright (c) 2013 Oleksiy Radyvanyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (RandomText)

+ (NSArray *)generateRandomTextStringsWithCount:(NSUInteger)numberOfStrings;

@end
