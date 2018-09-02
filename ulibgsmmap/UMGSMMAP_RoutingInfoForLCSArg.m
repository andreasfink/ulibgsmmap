//
//  UMGSMMAP_RoutingInfoForLCSArg.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 29/04/16.
//
//

#import "UMGSMMAP_RoutingInfoForLCSArg.h"

@implementation UMGSMMAP_RoutingInfoForLCSArg


@synthesize mlcNumber;
@synthesize targetMS;
@synthesize extensionContainer;


- (void)processBeforeEncode
{
    [super processBeforeEncode];
    
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    
    if(mlcNumber == NULL)
    {
        @throw([NSException exceptionWithName:@"mlcNumber is missing in RoutingInfoForLCSArg" reason:NULL userInfo:@{@"backtrace": UMBacktrace(NULL,0)}] );
    }
    if(targetMS == NULL)
    {
        @throw([NSException exceptionWithName:@"targetMS is missing in RoutingInfoForLCSArg" reason:NULL userInfo:@{@"backtrace": UMBacktrace(NULL,0)}] );
    }
    
    mlcNumber.asn1_tag.tagNumber = 0;
    mlcNumber.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
    [_asn1_list addObject:mlcNumber];

    targetMS.asn1_tag.tagNumber = 1;
    targetMS.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
    [_asn1_list addObject:targetMS];

    if(extensionContainer)
    {
        extensionContainer.asn1_tag.tagNumber = 2;
        extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:extensionContainer];
    }
}

- (UMGSMMAP_RoutingInfoForLCSArg *)processAfterDecodeWithContext:(id)context
{    
    int pos =0;
    UMASN1Object *o = [self getObjectAtPosition:pos++];
    if(o==NULL)
    {
        @throw([NSException exceptionWithName:@"mlcNumber is missing in RoutingInfoForLCSArg" reason:NULL userInfo:@{@"backtrace": UMBacktrace(NULL,0)}] );
    }
    if(o.asn1_tag.tagNumber !=0)
    {
        @throw([NSException exceptionWithName:@"unexpected tag  instead of mlcNumber[0] in RoutingInfoForLCSArg" reason:NULL userInfo:@{@"backtrace": UMBacktrace(NULL,0)}] );
    }
    mlcNumber = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
    
    
    o = [self getObjectAtPosition:pos++];
    if(o==NULL)
    {
        @throw([NSException exceptionWithName:@"targetMS is missing in RoutingInfoForLCSArg" reason:NULL userInfo:@{@"backtrace": UMBacktrace(NULL,0)}] );
    }
    if(o.asn1_tag.tagNumber !=1)
    {
        @throw([NSException exceptionWithName:@"unexpected tag number instead of targetMS[1] in RoutingInfoForLCSArg" reason:NULL userInfo:@{@"backtrace": UMBacktrace(NULL,0)}] );
    }
    targetMS = [[UMGSMMAP_SubscriberIdentity alloc]initWithASN1Object:o context:context];
    
    o = [self getObjectAtPosition:pos++];
    if((o) && (o.asn1_tag.tagNumber == 2))
    {
        extensionContainer =[[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
    }
    return self;
}

- (NSString *)objectName
{
    return @"RoutingInfoForLCSArg";
}

- (id)objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    
    if(mlcNumber)
    {
        dict[@"mlcNumber"] = mlcNumber.objectValue;
    }
    if(targetMS)
    {
        dict[@"targetMS"] = targetMS.objectValue;
    }
    if(extensionContainer)
    {
        dict[@"extensionContainer"] = extensionContainer.objectValue;
    }
    return dict;
}
@end
