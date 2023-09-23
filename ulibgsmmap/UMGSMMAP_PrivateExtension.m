//
//  UMGSMMAP_PrivateExtension.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_PrivateExtension.h>
#import <ulibgsmmap/UMGSMMAP_FTSExtensionList.h>
#import <ulibgsmmap/UMGSMMAP_FTSExtension.h>

@implementation UMGSMMAP_PrivateExtension


@synthesize	operationName;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
    if(_extId)
    {
        [_asn1_list addObject:_extId];
    }
    if(_extensionData)
    {
        _extensionData.asn1_tag.tagNumber = 1;
        _extensionData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_extensionData];
    }
}

- (UMGSMMAP_PrivateExtension *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
    if((o) && (o.asn1_tag.tagClass == UMASN1Class_Universal) && (o.asn1_tag.tagNumber == UMASN1Primitive_object_identifier))
    {
        _extId = [[UMASN1ObjectIdentifier alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific) && (o.asn1_tag.tagNumber == 1))
    {
        NSString *oid = [_extId oidString];
        if([oid isEqualToString:FTS_OID])
        {
            _extensionData = [[UMGSMMAP_FTSExtensionList alloc]initWithASN1Object:o context:context];
        }
        else
        {
            _extensionData = o;
        }
    }
	return self;
}

- (NSString *) objectName
{
	return @"PrivateExtension";
}

- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_extId)
    {
        dict[@"extId"] = _extId.objectValue;
    }
    if(_extensionData)
    {
        dict[@"extensionData"] = _extensionData.objectValue;
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

