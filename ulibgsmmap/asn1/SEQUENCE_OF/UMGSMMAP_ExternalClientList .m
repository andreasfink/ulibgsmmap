//
//  UMGSMMAP_ExternalClientList .m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_ExternalClientList .h"

@implementation UMGSMMAP_ExternalClientList 

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


- (UMGSMMAP_ExternalClientList  *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_ExternalClientList "];
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
	return @"ExternalClientList ";
}
- (id) objectValue
{
	 return sequenceEntries;
}
@end
