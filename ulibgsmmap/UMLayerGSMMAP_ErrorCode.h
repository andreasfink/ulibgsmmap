//
//  UMLayerGSMMAP_ErrorCode.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 06.12.16.
//
//

typedef enum UMLayerGSMMAP_ErrorCode
{
    UMLayerGSMMAP_ErrorCode_unknownSubscriber = 1,
    UMLayerGSMMAP_ErrorCode_unknownBaseStation = 2, // old
    UMLayerGSMMAP_ErrorCode_unknownMSC = 3,
    UMLayerGSMMAP_ErrorCode_secureTransportError =4,
    UMLayerGSMMAP_ErrorCode_unidentifiedSubscriber = 5,
    UMLayerGSMMAP_ErrorCode_absentSubscriberSM = 6,
    UMLayerGSMMAP_ErrorCode_unknownEquipment = 7,
    UMLayerGSMMAP_ErrorCode_roamingNotAllowed = 8,
    UMLayerGSMMAP_ErrorCode_illegalSubscriber = 9,
    UMLayerGSMMAP_ErrorCode_bearerServiceNotProvisioned = 10,
    UMLayerGSMMAP_ErrorCode_teleserviceNotProvisioned = 11,
    UMLayerGSMMAP_ErrorCode_illegalEquipment = 12,
    UMLayerGSMMAP_ErrorCode_callBarred = 13,
    UMLayerGSMMAP_ErrorCode_forwardingViolation = 14,
    UMLayerGSMMAP_ErrorCode_cug_Reject = 15,
    UMLayerGSMMAP_ErrorCode_illegalSS_Operation = 16,
    UMLayerGSMMAP_ErrorCode_ss_ErrorStatus = 17,
    UMLayerGSMMAP_ErrorCode_ss_NotAvailable = 18,
    UMLayerGSMMAP_ErrorCode_ss_SubscriptionViolation = 19,
    UMLayerGSMMAP_ErrorCode_ss_Incompatibility = 20,
    UMLayerGSMMAP_ErrorCode_facilityNotSupported = 21,
    UMLayerGSMMAP_ErrorCode_ongoingGroupCall = 22,
    UMLayerGSMMAP_ErrorCode_invalidTargetBaseStation = 23,  // old
    UMLayerGSMMAP_ErrorCode_noRadioResourceAvailable = 24,  // old
    UMLayerGSMMAP_ErrorCode_noHandoverNumberAvailable = 25,
    UMLayerGSMMAP_ErrorCode_subsequentHandoverFailure = 26,
    UMLayerGSMMAP_ErrorCode_absentSubscriber = 27,
    UMLayerGSMMAP_ErrorCode_incompatibleTerminal = 28,
    UMLayerGSMMAP_ErrorCode_shortTermDenial = 29,
    UMLayerGSMMAP_ErrorCode_longTermDenial = 30,
    UMLayerGSMMAP_ErrorCode_subscriberBusyForMT_SMS = 31,
    UMLayerGSMMAP_ErrorCode_sm_DeliveryFailure = 32,
    UMLayerGSMMAP_ErrorCode_messageWaitingListFull = 33,
    UMLayerGSMMAP_ErrorCode_systemFailure = 34,
    UMLayerGSMMAP_ErrorCode_dataMissing = 35,
    UMLayerGSMMAP_ErrorCode_unexpectedDataValue = 36,
    UMLayerGSMMAP_ErrorCode_pw_RegistrationFailure = 37,
    UMLayerGSMMAP_ErrorCode_negativePW_Check = 38,
    UMLayerGSMMAP_ErrorCode_noRoamingNumberAvailable = 39,
    UMLayerGSMMAP_ErrorCode_tracingBufferFull = 40,
    UMLayerGSMMAP_ErrorCode_targetCellOutsideGroupCallArea = 42,
    UMLayerGSMMAP_ErrorCode_numberOfPW_AttemptsViolation = 43,
    UMLayerGSMMAP_ErrorCode_numberChanged = 44,
    UMLayerGSMMAP_ErrorCode_busySubscriber = 45,
    UMLayerGSMMAP_ErrorCode_noSubscriberReply = 46,
    UMLayerGSMMAP_ErrorCode_forwardingFailed = 47,
    UMLayerGSMMAP_ErrorCode_or_NotAllowed = 48,
    UMLayerGSMMAP_ErrorCode_ati_NotAllowed = 49,
    UMLayerGSMMAP_ErrorCode_noGroupCallNumberAvailable = 50,
    UMLayerGSMMAP_ErrorCode_resourceLimitation = 51,
    UMLayerGSMMAP_ErrorCode_unauthorisedRequestingNetwork = 52,
    UMLayerGSMMAP_ErrorCode_unauthorisedLCSClient = 53,
    UMLayerGSMMAP_ErrorCode_positionMethodFailure = 54,
    UMLayerGSMMAP_ErrorCode_unknownOrUnreachableLCSClient = 58,
    UMLayerGSMMAP_ErrorCode_mm_EventNotSupported = 59,
    UMLayerGSMMAP_ErrorCode_atsi_NotAllowed = 60,
    UMLayerGSMMAP_ErrorCode_atm_NotAllowed = 61,
    UMLayerGSMMAP_ErrorCode_informationNotAvailable = 62,
    UMLayerGSMMAP_ErrorCode_unknownAlphabet = 71,
    UMLayerGSMMAP_ErrorCode_ussd_Busy = 72,
} UMLayerGSMMAP_ErrorCode;
