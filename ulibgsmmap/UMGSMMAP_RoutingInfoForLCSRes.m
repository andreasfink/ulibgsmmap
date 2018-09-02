//
//  UMGSMMAP_RoutingInfoForLCSRes.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 29/04/16.
//
//

#import "UMGSMMAP_RoutingInfoForLCSRes.h"

@implementation UMGSMMAP_RoutingInfoForLCSRes

@synthesize targetMS;
@synthesize lcsLocationInfo;
@synthesize extensionContainer;


- (void)processBeforeEncode
{
    [super processBeforeEncode];
    
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    
    if(targetMS == NULL)
    {
        @throw([NSException exceptionWithName:@"targetMS is missing in UMGSMMAP_RoutingInfoForLCSRes" reason:NULL userInfo:@{@"backtrace": UMBacktrace(NULL,0)}] );
    }
    if(lcsLocationInfo == NULL)
    {
        @throw([NSException exceptionWithName:@"lcsLocationInfo is missing in UMGSMMAP_RoutingInfoForLCSRes" reason:NULL userInfo:@{@"backtrace": UMBacktrace(NULL,0)}] );
    }
    
    targetMS.asn1_tag.tagNumber = 0;
    targetMS.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
    [_asn1_list addObject:targetMS];

    
    lcsLocationInfo.asn1_tag.tagNumber = 1;
    lcsLocationInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
    [_asn1_list addObject:lcsLocationInfo];

    if(extensionContainer)
    {
        extensionContainer.asn1_tag.tagNumber = 2;
        extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:extensionContainer];
    }
}

- (UMGSMMAP_RoutingInfoForLCSRes *)processAfterDecodeWithContext:(id)context
{
    int pos =0;
    UMASN1Object *o = [self getObjectAtPosition:pos++];
    if(o==NULL)
    {
        @throw([NSException exceptionWithName:@"targetMS is missing in UMGSMMAP_RoutingInfoForLCSRes" reason:NULL userInfo:@{@"backtrace": UMBacktrace(NULL,0)}] );
    }
    if(o.asn1_tag.tagNumber !=0)
    {
        @throw([NSException exceptionWithName:@"unexpected tag instead of targetMS[0] in UMGSMMAP_RoutingInfoForLCSRes" reason:NULL userInfo:@{@"backtrace": UMBacktrace(NULL,0)}] );
    }
    targetMS = [[UMGSMMAP_SubscriberIdentity alloc]initWithASN1Object:o context:context];
    
    
    o = [self getObjectAtPosition:pos++];
    if(o==NULL)
    {
        @throw([NSException exceptionWithName:@"lcsLocationInfo is missing in UMGSMMAP_RoutingInfoForLCSRes" reason:NULL userInfo:@{@"backtrace": UMBacktrace(NULL,0)}] );
    }
    if(o.asn1_tag.tagNumber !=1)
    {
        @throw([NSException exceptionWithName:@"unexpected tag number instead of lcsLocationInfo[1] in UMGSMMAP_RoutingInfoForLCSRes" reason:NULL userInfo:@{@"backtrace": UMBacktrace(NULL,0)}] );
    }
    lcsLocationInfo = [[UMGSMMAP_LCSLocationInfo alloc]initWithASN1Object:o context:context];
    
    o = [self getObjectAtPosition:pos++];
    if((o) && (o.asn1_tag.tagNumber == 2))
    {
        extensionContainer =[[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
    }
    return self;
}

- (NSString *)objectName
{
    return @"UMGSMMAP_RoutingInfoForLCSRes";
}

- (id)objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    
    
    if(targetMS)
    {
        dict[@"targetMS"] = targetMS.objectValue;
    }
    
    if(lcsLocationInfo)
    {
        dict[@"lcsLocationInfo"] = lcsLocationInfo.objectValue;
    }
    if(extensionContainer)
    {
        dict[@"extensionContainer"] = extensionContainer.objectValue;
    }
    return dict;
}
@end
