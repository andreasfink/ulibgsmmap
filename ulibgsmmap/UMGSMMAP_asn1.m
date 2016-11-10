 //
//  UMGSMMAP_asn1.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 20.04.16.
//
//

#import "UMGSMMAP_asn1.h"
#import <ulibtcap/ulibtcap.h>

#import "UMGSMMAP_Opcodes.h"

#import "UMGSMMAP_ActivateTraceModeArg.h"
#import "UMGSMMAP_ActivateTraceModeRes.h"
#import "UMGSMMAP_AlertServiceCentreArg.h"
#import "UMGSMMAP_AnyTimeInterrogationArg.h"
#import "UMGSMMAP_AnyTimeInterrogationRes.h"
#import "UMGSMMAP_AuthenticationFailureReportArg.h"
#import "UMGSMMAP_AuthenticationFailureReportRes.h"
#import "UMGSMMAP_CancelLocationArg.h"
#import "UMGSMMAP_CancelLocationRes.h"
#import "UMGSMMAP_CurrentPassword.h"
#import "UMGSMMAP_DeactivateTraceModeArg.h"
#import "UMGSMMAP_DeactivateTraceModeRes.h"
#import "UMGSMMAP_DeleteSubscriberDataArg.h"
#import "UMGSMMAP_DeleteSubscriberDataRes.h"
#import "UMGSMMAP_EquipmentStatus.h"
#import "UMGSMMAP_EraseCC_EntryArg.h"
#import "UMGSMMAP_EraseCC_EntryRes.h"
#import "UMGSMMAP_ExternalSignalInfo.h"
#import "UMGSMMAP_FailureReportArg.h"
#import "UMGSMMAP_FailureReportRes.h"
#import "UMGSMMAP_ForwardGroupCallSignallingArg.h"
#import "UMGSMMAP_GuidanceInfo.h"
#import "UMGSMMAP_IMEI.h"
#import "UMGSMMAP_IMSI.h"
#import "UMGSMMAP_InformServiceCentreArg.h"
#import "UMGSMMAP_InsertSubscriberDataArg.h"
#import "UMGSMMAP_InsertSubscriberDataRes.h"
#import "UMGSMMAP_InterrogateSS_Res.h"
#import "UMGSMMAP_IST_AlertArg.h"
#import "UMGSMMAP_IST_AlertRes.h"
#import "UMGSMMAP_IST_CommandArg.h"
#import "UMGSMMAP_IST_CommandRes.h"
#import "UMGSMMAP_MO_ForwardSM_Arg.h"
#import "UMGSMMAP_MO_ForwardSM_Res.h"
#import "UMGSMMAP_Msisdn.h"
#import "UMGSMMAP_MT_ForwardSM_Arg.h"
#import "UMGSMMAP_MT_ForwardSM_Res.h"
#import "UMGSMMAP_NewPassword.h"
#import "UMGSMMAP_NoteMsPresentForGprsArg.h"
#import "UMGSMMAP_NoteMsPresentForGprsRes.h"
#import "UMGSMMAP_PrepareGroupCallArg.h"
#import "UMGSMMAP_PrepareGroupCallRes.h"
#import "UMGSMMAP_PrepareHO_Arg.h"
#import "UMGSMMAP_PrepareHO_Res.h"
#import "UMGSMMAP_PrepareSubsequentHO_Arg.h"
#import "UMGSMMAP_ProcessGroupCallSignallingArg.h"
#import "UMGSMMAP_ProvideRoamingNumberArg.h"
#import "UMGSMMAP_ProvideRoamingNumberRes.h"
#import "UMGSMMAP_ProvideSIWFSNumberArg.h"
#import "UMGSMMAP_ProvideSIWFSNumberRes.h"
#import "UMGSMMAP_ProvideSubscriberInfoArg.h"
#import "UMGSMMAP_ProvideSubscriberInfoRes.h"
#import "UMGSMMAP_ProvideSubscriberLocation_Arg.h"
#import "UMGSMMAP_ProvideSubscriberLocation_Res.h"
#import "UMGSMMAP_PurgeMS_Arg.h"
#import "UMGSMMAP_PurgeMS_Res.h"
#import "UMGSMMAP_ReadyForSM_Arg.h"
#import "UMGSMMAP_ReadyForSM_Res.h"
#import "UMGSMMAP_RegisterCC_EntryArg.h"
#import "UMGSMMAP_RegisterCC_EntryRes.h"
#import "UMGSMMAP_RegisterSS_Arg.h"
#import "UMGSMMAP_RemoteUserFreeArg.h"
#import "UMGSMMAP_RemoteUserFreeRes.h"
#import "UMGSMMAP_ReportSM_DeliveryStatusArg.h"
#import "UMGSMMAP_ReportSM_DeliveryStatusRes.h"
#import "UMGSMMAP_ResetArg.h"
#import "UMGSMMAP_RestoreDataArg.h"
#import "UMGSMMAP_RestoreDataRes.h"
#import "UMGSMMAP_ResumeCallHandlingArg.h"
#import "UMGSMMAP_ResumeCallHandlingRes.h"
#import "UMGSMMAP_RoutingInfoForLCS_Arg.h"
#import "UMGSMMAP_RoutingInfoForLCS_Res.h"
#import "UMGSMMAP_RoutingInfoForSM_Arg.h"
#import "UMGSMMAP_RoutingInfoForSM_Res.h"
#import "UMGSMMAP_SendAuthenticationInfoArg.h"
#import "UMGSMMAP_SendAuthenticationInfoRes.h"
#import "UMGSMMAP_SendGroupCallEndSignalArg.h"
#import "UMGSMMAP_SendGroupCallEndSignalRes.h"
#import "UMGSMMAP_SendIdentificationArg.h"
#import "UMGSMMAP_SendIdentificationRes.h"
#import "UMGSMMAP_SendRoutingInfoArg.h"
#import "UMGSMMAP_SendRoutingInfoForGprsArg.h"
#import "UMGSMMAP_SendRoutingInfoForGprsRes.h"
#import "UMGSMMAP_SendRoutingInfoRes.h"
#import "UMGSMMAP_SetReportingStateArg.h"
#import "UMGSMMAP_SetReportingStateRes.h"
#import "UMGSMMAP_SIWFSSignallingModifyArg.h"
#import "UMGSMMAP_SIWFSSignallingModifyRes.h"
#import "UMGSMMAP_SS_Code.h"
#import "UMGSMMAP_Ss_ForBS.h"
#import "UMGSMMAP_Ss_Info.h"
#import "UMGSMMAP_Ss_InvocationNotificationArg.h"
#import "UMGSMMAP_Ss_InvocationNotificationRes.h"
#import "UMGSMMAP_StatusReportArg.h"
#import "UMGSMMAP_StatusReportRes.h"
#import "UMGSMMAP_SubscriberLocationReport_Arg.h"
#import "UMGSMMAP_SubscriberLocationReport_Res.h"
#import "UMGSMMAP_UpdateGprsLocationArg.h"
#import "UMGSMMAP_UpdateGprsLocationRes.h"
#import "UMGSMMAP_UpdateLocationArg.h"
#import "UMGSMMAP_UpdateLocationRes.h"
#import "UMGSMMAP_Ussd_Arg.h"
#import "UMGSMMAP_Ussd_Res.h"
#import "UMGSMMAP_AnyTimeSubscriptionInterrogationArg.h"
#import "UMGSMMAP_AnyTimeSubscriptionInterrogationRes.h"


@implementation UMGSMMAP_asn1

@synthesize operationName;

- (NSString *)objectOperation
{
    return operationName;
}

- (UMGSMMAP_asn1 *)init
{
    self = [super init];
    if(self)
    {
        [asn1_tag setTagIsConstructed];
        asn1_list = [[NSMutableArray alloc]init];
    }
    return self;
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)processAfterDecodeWithContext:(id)context
{    
    int64_t opcode = -1;
    UMTCAP_Operation operation = 0;
    
    if([context respondsToSelector:@selector(operationCode)])
    {
        opcode = (int64_t)[context performSelector:@selector(operationCode)];
    }
    else
    {
        return self;
    }
    if([context respondsToSelector:@selector(operationType)])
    {
        operation = (UMTCAP_Operation)[context performSelector:@selector(operationType)];
    }
    else
    {
        return self;
    }
    NSString *name = NULL;
    UMASN1Object<UMGSMMAP_asn1_protocol> *o = [self decodeASN1opcode:opcode
                                                       operationType:operation
                                                       operationName:&name
                                                         withContext:context];
    if(name)
    {
        o.operationName = name;
    }
    return o;
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    UMASN1Object<UMGSMMAP_asn1_protocol> *asn1 = self;
    switch(opcode)
    {
        case 0:
        {
            switch(operation)
            {
                case UMTCAP_Operation_Error:
                    /* generic object, probably empty */
                    asn1 = NULL;
                    break;
                case UMTCAP_Operation_Response:
                case UMTCAP_Operation_Request:
                case UMTCAP_Operation_Reject:
                case UMTCAP_Operation_Unidirectional:
                    break;
            }
        }
        case UMGSMMAP_Opcode_updateLocation:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_UpdateLocationArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_UpdateLocationRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"updateLocation";
            break;
        case UMGSMMAP_Opcode_cancelLocation:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_CancelLocationArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_CancelLocationRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"cancelLocation";
            break;
        case UMGSMMAP_Opcode_purge_MS:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_PurgeMS_Arg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_PurgeMS_Res alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"purge_MS";
            break;
        case UMGSMMAP_Opcode_sendIdentification:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_SendIdentificationArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_SendIdentificationRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"sendIdentification";
            break;
        case UMGSMMAP_Opcode_prepareHandOver:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_PrepareHO_Arg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_PrepareHO_Res alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"prepareHandOver";
            break;
        case UMGSMMAP_Opcode_sendEndSignal:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"sendEndSignal";
            break;
        case UMGSMMAP_Opcode_processAccessSignalling:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"processAccessSignalling";
            break;
        case UMGSMMAP_Opcode_forwardAccessSignalling:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"forwardAccessSignalling";
            break;
        case UMGSMMAP_Opcode_prepareSubsequentHandover:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_PrepareSubsequentHO_Arg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"prepareSubsequentHandover";
            break;
        case UMGSMMAP_Opcode_sendAuthenticationInfo:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_SendAuthenticationInfoArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_SendAuthenticationInfoRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"sendAuthenticationInfo";
            break;
        case UMGSMMAP_Opcode_checkIMEI:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_IMEI alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_EquipmentStatus alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"checkIMEI";
            break;
        case UMGSMMAP_Opcode_insertSubscriberData:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_InsertSubscriberDataArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_InsertSubscriberDataRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"insertSubscriberData";
            break;
        case UMGSMMAP_Opcode_deleteSubscriberData:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_DeleteSubscriberDataArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_DeleteSubscriberDataRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"deleteSubscriberData";
            break;
        case UMGSMMAP_Opcode_reset:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_ResetArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"reset";
            break;
        case UMGSMMAP_Opcode_forwardCheckSS_Indication:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                break;
            case UMTCAP_Operation_Response:
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"forwardCheckSS_Indication";
            break;
        case UMGSMMAP_Opcode_restoreData:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_RestoreDataArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_RestoreDataRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"restoreData";
            break;
        case UMGSMMAP_Opcode_activateTraceMode:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_ActivateTraceModeArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_ActivateTraceModeRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"activateTraceMode";
            break;
        case UMGSMMAP_Opcode_deactivateTraceMode:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_DeactivateTraceModeArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_DeactivateTraceModeRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"deactivateTraceMode";
            break;
        case UMGSMMAP_Opcode_sendIMSI:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_Msisdn alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_IMSI alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"sendIMSI";
            break;
        case UMGSMMAP_Opcode_sendRoutingInfo:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_SendRoutingInfoArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_SendRoutingInfoRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"sendRoutingInfo";
            break;
        case UMGSMMAP_Opcode_provideRoamingNumber:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_ProvideRoamingNumberArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_ProvideRoamingNumberRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"provideRoamingNumber";
            break;
        case UMGSMMAP_Opcode_resumeCallHandling:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_ResumeCallHandlingArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_ResumeCallHandlingRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"resumeCallHandling";
            break;
        case UMGSMMAP_Opcode_provideSIWFSNumber:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_ProvideSIWFSNumberArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_ProvideSIWFSNumberRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"provideSIWFSNumber";
            break;
        case UMGSMMAP_Opcode_sIWFSSignallingModify:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_SIWFSSignallingModifyArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_SIWFSSignallingModifyRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"sIWFSSignallingModify";
            break;
        case UMGSMMAP_Opcode_setReportingState:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_SetReportingStateArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_SetReportingStateRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"setReportingState";
            break;
        case UMGSMMAP_Opcode_statusReport:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_StatusReportArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_StatusReportRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"statusReport";
            break;
        case UMGSMMAP_Opcode_remoteUserFree:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_RemoteUserFreeArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_RemoteUserFreeRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"remoteUserFree";
            break;
        case UMGSMMAP_Opcode_registerSS:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_RegisterSS_Arg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_Ss_Info alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"registerSS";
            break;
        case UMGSMMAP_Opcode_erase_SS:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_Ss_ForBS alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_Ss_Info alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"erase_SS";
            break;
        case UMGSMMAP_Opcode_activateSS:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_Ss_ForBS alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_Ss_Info alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"activateSS";
            break;
        case UMGSMMAP_Opcode_deactivateSS:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_Ss_ForBS alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_Ss_Info alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"deactivateSS";
            break;
        case UMGSMMAP_Opcode_interrogateSS:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_Ss_ForBS alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_InterrogateSS_Res alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"interrogateSS";
            break;
        case UMGSMMAP_Opcode_processUnstructuredSS_Request:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_Ussd_Arg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_Ussd_Res alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"processUnstructuredSS_Request";
            break;
        case UMGSMMAP_Opcode_unstructuredSS_Request:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_Ussd_Arg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_Ussd_Res alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"unstructuredSS_Request";
            break;
        case UMGSMMAP_Opcode_unstructuredSS_Notify:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_Ussd_Arg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"unstructuredSS_Notify";
            break;
        case UMGSMMAP_Opcode_anyTimeSubscriptionInterrogation:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_AnyTimeSubscriptionInterrogationArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_AnyTimeSubscriptionInterrogationRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"unstructuredSS_Notify";
            break;
        case UMGSMMAP_Opcode_registerPassword:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_SS_Code alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_NewPassword alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"registerPassword";
            break;
        case UMGSMMAP_Opcode_getPassword:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_GuidanceInfo alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_CurrentPassword alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"getPassword";
            break;
        case UMGSMMAP_Opcode_registerCC_Entry:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_RegisterCC_EntryArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_RegisterCC_EntryRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"registerCC_Entry";
            break;
        case UMGSMMAP_Opcode_eraseCC_Entry:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_EraseCC_EntryArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_EraseCC_EntryRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"eraseCC_Entry";
            break;
        case UMGSMMAP_Opcode_sendRoutingInfoForSM:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_RoutingInfoForSM_Arg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_RoutingInfoForSM_Res alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"sendRoutingInfoForSM";
            break;
        case UMGSMMAP_Opcode_mo_forwardSM:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_MO_ForwardSM_Arg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_MO_ForwardSM_Res alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"mo_forwardSM";
            break;
        case UMGSMMAP_Opcode_mt_forwardSM:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_MT_ForwardSM_Arg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_MT_ForwardSM_Res alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"mt_forwardSM";
            break;
        case UMGSMMAP_Opcode_reportSM_DeliveryStatus:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_ReportSM_DeliveryStatusArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_ReportSM_DeliveryStatusRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"reportSM_DeliveryStatus";
            break;
        case UMGSMMAP_Opcode_informServiceCentre:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_InformServiceCentreArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"informServiceCentre";
            break;
        case UMGSMMAP_Opcode_alertServiceCentre:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_AlertServiceCentreArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"alertServiceCentre";
            break;
        case UMGSMMAP_Opcode_readyForSM:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_ReadyForSM_Arg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_ReadyForSM_Res alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"readyForSM";
            break;
        case UMGSMMAP_Opcode_provideSubscriberInfo:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_ProvideSubscriberInfoArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_ProvideSubscriberInfoRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"provideSubscriberInfo";
            break;
        case UMGSMMAP_Opcode_anyTimeInterrogation:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_AnyTimeInterrogationArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_AnyTimeInterrogationRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"anyTimeInterrogation";
            break;
        case UMGSMMAP_Opcode_ss_InvocationNotification:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_Ss_InvocationNotificationArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_Ss_InvocationNotificationRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"ss_InvocationNotification";
            break;
        case UMGSMMAP_Opcode_prepareGroupCall:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_PrepareGroupCallArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_PrepareGroupCallRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"prepareGroupCall";
            break;
        case UMGSMMAP_Opcode_sendGroupCallEndSignal:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_SendGroupCallEndSignalArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_SendGroupCallEndSignalRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"sendGroupCallEndSignal";
            break;
        case UMGSMMAP_Opcode_processGroupCallSignalling:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_ProcessGroupCallSignallingArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"processGroupCallSignalling";
            break;
        case UMGSMMAP_Opcode_forwardGroupCallSignalling:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_ForwardGroupCallSignallingArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"forwardGroupCallSignalling";
            break;
        case UMGSMMAP_Opcode_updateGprsLocation:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_UpdateGprsLocationArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_UpdateGprsLocationRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"updateGprsLocation";
            break;
        case UMGSMMAP_Opcode_sendRoutingInfoForGprs:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_SendRoutingInfoForGprsArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_SendRoutingInfoForGprsRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"sendRoutingInfoForGprs";
            break;
        case UMGSMMAP_Opcode_failureReport:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_FailureReportArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_FailureReportRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"failureReport";
            break;
        case UMGSMMAP_Opcode_noteMsPresentForGprs:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_NoteMsPresentForGprsArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_NoteMsPresentForGprsRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"noteMsPresentForGprs";
            break;
        case UMGSMMAP_Opcode_provideSubscriberLocation:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_ProvideSubscriberLocation_Arg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_ProvideSubscriberLocation_Res alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"provideSubscriberLocation";
            break;
        case UMGSMMAP_Opcode_sendRoutingInfoForLCS:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_RoutingInfoForLCS_Arg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_RoutingInfoForLCS_Res alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"sendRoutingInfoForLCS";
            break;
        case UMGSMMAP_Opcode_subscriberLocationReport:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_SubscriberLocationReport_Arg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_SubscriberLocationReport_Res alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"subscriberLocationReport";
            break;
        case UMGSMMAP_Opcode_ist_Alert:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_IST_AlertArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_IST_AlertRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"ist_Alert";
            break;
        case UMGSMMAP_Opcode_ist_Command:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_IST_CommandArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_IST_CommandRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"ist_Command";
            break;
        case UMGSMMAP_Opcode_authenticationFailureReport:
            switch(operation)
        {
            case UMTCAP_Operation_Request:
                asn1 = [[UMGSMMAP_AuthenticationFailureReportArg alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Response:
                asn1 = [[UMGSMMAP_AuthenticationFailureReportRes alloc]initWithASN1Object:self context:context];
                break;
            case UMTCAP_Operation_Error:
                break;
            case UMTCAP_Operation_Reject:
                break;
            case UMTCAP_Operation_Unidirectional:
                break;
        }
            asn1.operationName = @"authenticationFailureReport";
            break;
        default:
            break;
    }
    if(asn1.operationName.length > 0)
    {
        *xop = asn1.operationName;
    }
    return asn1;
}


- (NSString *)objectName
{
    if(asn1_tag.tagClass ==UMASN1Class_Private)
    {
        return @"ansi_tcap";
    }
    return @"tcap";
}

@end
