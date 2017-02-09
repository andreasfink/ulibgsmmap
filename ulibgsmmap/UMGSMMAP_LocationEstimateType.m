//
//  UMGSMMAP_LocationEstimateType.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_LocationEstimateType.h"

@implementation UMGSMMAP_LocationEstimateType

@synthesize operationName;
@synthesize enumValue;


- (NSString *) objectName
{
	return @"UMGSMMAP_LocationEstimateType";
}

- (UMGSMMAP_LocationEstimateTypeEnum) type
{
    if(enumValue == NULL)
    {
        enumValue = [[UMASN1Enumerated alloc]init];
    }
    return (UMGSMMAP_LocationEstimateTypeEnum) enumValue.value;
}

- (void)setType:(UMGSMMAP_LocationEstimateTypeEnum)t
{
    if(enumValue == NULL)
    {
        enumValue = [[UMASN1Enumerated alloc]init];
    }
    enumValue.value = t;
}


- (void) processBeforeEncode
{
    if(enumValue == NULL)
    {
        enumValue = [[UMASN1Enumerated alloc]init];
    }

    [super processBeforeEncode];
    [asn1_tag setTagIsPrimitive];
    asn1_data = enumValue.asn1_data;
}


- (UMGSMMAP_LocationEstimateType *) processAfterDecodeWithContext:(id)context
{
    return self;
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end
