//
//  UMGSMMAP_LCS_PrivacyClass.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_LCS_PrivacyClass.h>

@implementation UMGSMMAP_LCS_PrivacyClass


@synthesize	operationName;
@synthesize	ss_Code;
@synthesize	ss_Status;
@synthesize	notificationToMSUser;
@synthesize	externalClientList;
@synthesize	plmnClientList;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ss_Code)
	{
		[asn1_list addObject:ss_Code];
	}
	if(ss_Status)
	{
		[asn1_list addObject:ss_Status];
	}
	if(notificationToMSUser)
	{
		notificationToMSUser.asn1_tag.tagNumber = 0;
		notificationToMSUser.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:notificationToMSUser];
	}
	if(externalClientList)
	{
		externalClientList.asn1_tag.tagNumber = 1;
		externalClientList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:externalClientList];
	}
	if(plmnClientList)
	{
		plmnClientList.asn1_tag.tagNumber = 2;
		plmnClientList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:plmnClientList];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 3;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_LCS_PrivacyClass *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_LCS_PrivacyClass"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		ss_Code = [[UMGSMMAP_SS_Code alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		ss_Status = [[UMGSMMAP_Ext_SS_Status alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		notificationToMSUser = [[UMGSMMAP_NotificationToMSUser alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		externalClientList = [[UMGSMMAP_ExternalClientList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		plmnClientList = [[UMGSMMAP_PLMNClientList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"LCS-PrivacyClass";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ss_Code)
	{
		dict[@"ss-Code"] = ss_Code.objectValue;
	}
	if(ss_Status)
	{
		dict[@"ss-Status"] = ss_Status.objectValue;
	}
	if(notificationToMSUser)
	{
		dict[@"notificationToMSUser"] = notificationToMSUser.objectValue;
	}
	if(externalClientList)
	{
		dict[@"externalClientList"] = externalClientList.objectValue;
	}
	if(plmnClientList)
	{
		dict[@"plmnClientList"] = plmnClientList.objectValue;
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

