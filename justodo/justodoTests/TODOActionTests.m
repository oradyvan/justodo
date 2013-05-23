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

@implementation TODOActionTests {
    BOOL _inActionsTag;
    NSMutableArray *_parsedActions;
}

- (void)setUp {
    _inActionsTag = NO;
    _parsedActions = [NSMutableArray arrayWithCapacity:3];
}

- (void)tearDown {
    _parsedActions = nil;
}

- (void)matchAction:(TODOAction *)source withAction:(TODOAction *)destination {
    STAssertEquals(source.type, destination.type, @"\"%@\" types should match", [source typeString]);
    STAssertEqualObjects(source.slug, destination.slug, @"\"%@\" slugs should match", [source typeString]);
    STAssertEqualObjects(source.text, destination.text, @"\"%@\" texts should match", [source typeString]);
    STAssertEquals(source.completed, destination.completed, @"\"%@\" completions should match", [source typeString]);
    STAssertEquals(source.order, destination.order, @"\"%@\" orders should match", [source typeString]);
}

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
    [xmlActions appendString:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"];
    [xmlActions appendString:@"<actions>\n"];
    [xmlActions appendFormat:@"\t%@\n", [actionNew xmlString]];
    [xmlActions appendFormat:@"\t%@\n", [actionUpdated xmlString]];
    [xmlActions appendFormat:@"\t%@\n", [actionDeleted xmlString]];
    // adding some dummy tag that should not result in creating an action
    [xmlActions appendString:@"\t<junk slug=\"dummy\" text=\"placeholder\" completed=\"YES\"/>\n"];
    [xmlActions appendString:@"</actions>\n"];

    // creating standard XML parser and parsing the actions list
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:[xmlActions dataUsingEncoding:NSUTF8StringEncoding]];
    parser.delegate = self;
    [parser parse];

    NSError *error = [parser parserError];
    STAssertNil(error, @"%@", error);

    STAssertFalse(_inActionsTag, @"Should completed parsing \"actions\" tag of the XML document");
    STAssertEquals([_parsedActions count], 3U, @"Should parsed all 3 actions from XML");

    // verifying New action:
    TODOAction *parsedNew = [_parsedActions objectAtIndex:0U];
    [self matchAction:actionNew withAction:parsedNew];

    // verifying Updated action:
    TODOAction *parsedUpdated = [_parsedActions objectAtIndex:1U];
    [self matchAction:actionUpdated withAction:parsedUpdated];

    // verifying Deleted action:
    TODOAction *parsedDeleted = [_parsedActions objectAtIndex:2U];
    [self matchAction:actionDeleted withAction:parsedDeleted];
}

#pragma mark - NSXMLParserDelegate methods

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if (_inActionsTag) {
        TODOAction *anAction = [[TODOAction alloc] initWithTypeString:elementName andAttributesDict:attributeDict];
        if (nil != anAction) {
            [_parsedActions addObject:anAction];
        }
    }
    else if ([elementName isEqualToString:@"actions"]) {
        _inActionsTag = YES;
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if (_inActionsTag && [elementName isEqualToString:@"actions"]) {
        _inActionsTag = NO;
    }
}

@end
