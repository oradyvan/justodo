//
//  TODOAction.m
//  justodo
//
//  Created by Oleksiy Radyvanyuk on 5/23/13.
//  Copyright (c) 2013 Oleksiy Radyvanyuk. All rights reserved.
//

#import "TODOAction.h"

NSString *const kTagNew = @"new";
NSString *const kTagUpdated = @"updated";
NSString *const kTagDeleted = @"deleted";
NSString *const kTagSlug = @"slug";
NSString *const kTagText = @"text";
NSString *const kTagOrder = @"order";
NSString *const kTagCompleted = @"completed";

@implementation TODOAction

- (id)init {
    if (self = [super init]) {
        // setting some defaults for the action
        self.type = TODOActionNew;
        self.order = -1;
        self.completed = TODOCompletionNone;
    }
    return self;
}

- (id)initWithTypeString:(NSString *)typeString andAttributesDict:(NSDictionary *)dict {
    if (self = [self init]) {
        // trying recognize action type tag
        if ([typeString isEqualToString:kTagNew]) {
            self.type = TODOActionNew;
        }
        else if ([typeString isEqualToString:kTagUpdated]) {
            self.type = TODOActionUpdated;
        }
        else if ([typeString isEqualToString:kTagDeleted]) {
            self.type = TODOActionDeleted;
        }
        else {
            // oh, it seems we have been given incorrect tag! dying...
            return nil;
        }

        // proceeding with the rest of the action values passed in attributes dictionary
        NSString *slug = [dict objectForKey:kTagSlug];
        if ([slug length] > 0) {
            self.slug = slug;
        }

        NSString *text = [dict objectForKey:kTagText];
        if ([text length] > 0) {
            self.text = text;
        }

        NSNumber *order = [dict objectForKey:kTagOrder];
        if (nil != order) {
            self.order = [order integerValue];
        }

        NSNumber *completed = [dict objectForKey:kTagCompleted];
        if (nil != completed) {
            self.completed = [completed boolValue] ? TODOCompletionDone : TODOCompletionUndone;
        }
    }
    return self;
}

- (NSString *)typeString {
    switch (self.type) {
        case TODOActionNew:     return kTagNew;
        case TODOActionUpdated: return kTagUpdated;
        case TODOActionDeleted: return kTagDeleted;
        default:                return nil;
    }
}

- (NSString *)xmlString {
    NSMutableString *result = [NSMutableString stringWithFormat:@"<%@", [self typeString]];

    if (nil != self.slug) {
        [result appendFormat:@" %@=\"%@\"", kTagSlug, self.slug];
    }

    if (nil != self.text) {
        [result appendFormat:@" %@=\"%@\"", kTagText, self.text];
    }

    if (0 <= self.order) {
        [result appendFormat:@" %@=\"%d\"", kTagOrder, self.order];
    }

    if (TODOCompletionNone != self.completed) {
        [result appendFormat:@" %@=\"%@\"", kTagCompleted, TODOCompletionDone == self.completed ? @"YES" : @"NO"];
    }

    [result appendString:@"/>"];
    return result;
}

@end
