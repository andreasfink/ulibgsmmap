//
//  UMGSMMAP_ResetArg.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_SendingNode_Number.h"
#import "UMGSMMAP_HLR_List.h"
#import "UMGSMMAP_Reset_Id_List.h"
#import "UMGSMMAP_InsertSubscriberDataArg.h"
#import "UMGSMMAP_DeleteSubscriberDataArg.h"

@interface UMGSMMAP_ResetArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString                            *operationName;
    UMGSMMAP_SendingNode_Number         *_sendingNodenumber;
    UMGSMMAP_HLR_List                   *_hlr_List;
    UMGSMMAP_Reset_Id_List              *_reset_Id_List;
    UMGSMMAP_InsertSubscriberDataArg    *_subscriptionData;
    UMGSMMAP_DeleteSubscriberDataArg    *_subscriptionDataDeletion;
}

@property(readwrite,strong)    NSString *operationName;
@property(readwrite,strong)    UMGSMMAP_SendingNode_Number         *sendingNodenumber;
@property(readwrite,strong)    UMGSMMAP_HLR_List                   *hlr_List;
@property(readwrite,strong)    UMGSMMAP_Reset_Id_List              *reset_Id_List;
@property(readwrite,strong)    UMGSMMAP_InsertSubscriberDataArg    *subscriptionData;
@property(readwrite,strong)    UMGSMMAP_DeleteSubscriberDataArg     *subscriptionDataDeletion;


- (void)processBeforeEncode;
- (UMGSMMAP_ResetArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end
