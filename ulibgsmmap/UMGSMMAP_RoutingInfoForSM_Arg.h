//
//  UMGSMMAP_RoutingInfoForSM_Arg.h
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

#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_AddressString.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_SM_RP_MTI.h"
#import "UMGSMMAP_SM_RP_SMEA.h"
#import "UMGSMMAP_SM_DeliveryNotIntended.h"
#import "UMGSMMAP_IMSI.h"
#import "UMGSMMAP_CorrelationID.h"

@interface UMGSMMAP_RoutingInfoForSM_Arg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	UMGSMMAP_ISDN_AddressString     *_msisdn;
	UMASN1Boolean                   *_sm_RP_PRI;
	UMGSMMAP_AddressString          *_serviceCentreAddress;
	UMGSMMAP_ExtensionContainer     *_extensionContainer;
	BOOL                            _gprsSupportIndicator;
	UMGSMMAP_SM_RP_MTI              *_sm_RP_MTI;
	UMGSMMAP_SM_RP_SMEA             *_sm_RP_SMEA;
    UMGSMMAP_SM_DeliveryNotIntended *_sm_deliveryNotIndtended;
    BOOL                            _ip_sm_gwGuidanceIndicator;
    UMGSMMAP_IMSI                   *_imsi;
    BOOL                            _t4_Trigger_Indicator;
    BOOL                            _singleAttemptDelivery;
    UMGSMMAP_CorrelationID          *_correlationID;

}
@property(readwrite,strong) NSString                        *operationName;

@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString     *msisdn;
@property(readwrite,strong)	UMASN1Boolean                   *sm_RP_PRI;
@property(readwrite,strong)	UMGSMMAP_AddressString          *serviceCentreAddress;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer     *extensionContainer;
@property(readwrite,assign) BOOL                            gprsSupportIndicator;
@property(readwrite,strong) UMGSMMAP_SM_RP_MTI              *sm_RP_MTI;
@property(readwrite,strong) UMGSMMAP_SM_RP_SMEA             *sm_RP_SMEA;
@property(readwrite,strong) UMGSMMAP_SM_DeliveryNotIntended *sm_deliveryNotIndtended;
@property(readwrite,assign) BOOL                            ip_sm_gwGuidanceIndicator;
@property(readwrite,strong) UMGSMMAP_IMSI                   *imsi;
@property(readwrite,assign) BOOL                            t4_Trigger_Indicator;
@property(readwrite,assign) BOOL                            singleAttemptDelivery;
@property(readwrite,strong) UMGSMMAP_CorrelationID          *correlationID;


- (void)processBeforeEncode;
- (UMGSMMAP_RoutingInfoForSM_Arg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end
