//
//  UMGSMMAP_SS_EventSpecification.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_SS_EventSpecification.h>

@implementation UMGSMMAP_SS_EventSpecification

@synthesize operationName;
@synthesize sequenceEntries;

- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	for(id entry in sequenceEntries)
	{
		[asn1_list addObject:entry];
	}
}


- (UMGSMMAP_SS_EventSpecification *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_SS_EventSpecification"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	sequenceEntries = [[NSMutableArray alloc]init];
	while(o)
	{
		[sequenceEntries addObject:o];
		o = [self getObjectAtPosition:p++];
	}
	return self;
}

- (NSString *) objectName
{
	return @"SS-EventSpecification";
}
- (id) objectValue
{
	 return sequenceEntries;
}
@end
