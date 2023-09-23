//
//  UMGSMMAP_RequestedEquipmentInfo.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 28.02.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/UMGSMMAP_RequestedEquipmentInfo.h>

@implementation UMGSMMAP_RequestedEquipmentInfo

- (NSString *) objectName
{
    return @"RequestedEquipmentInfo";
}

@synthesize operationName;


- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if([self bit:0])
    {
        dict[@"equipmentStatus"] = @(YES);
    }
    if([self bit:1])
    {
        dict[@"bmuef"] = @(YES);
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

- (BOOL)equipmentStatus
{
    return [self bit:0];
}
- (void)setEquipmentStatus:(BOOL)bit
{
    [self setBit:0 value:bit];
}

- (BOOL)bmuef
{
    return [self bit:1];
}

- (void)setBmuef:(BOOL)bit
{
    [self setBit:1 value:bit];
}

@end
