//
//  NSString+UUID.m
//  justodo
//
//  Created by Oleksiy Radyvanyuk on 5/23/13.
//  Copyright (c) 2013 Oleksiy Radyvanyuk. All rights reserved.
//

#import "NSString+UUID.h"

@implementation NSString (UUID)

+ (NSString *)UUIDString {
    CFUUIDRef UIDRef;
    NSString *uidString;
    UIDRef = CFUUIDCreate(NULL);
    uidString = (NSString *)CFBridgingRelease(CFUUIDCreateString(NULL, UIDRef));
    CFRelease(UIDRef);
    return uidString;
}

@end
