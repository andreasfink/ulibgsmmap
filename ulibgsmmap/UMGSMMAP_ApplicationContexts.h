//
//  UMGSMMAP_ApplicationContexts.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 29/04/16.
//
//

#import <ulibasn1/ulibasn1.h>


typedef enum UMGSMMAP_ApplicationContext
{
    UMGSMMAP_ApplicationContext_undefined = 0,
    UMGSMMAP_ApplicationContext_networkLocUpContext = 1,
    UMGSMMAP_ApplicationContext_locationCancellationContext = 2,
    UMGSMMAP_ApplicationContext_roamingNumberEnquiryContext = 3,
    UMGSMMAP_ApplicationContext_istAlertingContext = 4,
    UMGSMMAP_ApplicationContext_locationInfoRetrievalContext = 5,
    UMGSMMAP_ApplicationContext_callControlTransfer = 6,
    UMGSMMAP_ApplicationContext_reportingContext = 7,
    UMGSMMAP_ApplicationContext_callCompletionContext = 8,
    UMGSMMAP_ApplicationContext_serviceTerminationContext = 9,
    UMGSMMAP_ApplicationContext_resetContext = 10,
    UMGSMMAP_ApplicationContext_handoverControlContext = 11,
    UMGSMMAP_ApplicationContext_sIWFSAllocationContext = 12,
    UMGSMMAP_ApplicationContext_equipmentMngtContext = 13,
    UMGSMMAP_ApplicationContext_infoRetrievalContext = 14,
    UMGSMMAP_ApplicationContext_interVlrInfoRetrievalContext = 15,
    UMGSMMAP_ApplicationContext_subscriberDataMngtContext = 16,
    UMGSMMAP_ApplicationContext_tracingContext = 17,
    UMGSMMAP_ApplicationContext_networkFunctionalSsContext = 18,
    UMGSMMAP_ApplicationContext_networkUnstructuredSsContext = 19,
    UMGSMMAP_ApplicationContext_shortMsgGatewayContext = 20,
    UMGSMMAP_ApplicationContext_shortMsgMO_RelayContext = 21,
    UMGSMMAP_ApplicationContext_subscriberDataModificationNotificationContext = 22,
    UMGSMMAP_ApplicationContext_shortMsgAlertContext = 23,
    UMGSMMAP_ApplicationContext_mwdMngtContext = 24,
    UMGSMMAP_ApplicationContext_shortMsgMT_RelayContext = 25,
    UMGSMMAP_ApplicationContext_imsiRetrievalContext = 26,
    UMGSMMAP_ApplicationContext_msPurgingContext = 27,
    UMGSMMAP_ApplicationContext_subscriberInfoEnquiryContext = 28,
    UMGSMMAP_ApplicationContext_anyTimeInfoEnquiry = 29,
    UMGSMMAP_ApplicationContext_groupCallControlContext = 31,
    UMGSMMAP_ApplicationContext_gprsLocationUpdateContext = 32,
    UMGSMMAP_ApplicationContext_gprsLocationInfoRetrievalContext = 33,
    UMGSMMAP_ApplicationContext_failureReportContext = 34,
    UMGSMMAP_ApplicationContext_gprsNotifyContext = 35,
    UMGSMMAP_ApplicationContext_ss_InvocationNotification = 36,
    UMGSMMAP_ApplicationContext_locationSvcGatewayContext = 37,
    UMGSMMAP_ApplicationContext_locationSvcEnquiryContext = 38,
    UMGSMMAP_ApplicationContext_shortMsgMT_Relay_VGCS_Context = 41,
    UMGSMMAP_ApplicationContext_mm_EventReportingContext = 42,
    UMGSMMAP_ApplicationContext_anyTimeInfoHandlingContext = 43,
    UMGSMMAP_ApplicationContext_resourceManagementContext = 44,
    UMGSMMAP_ApplicationContext_groupCallInfoRetrievalContext = 45,
} UMGSMMAP_ApplicationContext;

#define UMGSMMAP_ApplicationContextString(context,ver)  [NSString stringWithFormat:@"0400000100%02X%02X",context,ver]
