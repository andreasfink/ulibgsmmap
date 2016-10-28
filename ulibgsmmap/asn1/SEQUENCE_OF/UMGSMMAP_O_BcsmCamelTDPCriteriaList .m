//
//  UMGSMMAP_O_BcsmCamelTDPCriteriaList .m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_O_BcsmCamelTDPCriteriaList .h"

@implementation UMGSMMAP_O_BcsmCamelTDPCriteriaList 

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


- (UMGSMMAP_O_BcsmCamelTDPCriteriaList  *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_O_BcsmCamelTDPCriteriaList "];
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
	return @"O-BcsmCamelTDPCriteriaList ";
}
- (id) objectValue
{
	 return sequenceEntries;
}
@end
