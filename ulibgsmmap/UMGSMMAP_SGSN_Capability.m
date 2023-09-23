//
//  UMGSMMAP_SGSN_Capability.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_SGSN_Capability.h>

@implementation UMGSMMAP_SGSN_Capability


@synthesize	operationName;
@synthesize	solsaSupportIndicator;
@synthesize	extensionContainer;

- (UMGSMMAP_SGSN_Capability *)initWithString:(NSString *)string
{
    self = [super init];
    if(self)
    {
        NSArray *a = [string componentsSeparatedByString:@","];
        for(NSString *s in a)
        {
            NSString *var=NULL;
            NSString *val = NULL;
            NSArray *b = [s componentsSeparatedByString:@"="];
            if(b.count == 1)
            {
                var = b[0];
            }
            if(b.count >= 2)
            {
                var = b[0];
                val = b[1];
            }
            if([var isEqualToString:@"solsa-support-indicator"])
            {
                solsaSupportIndicator = [val boolValue];
            }
        
        }
    }
    return self;
}

- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(solsaSupportIndicator)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = -1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 1;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_SGSN_Capability *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		solsaSupportIndicator = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
        /* ... */
        o = [self getObjectAtPosition:p++];
    }
	return self;
}

- (NSString *) objectName
{
	return @"SGSN-Capability";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(solsaSupportIndicator)
	{
		dict[@"solsaSupportIndicator"] = @(YES);
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	return dict;
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end

