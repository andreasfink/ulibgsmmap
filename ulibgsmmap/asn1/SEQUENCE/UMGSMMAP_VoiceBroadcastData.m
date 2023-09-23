//
//  UMGSMMAP_VoiceBroadcastData.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_VoiceBroadcastData.h>

@implementation UMGSMMAP_VoiceBroadcastData


@synthesize	operationName;
@synthesize	groupid;
@synthesize	broadcastInitEntitlement;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(groupid)
	{
		[asn1_list addObject:groupid];
	}
	if(broadcastInitEntitlement)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = -1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_VoiceBroadcastData *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_VoiceBroadcastData"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		groupid = [[UMGSMMAP_GroupId alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		broadcastInitEntitlement = YES;
		o = [self getObjectAtPosition:p++];
	}
	if(o)
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
	return @"VoiceBroadcastData";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(groupid)
	{
		dict[@"groupid"] = groupid.objectValue;
	}
	if(broadcastInitEntitlement)
	{
		dict[@"broadcastInitEntitlement"] = @(YES);
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

