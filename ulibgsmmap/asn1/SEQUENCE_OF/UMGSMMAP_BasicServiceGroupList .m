//
//  UMGSMMAP_BasicServiceGroupList .m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_BasicServiceGroupList .h"

@implementation UMGSMMAP_BasicServiceGroupList 

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


- (UMGSMMAP_BasicServiceGroupList  *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_BasicServiceGroupList "];
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
	return @"BasicServiceGroupList ";
}
- (id) objectValue
{
	 return sequenceEntries;
}
@end
