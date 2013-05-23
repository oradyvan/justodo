//
//  TODOActionTests.m
//  justodo
//
//  Created by Oleksiy Radyvanyuk on 5/23/13.
//  Copyright (c) 2013 Oleksiy Radyvanyuk. All rights reserved.
//

#import "TODOActionTests.h"
#import "TODOAction.h"
#import "NSString+UUID.h"
#import "NSString+RandomText.h"

@implementation TODOActionTests

- (void)testXMLParsing {
    // creating 3 different types of TODO actions

    // New TODO item:
    TODOAction *actionNew = [[TODOAction alloc] init];
    actionNew.type = TODOActionNew;
    actionNew.slug = [NSString UUIDString];
    actionNew.text = [NSString randomTextString];

    // Updated TODO item:
    TODOAction *actionUpdated = [[TODOAction alloc] init];
    actionUpdated.type = TODOActionUpdated;
    actionUpdated.slug = [NSString UUIDString];
    actionUpdated.text = [NSString randomTextString];
    actionUpdated.completed = TODOCompletionDone;
    actionUpdated.order = 10;

    // Deleted TODO item:
    TODOAction *actionDeleted = [[TODOAction alloc] init];
    actionDeleted.type = TODOActionDeleted;
    actionDeleted.slug = [NSString UUIDString];

    // building XML file with the above actions
    NSMutableString *xmlActions = [NSMutableString string];
    [xmlActions appendString:@"<?xml encoding=\"UTF-8\" standalone=\"YES\"?>\n"];
    [xmlActions appendString:@"<actions>\n"];
    [xmlActions appendFormat:@"\t%@\n", [actionNew xmlString]];
    [xmlActions appendFormat:@"\t%@\n", [actionUpdated xmlString]];
    [xmlActions appendFormat:@"\t%@\n", [actionDeleted xmlString]];
    [xmlActions appendString:@"</actions>\n"];

    NSLog(@"%@", xmlActions);
}

@end
