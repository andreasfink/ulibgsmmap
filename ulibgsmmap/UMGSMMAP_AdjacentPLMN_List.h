//
//  UMGSMMAP_AdjacentPLMN_List.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 14.07.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>
#import <ulibgsmmap/UMGSMMAP_PLMN_Id.h>

@interface UMGSMMAP_AdjacentPLMN_List : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
    NSString        *_operationName;
    NSMutableArray  *_sequenceEntries;
}

@property(readwrite,strong) NSString *operationName;

- (void)processBeforeEncode;
- (UMGSMMAP_AdjacentPLMN_List *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMGSMMAP_AdjacentPLMN_List *)initWithString:(NSString *)str;

@property(readwrite,strong,atomic) NSMutableArray *sequenceEntries;

@end
