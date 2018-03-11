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
    UMGSMMAP_ApplicationContext_undefined = 0x00,
    UMGSMMAP_ApplicationContext_networkLocUpContext = 0x01,
    UMGSMMAP_ApplicationContext_locationCancellationContext = 0x02,
    UMGSMMAP_ApplicationContext_roamingNumberEnquiryContext = 0x03,
    UMGSMMAP_ApplicationContext_istAlertingContext = 0x04,
    UMGSMMAP_ApplicationContext_locationInfoRetrievalContext = 0x05,
    UMGSMMAP_ApplicationContext_callControlTransfer = 0x06,
    UMGSMMAP_ApplicationContext_reportingContext = 0x07,
    UMGSMMAP_ApplicationContext_callCompletionContext = 0x08,
    UMGSMMAP_ApplicationContext_serviceTerminationContext = 0x09,
    UMGSMMAP_ApplicationContext_resetContext = 0x0A,
    UMGSMMAP_ApplicationContext_handoverControlContext = 0x0B,
    UMGSMMAP_ApplicationContext_sIWFSAllocationContext = 0x0C,
    UMGSMMAP_ApplicationContext_equipmentMngtContext = 0x0D,
    UMGSMMAP_ApplicationContext_infoRetrievalContext = 0x0E,
    UMGSMMAP_ApplicationContext_interVlrInfoRetrievalContext = 0x0F,
    UMGSMMAP_ApplicationContext_subscriberDataMngtContext = 0x10,
    UMGSMMAP_ApplicationContext_tracingContext = 0x11,
    UMGSMMAP_ApplicationContext_networkFunctionalSsContext = 0x12,
    UMGSMMAP_ApplicationContext_networkUnstructuredSsContext = 0x13,
    UMGSMMAP_ApplicationContext_shortMsgGatewayContext = 0x14,
    UMGSMMAP_ApplicationContext_shortMsgMO_RelayContext = 0x15,
    UMGSMMAP_ApplicationContext_subscriberDataModificationNotificationContext = 0x16,
    UMGSMMAP_ApplicationContext_shortMsgAlertContext = 0x17,
    UMGSMMAP_ApplicationContext_mwdMngtContext = 0x18,
    UMGSMMAP_ApplicationContext_shortMsgMT_RelayContext = 0x19,
    UMGSMMAP_ApplicationContext_imsiRetrievalContext = 0x1A,
    UMGSMMAP_ApplicationContext_msPurgingContext = 0x1B,
    UMGSMMAP_ApplicationContext_subscriberInfoEnquiryContext = 0x1C,
    UMGSMMAP_ApplicationContext_anyTimeInfoEnquiry = 0x1D,
    UMGSMMAP_ApplicationContext_groupCallControlContext = 0x1F,
    UMGSMMAP_ApplicationContext_gprsLocationUpdateContext = 0x20,
    UMGSMMAP_ApplicationContext_gprsLocationInfoRetrievalContext = 0x21,
    UMGSMMAP_ApplicationContext_failureReportContext = 0x22,
    UMGSMMAP_ApplicationContext_gprsNotifyContext = 0x23,
    UMGSMMAP_ApplicationContext_ss_InvocationNotification = 0x24,
    UMGSMMAP_ApplicationContext_locationSvcGatewayContext = 0x25,
    UMGSMMAP_ApplicationContext_locationSvcEnquiryContext = 0x26,
    UMGSMMAP_ApplicationContext_shortMsgMT_Relay_VGCS_Context = 0x29,
    UMGSMMAP_ApplicationContext_mm_EventReportingContext = 0x2A,
    UMGSMMAP_ApplicationContext_anyTimeInfoHandlingContext = 0x2B,
    UMGSMMAP_ApplicationContext_resourceManagementContext = 0x2C,
    UMGSMMAP_ApplicationContext_groupCallInfoRetrievalContext = 0x2D,
} UMGSMMAP_ApplicationContext;

#define UMGSMMAP_ApplicationContextString(context,ver)  [NSString stringWithFormat:@"0400000100%02X%02X",context,ver]

/* this is a shortcut to OID 0.4.0.0.1.0.X.Y. If value X or Y go above 127, this wont work anymore */
