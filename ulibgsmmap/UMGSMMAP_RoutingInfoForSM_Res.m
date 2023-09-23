//
//  UMGSMMAP_RoutingInfoForSM_Res.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 19.04.16.
//
//

#import <ulibgsmmap/UMGSMMAP_RoutingInfoForSM_Res.h>


/*
 RoutingInfoForSM-Res ::= SEQUENCE
 {
	imsi					IMSI,
	locationInfoWithLMSI	[0] IMPLICIT SEQUENCE {
 networkNode-Number		[1] IMPLICIT ISDN-AddressString,
 lmsi					LMSI			OPTIONAL,
 extensionContainer		ExtensionContainer	OPTIONAL,
 ...,
 gprsNodeIndicator		[5]	NULL		OPTIONAL,
 -- gprsNodeIndicator is set only if the SGSN number is sent as the
 -- Network Node Number
 additional-Number		[6] Additional-Number	OPTIONAL
 -- NetworkNode-number can be either msc-number or sgsn-number
 } ,
	extensionContainer		[4] ExtensionContainer	OPTIONAL,
	...
 }

 */

@implementation UMGSMMAP_RoutingInfoForSM_Res

@synthesize imsi;
@synthesize locationInfoWithLMSI;
@synthesize extensionContainer;


- (void)processBeforeEncode
{
    [super processBeforeEncode];
    
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    
    if(imsi == NULL)
    {
        @throw([NSException exceptionWithName:@"imsi is missing in RoutingInfoForSM_Res" reason:NULL userInfo:@{@"backtrace": UMBacktrace(NULL,0)}] );
    }
    if(locationInfoWithLMSI == NULL)
    {
        @throw([NSException exceptionWithName:@"locationInfoWithLMSI is missing in RoutingInfoForSM_Res" reason:NULL userInfo:@{@"backtrace": UMBacktrace(NULL,0)}] );
    }
    
    //imsi.asn1_tag.tagNumber = 0;
    //imsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
    [_asn1_list addObject:imsi];
    
    if(locationInfoWithLMSI == NULL)
    {
        @throw([NSException exceptionWithName:@"locationInfoWithLMSI is missing in RoutingInfoForSM_Res" reason:NULL userInfo:@{@"backtrace": UMBacktrace(NULL,0)}] );
    }
    locationInfoWithLMSI.asn1_tag.tagNumber = 0;
    locationInfoWithLMSI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;

    [_asn1_list addObject:locationInfoWithLMSI];
    
     if(extensionContainer)
    {
        extensionContainer.asn1_tag.tagNumber = 4;
        extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:extensionContainer];
    }
}

- (UMGSMMAP_RoutingInfoForSM_Res *)processAfterDecodeWithContext:(id)context
{    
    UMASN1Object *o = [self getObjectAtPosition:0];
    if(o==NULL)
    {
        @throw([NSException exceptionWithName:@"imsi is missing in RoutingInfoForSM_Res" reason:NULL userInfo:@{@"backtrace": UMBacktrace(NULL,0)}] );
    }
    imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
    
    
    o = [self getObjectAtPosition:1];
    if(o==NULL)
    {
        @throw([NSException exceptionWithName:@"locationInfoWithLMSI is missing in RoutingInfoForSM_Res" reason:NULL userInfo:@{@"backtrace": UMBacktrace(NULL,0)}] );
    }
    locationInfoWithLMSI = [[UMGSMMAP_LocationInfoWithLMSI alloc]initWithASN1Object:o context:context];

    o = [self getObjectAtPosition:2];
    if(o)
    {
        extensionContainer =[[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
    }
    return self;
}

- (NSString *)objectName
{
    return @"RoutingInfoForSM_Res";
}

- (id)objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    
    if(imsi)
    {
        dict[@"imsi"] = imsi.objectValue;
    }
    if(locationInfoWithLMSI)
    {
        dict[@"locationInfoWithLMSI"] = locationInfoWithLMSI.objectValue;
    }
     if(extensionContainer)
    {
        dict[@"extensionContainer"] = extensionContainer.objectValue;
    }
    return dict;
}
@end
