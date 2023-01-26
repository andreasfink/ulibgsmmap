//
//  UMGSMMAP_Opcodes.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 20.04.16.
//
//


typedef enum UMGSMMAP_Opcode
{
    UMGSMMAP_Opcode_noOpcode = 0,
    UMGSMMAP_Opcode_updateLocation = 2,
    UMGSMMAP_Opcode_cancelLocation = 3,
    UMGSMMAP_Opcode_provideRoamingNumber = 4,
    UMGSMMAP_Opcode_noteSubscriberDataModified = 5,
    UMGSMMAP_Opcode_resumeCallHandling = 6,
    UMGSMMAP_Opcode_insertSubscriberData = 7,
    UMGSMMAP_Opcode_deleteSubscriberData = 8,
    UMGSMMAP_Opcode_sendParameters = 9,             // old
    UMGSMMAP_Opcode_registerSS = 10,
    UMGSMMAP_Opcode_erase_SS = 11,
    UMGSMMAP_Opcode_activateSS = 12,
    UMGSMMAP_Opcode_deactivateSS = 13,
    UMGSMMAP_Opcode_interrogateSS = 14,
    UMGSMMAP_Opcode_authenticationFailureReport = 15,
    UMGSMMAP_Opcode_notifySS = 16,                  // old
    UMGSMMAP_Opcode_registerPassword = 17,
    UMGSMMAP_Opcode_getPassword = 18,
    UMGSMMAP_Opcode_processUnstructuredSS_Data = 19, // old
    UMGSMMAP_Opcode_releaseResources = 20,          // old
    UMGSMMAP_Opcode_mt_ForwardSM_VGCS = 21,         // old
    UMGSMMAP_Opcode_sendRoutingInfo = 22,
    UMGSMMAP_Opcode_updateGprsLocation = 23,
    UMGSMMAP_Opcode_sendRoutingInfoForGprs = 24,
    UMGSMMAP_Opcode_failureReport = 25,
    UMGSMMAP_Opcode_noteMsPresentForGprs = 26,
    // 27 is unallocated
    UMGSMMAP_Opcode_performHandover = 28,//old
    UMGSMMAP_Opcode_sendEndSignal = 29,
    UMGSMMAP_Opcode_performSubsequentHandover = 30, // old
    UMGSMMAP_Opcode_provideSIWFSNumber = 31,
    UMGSMMAP_Opcode_sIWFSSignallingModify = 32,
    UMGSMMAP_Opcode_processAccessSignalling = 33,
    UMGSMMAP_Opcode_forwardAccessSignalling = 34,
    UMGSMMAP_Opcode_noteInternalHandover = 35,      // old
    UMGSMMAP_Opcode_cancelVcsgLocation = 36,        // old
    UMGSMMAP_Opcode_reset = 37,
    UMGSMMAP_Opcode_forwardCheckSS_Indication = 38,
    UMGSMMAP_Opcode_prepareGroupCall = 39,
    UMGSMMAP_Opcode_sendGroupCallEndSignal = 40,
    UMGSMMAP_Opcode_processGroupCallSignalling = 41,
    UMGSMMAP_Opcode_forwardGroupCallSignalling = 42,
    UMGSMMAP_Opcode_checkIMEI = 43,
    UMGSMMAP_Opcode_mt_forwardSM = 44,
    UMGSMMAP_Opcode_sendRoutingInfoForSM = 45,
    UMGSMMAP_Opcode_mo_forwardSM = 46,
    UMGSMMAP_Opcode_reportSM_DeliveryStatus = 47,
    UMGSMMAP_Opcode_noteSubscriberPresent = 48,     // old
    UMGSMMAP_Opcode_alertServiceCentreOld = 49,     // old
    UMGSMMAP_Opcode_activateTraceMode = 50,
    UMGSMMAP_Opcode_deactivateTraceMode = 51,
    UMGSMMAP_Opcode_traceSubscriberActivity = 52,   // old
    UMGSMMAP_Opcode_updateVcsgLocation = 53,        // old
    UMGSMMAP_Opcode_beginSubscriberActivity = 54,   // old
    UMGSMMAP_Opcode_sendIdentification = 55,
    UMGSMMAP_Opcode_sendAuthenticationInfo = 56,
    UMGSMMAP_Opcode_restoreData = 57,
    UMGSMMAP_Opcode_sendIMSI = 58,
    UMGSMMAP_Opcode_processUnstructuredSS_Request = 59,
    UMGSMMAP_Opcode_unstructuredSS_Request = 60,
    UMGSMMAP_Opcode_unstructuredSS_Notify = 61,
    UMGSMMAP_Opcode_anyTimeSubscriptionInterrogation = 62,
    UMGSMMAP_Opcode_informServiceCentre = 63,
    UMGSMMAP_Opcode_alertServiceCentre = 64,
    UMGSMMAP_Opcode_anyTimeModification = 65,
    UMGSMMAP_Opcode_readyForSM = 66,
    UMGSMMAP_Opcode_purge_MS = 67,
    UMGSMMAP_Opcode_prepareHandOver = 68,
    UMGSMMAP_Opcode_prepareSubsequentHandover = 69,
    UMGSMMAP_Opcode_provideSubscriberInfo = 70,
    UMGSMMAP_Opcode_anyTimeInterrogation = 71,
    UMGSMMAP_Opcode_ss_InvocationNotification = 72,
    UMGSMMAP_Opcode_setReportingState = 73,
    UMGSMMAP_Opcode_statusReport = 74,
    UMGSMMAP_Opcode_remoteUserFree = 75,
    UMGSMMAP_Opcode_registerCC_Entry = 76,
    UMGSMMAP_Opcode_eraseCC_Entry = 77,
    UMGSMMAP_Opcode_secureTransportClass1 = 78,     // old
    UMGSMMAP_Opcode_secureTransportClass2 = 79,     // old
    UMGSMMAP_Opcode_secureTransportClass3 = 80,     // old
    UMGSMMAP_Opcode_secureTransportClass4 = 81,     // old
    /* undefined 82 */
    UMGSMMAP_Opcode_provideSubscriberLocation = 83,
    UMGSMMAP_Opcode_sendGroupCallInfo = 84,         // old
    UMGSMMAP_Opcode_sendRoutingInfoForLCS = 85,
    UMGSMMAP_Opcode_subscriberLocationReport = 86,
    UMGSMMAP_Opcode_ist_Alert = 87,
    UMGSMMAP_Opcode_ist_Command = 88,
    UMGSMMAP_Opcode_noteMM_Event = 89,
    UMGSMMAP_Opcode_lcs_PeriodicLocationCancellation = 109,
    UMGSMMAP_Opcode_lcs_LocationUpdate = 110,
    UMGSMMAP_Opcode_lcs_PeriodicLocationRequest = 111,
    UMGSMMAP_Opcode_lcs_AreaEventCancellation = 112,
    UMGSMMAP_Opcode_lcs_AreaEventReport = 113,
    UMGSMMAP_Opcode_lcs_AreaEventRequest = 114,
    UMGSMMAP_Opcode_lcs_MOLR = 115,
    UMGSMMAP_Opcode_lcs_LocationNotification = 116,
    UMGSMMAP_Opcode_callDeflection = 117,
    UMGSMMAP_Opcode_userUserService = 118,
    UMGSMMAP_Opcode_accessRegisterCCEntry = 119,
    UMGSMMAP_Opcode_forwardCUG_Info = 120,
    UMGSMMAP_Opcode_splitMPTY = 121,
    UMGSMMAP_Opcode_retrieveMPTY = 122,
    UMGSMMAP_Opcode_holdMPTY = 123,
    UMGSMMAP_Opcode_buildMPTY = 124,
    UMGSMMAP_Opcode_forwardChargeAdvice = 125,
    UMGSMMAP_Opcode_explicitCT = 126,

} UMGSMMAP_Opcode;


const char *umgsmmap_opcode_string(int opcode);

