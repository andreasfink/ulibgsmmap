//
//  UMGSMMAP_T_BcsmCamelTDPDataList .m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_T_BcsmCamelTDPDataList .h"

@implementation UMGSMMAP_T_BcsmCamelTDPDataList 

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


- (UMGSMMAP_T_BcsmCamelTDPDataList  *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_T_BcsmCamelTDPDataList "];
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
	return @"T-BcsmCamelTDPDataList ";
}
- (id) objectValue
{
	 return sequenceEntries;
}
@end
