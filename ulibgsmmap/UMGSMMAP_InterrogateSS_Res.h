//
//  UMGSMMAP_InterrogateSS_Res.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_SS_Status.h"
#import "UMGSMMAP_BasicServiceGroupList.h"
#import "UMGSMMAP_ForwardingFeatureList.h"
#import "UMGSMMAP_GenericServiceInfo.h"

@interface UMGSMMAP_InterrogateSS_Res : UMASN1Choice<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_SS_Status *ss_Status;
	UMGSMMAP_BasicServiceGroupList *basicServiceGroupList;
	UMGSMMAP_ForwardingFeatureList *forwardingFeatureList;
	UMGSMMAP_GenericServiceInfo *genericServiceInfo;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_SS_Status *ss_Status;
@property(readwrite,strong)	UMGSMMAP_BasicServiceGroupList *basicServiceGroupList;
@property(readwrite,strong)	UMGSMMAP_ForwardingFeatureList *forwardingFeatureList;
@property(readwrite,strong)	UMGSMMAP_GenericServiceInfo *genericServiceInfo;


- (void)processBeforeEncode;
- (UMGSMMAP_InterrogateSS_Res *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end
