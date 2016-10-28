//
//  UMGSMMAP_ExternalClient.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_ExternalClient.h"

@implementation UMGSMMAP_ExternalClient


@synthesize	operationName;
@synthesize	clientIdentity;
@synthesize	gmlc_Restriction;
@synthesize	notificationToMSUser;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(clientIdentity)
	{
		[asn1_list addObject:clientIdentity];
	}
	if(gmlc_Restriction)
	{
		gmlc_Restriction.asn1_tag.tagNumber = 0;
		gmlc_Restriction.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:gmlc_Restriction];
	}
	if(notificationToMSUser)
	{
		notificationToMSUser.asn1_tag.tagNumber = 1;
		notificationToMSUser.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:notificationToMSUser];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 2;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_ExternalClient *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		clientIdentity = [[UMGSMMAP_LCSClientExternalID alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		gmlc_Restriction = [[UMGSMMAP_GMLC_Restriction alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		notificationToMSUser = [[UMGSMMAP_NotificationToMSUser alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
	return @"ExternalClient";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(clientIdentity)
	{
		dict[@"clientIdentity"] = clientIdentity.objectValue;
	}
	if(gmlc_Restriction)
	{
		dict[@"gmlc-Restriction"] = gmlc_Restriction.objectValue;
	}
	if(notificationToMSUser)
	{
		dict[@"notificationToMSUser"] = notificationToMSUser.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	return dict;
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end

