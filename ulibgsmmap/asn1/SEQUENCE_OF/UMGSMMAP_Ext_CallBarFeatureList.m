//
//  UMGSMMAP_Ext_CallBarFeatureList.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_Ext_CallBarFeatureList.h>

@implementation UMGSMMAP_Ext_CallBarFeatureList

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


- (UMGSMMAP_Ext_CallBarFeatureList *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_Ext_CallBarFeatureList"];
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
	return @"Ext-CallBarFeatureList";
}
- (id) objectValue
{
	 return sequenceEntries;
}
@end
