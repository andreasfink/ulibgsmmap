//
//  UMGSMMAP_Eps_AuthenticationSetList .m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_Eps_AuthenticationSetList .h>

@implementation UMGSMMAP_Eps_AuthenticationSetList 

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


- (UMGSMMAP_Eps_AuthenticationSetList  *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_Eps_AuthenticationSetList "];
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
	return @"Eps-AuthenticationSetList ";
}
- (id) objectValue
{
	 return sequenceEntries;
}
@end
