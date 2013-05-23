//
//  TODOAction.h
//  justodo
//
//  Created by Oleksiy Radyvanyuk on 5/23/13.
//  Copyright (c) 2013 Oleksiy Radyvanyuk. All rights reserved.
//
//  This non-persisted class describes an action user performed on a TODO item.
//  The actions must be applied against the TODO list or against the list of other actions
//  when there is a need to synchronize two separate lists of actions.

#import <Foundation/Foundation.h>

typedef enum {
    TODOActionNew,
    TODOActionUpdated,
    TODOActionDeleted
} TODOActionType;

typedef enum {
    TODOCompletionNone,
    TODOCompletionDone,
    TODOCompletionUndone
} TODOCompletion;

@interface TODOAction : NSObject

@property (nonatomic) TODOActionType type; // type of action: new TODO item, updated TODO item, deleted TODO item
@property (nonatomic) NSString *slug; // unique ID of the TODO item on which the action was taken
@property (nonatomic) NSString *text; // optional, text changed for TODO item
@property (nonatomic) NSInteger order;  // optional, order number of TODO item in the TODO list
@property (nonatomic) TODOCompletion completed; // optional, flag describing if TODO item is completed (YES) or still pending (NO), or unknown (NONE)

- (id)initWithTypeString:(NSString *)typeString andAttributesDict:(NSDictionary *)dict; // constructor to be used while parsing action from XML
- (NSString *)typeString;
- (NSString *)xmlString; // XML representation of an action, for networking exchange

@end
