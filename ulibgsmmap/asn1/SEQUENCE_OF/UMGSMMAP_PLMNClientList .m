//
//  UMGSMMAP_PLMNClientList .m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_PLMNClientList .h>

@implementation UMGSMMAP_PLMNClientList 

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


- (UMGSMMAP_PLMNClientList  *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_PLMNClientList "];
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
	return @"PLMNClientList ";
}
- (id) objectValue
{
	 return sequenceEntries;
}
@end
