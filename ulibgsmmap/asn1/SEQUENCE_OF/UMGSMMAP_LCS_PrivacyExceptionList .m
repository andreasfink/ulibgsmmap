//
//  UMGSMMAP_LCS_PrivacyExceptionList .m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_LCS_PrivacyExceptionList .h>

@implementation UMGSMMAP_LCS_PrivacyExceptionList 

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


- (UMGSMMAP_LCS_PrivacyExceptionList  *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_LCS_PrivacyExceptionList "];
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
	return @"LCS-PrivacyExceptionList ";
}
- (id) objectValue
{
	 return sequenceEntries;
}
@end
