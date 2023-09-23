//
//  UMGSMMAP_Opcodes.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 25.10.19.
//  Copyright © 2019 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/UMGSMMAP_Opcodes.h>


const char *umgsmmap_opcode_string(int opcode)
{
    switch(opcode)
    {
    case UMGSMMAP_Opcode_noOpcode:
        return "undefined";
        break;
    case UMGSMMAP_Opcode_updateLocation:
        return "updateLocation";
        break;
    case UMGSMMAP_Opcode_cancelLocation:
        return "cancelLocation";
        break;
    case UMGSMMAP_Opcode_provideRoamingNumber:
        return "provideRoamingNumber";
        break;
    case UMGSMMAP_Opcode_noteSubscriberDataModified:
        return "noteSubscriberDataModified";
        break;
    case UMGSMMAP_Opcode_resumeCallHandling:
        return "resumeCallHandling";
        break;
    case UMGSMMAP_Opcode_insertSubscriberData:
        return "insertSubscriberData";
        break;
    case UMGSMMAP_Opcode_deleteSubscriberData:
        return "deleteSubscriberData";
        break;
    case UMGSMMAP_Opcode_sendParameters:
        return "sendParameters";
        break;
    case UMGSMMAP_Opcode_registerSS:
        return "registerSS";
        break;
    case UMGSMMAP_Opcode_erase_SS:
        return "erase_SS";
        break;
    case UMGSMMAP_Opcode_activateSS:
        return "activateSS";
        break;
    case UMGSMMAP_Opcode_deactivateSS:
        return "deactivateSS";
        break;
    case UMGSMMAP_Opcode_interrogateSS:
        return "interrogateSS";
        break;
    case UMGSMMAP_Opcode_authenticationFailureReport:
        return "authenticationFailureReport";
        break;
    case UMGSMMAP_Opcode_notifySS:
        return "notifySS";
        break;
    case UMGSMMAP_Opcode_registerPassword:
        return "registerPassword";
        break;
    case UMGSMMAP_Opcode_getPassword:
        return "getPassword";
        break;
    case UMGSMMAP_Opcode_processUnstructuredSS_Data:
        return "processUnstructuredSS_Data";
        break;
    case UMGSMMAP_Opcode_releaseResources:
        return "releaseResources";
        break;
    case UMGSMMAP_Opcode_mt_ForwardSM_VGCS:
        return "mt_ForwardSM_VGCS";
        break;
    case UMGSMMAP_Opcode_sendRoutingInfo:
        return "sendRoutingInfo";
        break;
    case UMGSMMAP_Opcode_updateGprsLocation:
        return "updateGprsLocation";
        break;
    case UMGSMMAP_Opcode_sendRoutingInfoForGprs:
        return "sendRoutingInfoForGprs";
        break;
    case UMGSMMAP_Opcode_failureReport:
        return "failureReport";
        break;
    case UMGSMMAP_Opcode_noteMsPresentForGprs:
        return "noteMsPresentForGprs";
        break;
    case UMGSMMAP_Opcode_performHandover:
        return "performHandover";
        break;
    case UMGSMMAP_Opcode_sendEndSignal:
        return "sendEndSignal";
        break;
    case UMGSMMAP_Opcode_performSubsequentHandover:
        return "performSubsequentHandover";
        break;
    case UMGSMMAP_Opcode_provideSIWFSNumber:
        return "provideSIWFSNumber";
        break;
    case UMGSMMAP_Opcode_sIWFSSignallingModify:
        return "sIWFSSignallingModify";
        break;
    case UMGSMMAP_Opcode_processAccessSignalling:
        return "processAccessSignalling";
        break;
    case UMGSMMAP_Opcode_forwardAccessSignalling:
        return "forwardAccessSignalling";
        break;
    case UMGSMMAP_Opcode_noteInternalHandover:
        return "noteInternalHandover";
        break;
    case UMGSMMAP_Opcode_cancelVcsgLocation:
        return "cancelVcsgLocation";
        break;
    case UMGSMMAP_Opcode_reset:
        return "reset";
        break;
    case UMGSMMAP_Opcode_forwardCheckSS_Indication:
        return "forwardCheckSS_Indication";
        break;
    case UMGSMMAP_Opcode_prepareGroupCall:
        return "prepareGroupCall";
        break;
    case UMGSMMAP_Opcode_sendGroupCallEndSignal:
        return "sendGroupCallEndSignal";
        break;
    case UMGSMMAP_Opcode_processGroupCallSignalling:
        return "processGroupCallSignalling";
        break;
    case UMGSMMAP_Opcode_forwardGroupCallSignalling:
        return "forwardGroupCallSignalling";
        break;
    case UMGSMMAP_Opcode_checkIMEI:
        return "checkIMEI";
        break;
    case UMGSMMAP_Opcode_mt_forwardSM:
        return "mt_forwardSM";
        break;
    case UMGSMMAP_Opcode_sendRoutingInfoForSM:
        return "sendRoutingInfoForSM";
        break;
    case UMGSMMAP_Opcode_mo_forwardSM:
        return "mo_forwardSM";
        break;
    case UMGSMMAP_Opcode_reportSM_DeliveryStatus:
        return "reportSM_DeliveryStatus";
        break;
    case UMGSMMAP_Opcode_noteSubscriberPresent:
        return "noteSubscriberPresent";
        break;
    case UMGSMMAP_Opcode_alertServiceCentreOld:
        return "alertServiceCentreOld";
        break;
    case UMGSMMAP_Opcode_activateTraceMode:
        return "activateTraceMode";
        break;
    case UMGSMMAP_Opcode_deactivateTraceMode:
        return "deactivateTraceMode";
        break;
    case UMGSMMAP_Opcode_traceSubscriberActivity:
        return "traceSubscriberActivity";
        break;
    case UMGSMMAP_Opcode_updateVcsgLocation:
        return "updateVcsgLocation";
        break;
    case UMGSMMAP_Opcode_beginSubscriberActivity:
        return "beginSubscriberActivity";
        break;
    case UMGSMMAP_Opcode_sendIdentification:
        return "sendIdentification";
        break;
    case UMGSMMAP_Opcode_sendAuthenticationInfo:
        return "sendAuthenticationInfo";
        break;
    case UMGSMMAP_Opcode_restoreData:
        return "restoreData";
        break;
    case UMGSMMAP_Opcode_sendIMSI:
        return "sendIMSI";
        break;
    case UMGSMMAP_Opcode_processUnstructuredSS_Request:
        return "processUnstructuredSS_Request";
        break;
    case UMGSMMAP_Opcode_unstructuredSS_Request:
        return "unstructuredSS_Request";
        break;
    case UMGSMMAP_Opcode_unstructuredSS_Notify:
        return "unstructuredSS_Notify";
        break;
    case UMGSMMAP_Opcode_anyTimeSubscriptionInterrogation:
        return "anyTimeSubscriptionInterrogation";
        break;
    case UMGSMMAP_Opcode_informServiceCentre:
        return "informServiceCentre";
        break;
    case UMGSMMAP_Opcode_alertServiceCentre:
        return "alertServiceCentre";
        break;
    case UMGSMMAP_Opcode_anyTimeModification:
        return "anyTimeModification";
        break;
    case UMGSMMAP_Opcode_readyForSM:
        return "readyForSM";
        break;
    case UMGSMMAP_Opcode_purge_MS:
        return "purge_MS";
        break;
    case UMGSMMAP_Opcode_prepareHandOver:
        return "prepareHandOver";
        break;
    case UMGSMMAP_Opcode_prepareSubsequentHandover:
        return "prepareSubsequentHandover";
        break;
    case UMGSMMAP_Opcode_provideSubscriberInfo:
        return "provideSubscriberInfo";
        break;
    case UMGSMMAP_Opcode_anyTimeInterrogation:
        return "anyTimeInterrogation";
        break;
    case UMGSMMAP_Opcode_ss_InvocationNotification:
        return "ss_InvocationNotification";
        break;
    case UMGSMMAP_Opcode_setReportingState:
        return "setReportingState";
        break;
    case UMGSMMAP_Opcode_statusReport:
        return "statusReport";
        break;
    case UMGSMMAP_Opcode_remoteUserFree:
        return "remoteUserFree";
        break;
    case UMGSMMAP_Opcode_registerCC_Entry:
        return "registerCC_Entry";
        break;
    case UMGSMMAP_Opcode_eraseCC_Entry:
        return "eraseCC_Entry";
        break;
    case UMGSMMAP_Opcode_secureTransportClass1:
        return "secureTransportClass1";
        break;
    case UMGSMMAP_Opcode_secureTransportClass2:
        return "secureTransportClass2";
        break;
    case UMGSMMAP_Opcode_secureTransportClass3:
        return "secureTransportClass3";
        break;
    case UMGSMMAP_Opcode_secureTransportClass4:
        return "secureTransportClass4";
        break;
    case UMGSMMAP_Opcode_provideSubscriberLocation:
        return "provideSubscriberLocation";
        break;
    case UMGSMMAP_Opcode_sendGroupCallInfo:
        return "sendGroupCallInfo";
        break;
    case UMGSMMAP_Opcode_sendRoutingInfoForLCS:
        return "sendRoutingInfoForLCS";
        break;
    case UMGSMMAP_Opcode_subscriberLocationReport:
        return "subscriberLocationReport";
        break;
    case UMGSMMAP_Opcode_ist_Alert:
        return "ist_Alert";
        break;
    case UMGSMMAP_Opcode_ist_Command:
        return "ist_Command";
        break;
    case UMGSMMAP_Opcode_noteMM_Event:
        return "noteMM_Event";
        break;
    case UMGSMMAP_Opcode_lcs_PeriodicLocationCancellation:
        return "lcs_PeriodicLocationCancellation";
        break;
    case UMGSMMAP_Opcode_lcs_LocationUpdate:
        return "lcs_LocationUpdate";
        break;
    case UMGSMMAP_Opcode_lcs_PeriodicLocationRequest:
        return "lcs_PeriodicLocationRequest";
        break;
    case UMGSMMAP_Opcode_lcs_AreaEventCancellation:
        return "lcs_AreaEventCancellation";
        break;
    case UMGSMMAP_Opcode_lcs_AreaEventReport:
        return "lcs_AreaEventReport";
        break;
    case UMGSMMAP_Opcode_lcs_AreaEventRequest:
        return "lcs_AreaEventRequest";
        break;
    case UMGSMMAP_Opcode_lcs_MOLR:
        return "lcs_MOLR";
        break;
    case UMGSMMAP_Opcode_lcs_LocationNotification:
        return "lcs_LocationNotification";
        break;
    case UMGSMMAP_Opcode_callDeflection:
        return "callDeflection";
        break;
    case UMGSMMAP_Opcode_userUserService:
        return "userUserService";
        break;
    case UMGSMMAP_Opcode_accessRegisterCCEntry:
        return "accessRegisterCCEntry";
        break;
    case UMGSMMAP_Opcode_forwardCUG_Info:
        return "forwardCUG_Info";
        break;
    case UMGSMMAP_Opcode_splitMPTY:
        return "splitMPTY";
        break;
    case UMGSMMAP_Opcode_retrieveMPTY:
        return "retrieveMPTY";
        break;
    case UMGSMMAP_Opcode_holdMPTY:
        return "holdMPTY";
        break;
    case UMGSMMAP_Opcode_buildMPTY:
        return "buildMPTY";
        break;
    case UMGSMMAP_Opcode_forwardChargeAdvice:
        return "forwardChargeAdvice";
        break;
    case UMGSMMAP_Opcode_explicitCT:
        return "explicitCT";
        break;
    default:
        return "undefined";
    }
}
