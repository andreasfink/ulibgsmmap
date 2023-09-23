//
//  UMGSMMAP_MAP_PDU.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_UpdateLocationArg.h>
#import <ulibgsmmap/UMGSMMAP_UpdateLocationRes.h>
#import <ulibgsmmap/UMGSMMAP_CancelLocationArg.h>
#import <ulibgsmmap/UMGSMMAP_CancelLocationRes.h>
#import <ulibgsmmap/UMGSMMAP_PurgeMS_Arg.h>
#import <ulibgsmmap/UMGSMMAP_PurgeMS_Res.h>
#import <ulibgsmmap/UMGSMMAP_SendIdentificationArg.h>
#import <ulibgsmmap/UMGSMMAP_SendIdentificationRes.h>
#import <ulibgsmmap/UMGSMMAP_PrepareHO_Arg.h>
#import <ulibgsmmap/UMGSMMAP_PrepareHO_Res.h>
#import <ulibgsmmap/UMGSMMAP_ExternalSignalInfo.h>
#import <ulibgsmmap/UMGSMMAP_PrepareSubsequentHO_Arg.h>
#import <ulibgsmmap/UMGSMMAP_SendAuthenticationInfoArg.h>
#import <ulibgsmmap/UMGSMMAP_SendAuthenticationInfoRes.h>
#import <ulibgsmmap/UMGSMMAP_IMEI.h>
#import <ulibgsmmap/UMGSMMAP_EquipmentStatus.h>
#import <ulibgsmmap/UMGSMMAP_InsertSubscriberDataArg.h>
#import <ulibgsmmap/UMGSMMAP_InsertSubscriberDataRes.h>
#import <ulibgsmmap/UMGSMMAP_DeleteSubscriberDataArg.h>
#import <ulibgsmmap/UMGSMMAP_DeleteSubscriberDataRes.h>
#import <ulibgsmmap/UMGSMMAP_ResetArg.h>
#import <ulibgsmmap/UMGSMMAP_RestoreDataArg.h>
#import <ulibgsmmap/UMGSMMAP_RestoreDataRes.h>
#import <ulibgsmmap/UMGSMMAP_ActivateTraceModeArg.h>
#import <ulibgsmmap/UMGSMMAP_ActivateTraceModeRes.h>
#import <ulibgsmmap/UMGSMMAP_DeactivateTraceModeArg.h>
#import <ulibgsmmap/UMGSMMAP_DeactivateTraceModeRes.h>
#import <ulibgsmmap/UMGSMMAP_Msisdn.h>
#import <ulibgsmmap/UMGSMMAP_IMSI.h>
#import <ulibgsmmap/UMGSMMAP_SendRoutingInfoArg.h>
#import <ulibgsmmap/UMGSMMAP_SendRoutingInfoRes.h>
#import <ulibgsmmap/UMGSMMAP_ProvideRoamingNumberArg.h>
#import <ulibgsmmap/UMGSMMAP_ProvideRoamingNumberRes.h>
#import <ulibgsmmap/UMGSMMAP_ResumeCallHandlingArg.h>
#import <ulibgsmmap/UMGSMMAP_ResumeCallHandlingRes.h>
#import <ulibgsmmap/UMGSMMAP_ProvideSIWFSNumberArg.h>
#import <ulibgsmmap/UMGSMMAP_ProvideSIWFSNumberRes.h>
#import <ulibgsmmap/UMGSMMAP_SIWFSSignallingModifyArg.h>
#import <ulibgsmmap/UMGSMMAP_SIWFSSignallingModifyRes.h>
#import <ulibgsmmap/UMGSMMAP_SetReportingStateArg.h>
#import <ulibgsmmap/UMGSMMAP_SetReportingStateRes.h>
#import <ulibgsmmap/UMGSMMAP_StatusReportArg.h>
#import <ulibgsmmap/UMGSMMAP_StatusReportRes.h>
#import <ulibgsmmap/UMGSMMAP_RemoteUserFreeArg.h>
#import <ulibgsmmap/UMGSMMAP_RemoteUserFreeRes.h>
#import <ulibgsmmap/UMGSMMAP_RegisterSS_Arg.h>
#import <ulibgsmmap/UMGSMMAP_Ss_Info.h>
#import <ulibgsmmap/UMGSMMAP_Ss_ForBS.h>
#import <ulibgsmmap/UMGSMMAP_InterrogateSS_Res.h>
#import <ulibgsmmap/UMGSMMAP_Ussd_Arg.h>
#import <ulibgsmmap/UMGSMMAP_Ussd_Res.h>
#import <ulibgsmmap/UMGSMMAP_SS_Code.h>
#import <ulibgsmmap/UMGSMMAP_NewPassword.h>
#import <ulibgsmmap/UMGSMMAP_GuidanceInfo.h>
#import <ulibgsmmap/UMGSMMAP_CurrentPassword.h>
#import <ulibgsmmap/UMGSMMAP_RegisterCC_EntryArg.h>
#import <ulibgsmmap/UMGSMMAP_RegisterCC_EntryRes.h>
#import <ulibgsmmap/UMGSMMAP_EraseCC_EntryArg.h>
#import <ulibgsmmap/UMGSMMAP_EraseCC_EntryRes.h>
#import <ulibgsmmap/UMGSMMAP_RoutingInfoForSM_Arg.h>
#import <ulibgsmmap/UMGSMMAP_RoutingInfoForSM_Res.h>
#import <ulibgsmmap/UMGSMMAP_MO_ForwardSM_Arg.h>
#import <ulibgsmmap/UMGSMMAP_MO_ForwardSM_Res.h>
#import <ulibgsmmap/UMGSMMAP_MT_ForwardSM_Arg.h>
#import <ulibgsmmap/UMGSMMAP_MT_ForwardSM_Res.h>
#import <ulibgsmmap/UMGSMMAP_ReportSM_DeliveryStatusArg.h>
#import <ulibgsmmap/UMGSMMAP_ReportSM_DeliveryStatusRes.h>
#import <ulibgsmmap/UMGSMMAP_InformServiceCentreArg.h>
#import <ulibgsmmap/UMGSMMAP_AlertServiceCentreArg.h>
#import <ulibgsmmap/UMGSMMAP_ReadyForSM_Arg.h>
#import <ulibgsmmap/UMGSMMAP_ReadyForSM_Res.h>
#import <ulibgsmmap/UMGSMMAP_ProvideSubscriberInfoArg.h>
#import <ulibgsmmap/UMGSMMAP_ProvideSubscriberInfoRes.h>
#import <ulibgsmmap/UMGSMMAP_AnyTimeInterrogationArg.h>
#import <ulibgsmmap/UMGSMMAP_AnyTimeInterrogationRes.h>
#import <ulibgsmmap/UMGSMMAP_Ss_InvocationNotificationArg.h>
#import <ulibgsmmap/UMGSMMAP_Ss_InvocationNotificationRes.h>
#import <ulibgsmmap/UMGSMMAP_PrepareGroupCallArg.h>
#import <ulibgsmmap/UMGSMMAP_PrepareGroupCallRes.h>
#import <ulibgsmmap/UMGSMMAP_SendGroupCallEndSignalArg.h>
#import <ulibgsmmap/UMGSMMAP_SendGroupCallEndSignalRes.h>
#import <ulibgsmmap/UMGSMMAP_ProcessGroupCallSignallingArg.h>
#import <ulibgsmmap/UMGSMMAP_ForwardGroupCallSignallingArg.h>
#import <ulibgsmmap/UMGSMMAP_UpdateGprsLocationArg.h>
#import <ulibgsmmap/UMGSMMAP_UpdateGprsLocationRes.h>
#import <ulibgsmmap/UMGSMMAP_SendRoutingInfoForGprsArg.h>
#import <ulibgsmmap/UMGSMMAP_SendRoutingInfoForGprsRes.h>
#import <ulibgsmmap/UMGSMMAP_FailureReportArg.h>
#import <ulibgsmmap/UMGSMMAP_FailureReportRes.h>
#import <ulibgsmmap/UMGSMMAP_NoteMsPresentForGprsArg.h>
#import <ulibgsmmap/UMGSMMAP_NoteMsPresentForGprsRes.h>
#import <ulibgsmmap/UMGSMMAP_ProvideSubscriberLocation_Arg.h>
#import <ulibgsmmap/UMGSMMAP_ProvideSubscriberLocation_Res.h>
#import <ulibgsmmap/UMGSMMAP_RoutingInfoForLCS_Arg.h>
#import <ulibgsmmap/UMGSMMAP_RoutingInfoForLCS_Res.h>
#import <ulibgsmmap/UMGSMMAP_SubscriberLocationReport_Arg.h>
#import <ulibgsmmap/UMGSMMAP_SubscriberLocationReport_Res.h>
#import <ulibgsmmap/UMGSMMAP_AuthenticationFailureReportArg.h>
#import <ulibgsmmap/UMGSMMAP_AuthenticationFailureReportRes.h>

@interface UMGSMMAP_MAP_PDU : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_UpdateLocationArg *updateLocationArg;
	UMGSMMAP_UpdateLocationRes *updateLocationRes;
	UMGSMMAP_CancelLocationArg *cancelLocationArg;
	UMGSMMAP_CancelLocationRes *cancelLocationRes;
	UMGSMMAP_PurgeMS_Arg *purgeMS_Arg;
	UMGSMMAP_PurgeMS_Res *purgeMS_Res;
	UMGSMMAP_SendIdentificationArg *sendIdentificationArg;
	UMGSMMAP_SendIdentificationRes *sendIdentificationRes;
	UMGSMMAP_PrepareHO_Arg *prepareHO_Arg;
	UMGSMMAP_PrepareHO_Res *prepareHO_Res;
	UMGSMMAP_ExternalSignalInfo *bss_APDU;
	UMGSMMAP_PrepareSubsequentHO_Arg *prepareSubsequentHO_Arg;
	UMGSMMAP_SendAuthenticationInfoArg *sendAuthenticationInfoArg;
	UMGSMMAP_SendAuthenticationInfoRes *sendAuthenticationInfoRes;
	UMGSMMAP_IMEI *imei;
	UMGSMMAP_EquipmentStatus *equipmentStatus;
	UMGSMMAP_InsertSubscriberDataArg *insertSubscriberDataArg;
	UMGSMMAP_InsertSubscriberDataRes *insertSubscriberDataRes;
	UMGSMMAP_DeleteSubscriberDataArg *deleteSubscriberDataArg;
	UMGSMMAP_DeleteSubscriberDataRes *deleteSubscriberDataRes;
	UMGSMMAP_ResetArg *resetArg;
	UMGSMMAP_RestoreDataArg *restoreDataArg;
	UMGSMMAP_RestoreDataRes *restoreDataRes;
	UMGSMMAP_ActivateTraceModeArg *activateTraceModeArg;
	UMGSMMAP_ActivateTraceModeRes *activateTraceModeRes;
	UMGSMMAP_DeactivateTraceModeArg *deactivateTraceModeArg;
	UMGSMMAP_DeactivateTraceModeRes *deactivateTraceModeRes;
	UMGSMMAP_Msisdn *msisdn;
	UMGSMMAP_IMSI *imsi;
	UMGSMMAP_SendRoutingInfoArg *sendRoutingInfoArg;
	UMGSMMAP_SendRoutingInfoRes *sendRoutingInfoRes;
	UMGSMMAP_ProvideRoamingNumberArg *provideRoamingNumberArg;
	UMGSMMAP_ProvideRoamingNumberRes *provideRoamingNumberRes;
	UMGSMMAP_ResumeCallHandlingArg *resumeCallHandlingArg;
	UMGSMMAP_ResumeCallHandlingRes *resumeCallHandlingRes;
	UMGSMMAP_ProvideSIWFSNumberArg *provideSIWFSNumberArg;
	UMGSMMAP_ProvideSIWFSNumberRes *provideSIWFSNumberRes;
	UMGSMMAP_SIWFSSignallingModifyArg *sIWFSSignallingModifyArg;
	UMGSMMAP_SIWFSSignallingModifyRes *sIWFSSignallingModifyRes;
	UMGSMMAP_SetReportingStateArg *setReportingStateArg;
	UMGSMMAP_SetReportingStateRes *setReportingStateRes;
	UMGSMMAP_StatusReportArg *statusReportArg;
	UMGSMMAP_StatusReportRes *statusReportRes;
	UMGSMMAP_RemoteUserFreeArg *remoteUserFreeArg;
	UMGSMMAP_RemoteUserFreeRes *remoteUserFreeRes;
	UMGSMMAP_RegisterSS_Arg *registerSS_Arg;
	UMGSMMAP_Ss_Info *ss_Info;
	UMGSMMAP_Ss_ForBS *ss_ForBS;
	UMGSMMAP_InterrogateSS_Res *interrogateSS_Res;
	UMGSMMAP_Ussd_Arg *ussd_Arg;
	UMGSMMAP_Ussd_Res *ussd_Res;
	UMGSMMAP_SS_Code *ss_Code;
	UMGSMMAP_NewPassword *newPassword;
	UMGSMMAP_GuidanceInfo *guidanceInfo;
	UMGSMMAP_CurrentPassword *currentPassword;
	UMGSMMAP_RegisterCC_EntryArg *registerCC_EntryArg;
	UMGSMMAP_RegisterCC_EntryRes *registerCC_EntryRes;
	UMGSMMAP_EraseCC_EntryArg *eraseCC_EntryArg;
	UMGSMMAP_EraseCC_EntryRes *eraseCC_EntryRes;
	UMGSMMAP_RoutingInfoForSM_Arg *routingInfoForSM_Arg;
	UMGSMMAP_RoutingInfoForSM_Res *routingInfoForSM_Res;
	UMGSMMAP_MO_ForwardSM_Arg *mo_ForwardSM_Arg;
	UMGSMMAP_MO_ForwardSM_Res *mo_ForwardSM_Res;
	UMGSMMAP_MT_ForwardSM_Arg *mt_ForwardSM_Arg;
	UMGSMMAP_MT_ForwardSM_Res *mt_ForwardSM_Res;
	UMGSMMAP_ReportSM_DeliveryStatusArg *reportSM_DeliveryStatusArg;
	UMGSMMAP_ReportSM_DeliveryStatusRes *reportSM_DeliveryStatusRes;
	UMGSMMAP_InformServiceCentreArg *informServiceCentreArg;
	UMGSMMAP_AlertServiceCentreArg *alertServiceCentreArg;
	UMGSMMAP_ReadyForSM_Arg *readyForSM_Arg;
	UMGSMMAP_ReadyForSM_Res *readyForSM_Res;
	UMGSMMAP_ProvideSubscriberInfoArg *provideSubscriberInfoArg;
	UMGSMMAP_ProvideSubscriberInfoRes *provideSubscriberInfoRes;
	UMGSMMAP_AnyTimeInterrogationArg *anyTimeInterrogationArg;
	UMGSMMAP_AnyTimeInterrogationRes *anyTimeInterrogationRes;
	UMGSMMAP_Ss_InvocationNotificationArg *ss_InvocationNotificationArg;
	UMGSMMAP_Ss_InvocationNotificationRes *ss_InvocationNotificationRes;
	UMGSMMAP_PrepareGroupCallArg *prepareGroupCallArg;
	UMGSMMAP_PrepareGroupCallRes *prepareGroupCallRes;
	UMGSMMAP_SendGroupCallEndSignalArg *sendGroupCallEndSignalArg;
	UMGSMMAP_SendGroupCallEndSignalRes *sendGroupCallEndSignalRes;
	UMGSMMAP_ProcessGroupCallSignallingArg *processGroupCallSignallingArg;
	UMGSMMAP_ForwardGroupCallSignallingArg *forwardGroupCallSignallingArg;
	UMGSMMAP_UpdateGprsLocationArg *updateGprsLocationArg;
	UMGSMMAP_UpdateGprsLocationRes *updateGprsLocationRes;
	UMGSMMAP_SendRoutingInfoForGprsArg *sendRoutingInfoForGprsArg;
	UMGSMMAP_SendRoutingInfoForGprsRes *sendRoutingInfoForGprsRes;
	UMGSMMAP_FailureReportArg *failureReportArg;
	UMGSMMAP_FailureReportRes *failureReportRes;
	UMGSMMAP_NoteMsPresentForGprsArg *noteMsPresentForGprsArg;
	UMGSMMAP_NoteMsPresentForGprsRes *noteMsPresentForGprsRes;
	UMGSMMAP_ProvideSubscriberLocation_Arg *provideSubscriberLocation_Arg;
	UMGSMMAP_ProvideSubscriberLocation_Res *provideSubscriberLocation_Res;
	UMGSMMAP_RoutingInfoForLCS_Arg *routingInfoForLCS_Arg;
	UMGSMMAP_RoutingInfoForLCS_Res *routingInfoForLCS_Res;
	UMGSMMAP_SubscriberLocationReport_Arg *subscriberLocationReport_Arg;
	UMGSMMAP_SubscriberLocationReport_Res *subscriberLocationReport_Res;
	UMGSMMAP_AuthenticationFailureReportArg *authenticationFailureReportArg;
	UMGSMMAP_AuthenticationFailureReportRes *authenticationFailureReportRes;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_UpdateLocationArg *updateLocationArg;
@property(readwrite,strong)	UMGSMMAP_UpdateLocationRes *updateLocationRes;
@property(readwrite,strong)	UMGSMMAP_CancelLocationArg *cancelLocationArg;
@property(readwrite,strong)	UMGSMMAP_CancelLocationRes *cancelLocationRes;
@property(readwrite,strong)	UMGSMMAP_PurgeMS_Arg *purgeMS_Arg;
@property(readwrite,strong)	UMGSMMAP_PurgeMS_Res *purgeMS_Res;
@property(readwrite,strong)	UMGSMMAP_SendIdentificationArg *sendIdentificationArg;
@property(readwrite,strong)	UMGSMMAP_SendIdentificationRes *sendIdentificationRes;
@property(readwrite,strong)	UMGSMMAP_PrepareHO_Arg *prepareHO_Arg;
@property(readwrite,strong)	UMGSMMAP_PrepareHO_Res *prepareHO_Res;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *bss_APDU;
@property(readwrite,strong)	UMGSMMAP_PrepareSubsequentHO_Arg *prepareSubsequentHO_Arg;
@property(readwrite,strong)	UMGSMMAP_SendAuthenticationInfoArg *sendAuthenticationInfoArg;
@property(readwrite,strong)	UMGSMMAP_SendAuthenticationInfoRes *sendAuthenticationInfoRes;
@property(readwrite,strong)	UMGSMMAP_IMEI *imei;
@property(readwrite,strong)	UMGSMMAP_EquipmentStatus *equipmentStatus;
@property(readwrite,strong)	UMGSMMAP_InsertSubscriberDataArg *insertSubscriberDataArg;
@property(readwrite,strong)	UMGSMMAP_InsertSubscriberDataRes *insertSubscriberDataRes;
@property(readwrite,strong)	UMGSMMAP_DeleteSubscriberDataArg *deleteSubscriberDataArg;
@property(readwrite,strong)	UMGSMMAP_DeleteSubscriberDataRes *deleteSubscriberDataRes;
@property(readwrite,strong)	UMGSMMAP_ResetArg *resetArg;
@property(readwrite,strong)	UMGSMMAP_RestoreDataArg *restoreDataArg;
@property(readwrite,strong)	UMGSMMAP_RestoreDataRes *restoreDataRes;
@property(readwrite,strong)	UMGSMMAP_ActivateTraceModeArg *activateTraceModeArg;
@property(readwrite,strong)	UMGSMMAP_ActivateTraceModeRes *activateTraceModeRes;
@property(readwrite,strong)	UMGSMMAP_DeactivateTraceModeArg *deactivateTraceModeArg;
@property(readwrite,strong)	UMGSMMAP_DeactivateTraceModeRes *deactivateTraceModeRes;
@property(readwrite,strong)	UMGSMMAP_Msisdn *msisdn;
@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMGSMMAP_SendRoutingInfoArg *sendRoutingInfoArg;
@property(readwrite,strong)	UMGSMMAP_SendRoutingInfoRes *sendRoutingInfoRes;
@property(readwrite,strong)	UMGSMMAP_ProvideRoamingNumberArg *provideRoamingNumberArg;
@property(readwrite,strong)	UMGSMMAP_ProvideRoamingNumberRes *provideRoamingNumberRes;
@property(readwrite,strong)	UMGSMMAP_ResumeCallHandlingArg *resumeCallHandlingArg;
@property(readwrite,strong)	UMGSMMAP_ResumeCallHandlingRes *resumeCallHandlingRes;
@property(readwrite,strong)	UMGSMMAP_ProvideSIWFSNumberArg *provideSIWFSNumberArg;
@property(readwrite,strong)	UMGSMMAP_ProvideSIWFSNumberRes *provideSIWFSNumberRes;
@property(readwrite,strong)	UMGSMMAP_SIWFSSignallingModifyArg *sIWFSSignallingModifyArg;
@property(readwrite,strong)	UMGSMMAP_SIWFSSignallingModifyRes *sIWFSSignallingModifyRes;
@property(readwrite,strong)	UMGSMMAP_SetReportingStateArg *setReportingStateArg;
@property(readwrite,strong)	UMGSMMAP_SetReportingStateRes *setReportingStateRes;
@property(readwrite,strong)	UMGSMMAP_StatusReportArg *statusReportArg;
@property(readwrite,strong)	UMGSMMAP_StatusReportRes *statusReportRes;
@property(readwrite,strong)	UMGSMMAP_RemoteUserFreeArg *remoteUserFreeArg;
@property(readwrite,strong)	UMGSMMAP_RemoteUserFreeRes *remoteUserFreeRes;
@property(readwrite,strong)	UMGSMMAP_RegisterSS_Arg *registerSS_Arg;
@property(readwrite,strong)	UMGSMMAP_Ss_Info *ss_Info;
@property(readwrite,strong)	UMGSMMAP_Ss_ForBS *ss_ForBS;
@property(readwrite,strong)	UMGSMMAP_InterrogateSS_Res *interrogateSS_Res;
@property(readwrite,strong)	UMGSMMAP_Ussd_Arg *ussd_Arg;
@property(readwrite,strong)	UMGSMMAP_Ussd_Res *ussd_Res;
@property(readwrite,strong)	UMGSMMAP_SS_Code *ss_Code;
@property(readwrite,strong)	UMGSMMAP_NewPassword *newPassword;
@property(readwrite,strong)	UMGSMMAP_GuidanceInfo *guidanceInfo;
@property(readwrite,strong)	UMGSMMAP_CurrentPassword *currentPassword;
@property(readwrite,strong)	UMGSMMAP_RegisterCC_EntryArg *registerCC_EntryArg;
@property(readwrite,strong)	UMGSMMAP_RegisterCC_EntryRes *registerCC_EntryRes;
@property(readwrite,strong)	UMGSMMAP_EraseCC_EntryArg *eraseCC_EntryArg;
@property(readwrite,strong)	UMGSMMAP_EraseCC_EntryRes *eraseCC_EntryRes;
@property(readwrite,strong)	UMGSMMAP_RoutingInfoForSM_Arg *routingInfoForSM_Arg;
@property(readwrite,strong)	UMGSMMAP_RoutingInfoForSM_Res *routingInfoForSM_Res;
@property(readwrite,strong)	UMGSMMAP_MO_ForwardSM_Arg *mo_ForwardSM_Arg;
@property(readwrite,strong)	UMGSMMAP_MO_ForwardSM_Res *mo_ForwardSM_Res;
@property(readwrite,strong)	UMGSMMAP_MT_ForwardSM_Arg *mt_ForwardSM_Arg;
@property(readwrite,strong)	UMGSMMAP_MT_ForwardSM_Res *mt_ForwardSM_Res;
@property(readwrite,strong)	UMGSMMAP_ReportSM_DeliveryStatusArg *reportSM_DeliveryStatusArg;
@property(readwrite,strong)	UMGSMMAP_ReportSM_DeliveryStatusRes *reportSM_DeliveryStatusRes;
@property(readwrite,strong)	UMGSMMAP_InformServiceCentreArg *informServiceCentreArg;
@property(readwrite,strong)	UMGSMMAP_AlertServiceCentreArg *alertServiceCentreArg;
@property(readwrite,strong)	UMGSMMAP_ReadyForSM_Arg *readyForSM_Arg;
@property(readwrite,strong)	UMGSMMAP_ReadyForSM_Res *readyForSM_Res;
@property(readwrite,strong)	UMGSMMAP_ProvideSubscriberInfoArg *provideSubscriberInfoArg;
@property(readwrite,strong)	UMGSMMAP_ProvideSubscriberInfoRes *provideSubscriberInfoRes;
@property(readwrite,strong)	UMGSMMAP_AnyTimeInterrogationArg *anyTimeInterrogationArg;
@property(readwrite,strong)	UMGSMMAP_AnyTimeInterrogationRes *anyTimeInterrogationRes;
@property(readwrite,strong)	UMGSMMAP_Ss_InvocationNotificationArg *ss_InvocationNotificationArg;
@property(readwrite,strong)	UMGSMMAP_Ss_InvocationNotificationRes *ss_InvocationNotificationRes;
@property(readwrite,strong)	UMGSMMAP_PrepareGroupCallArg *prepareGroupCallArg;
@property(readwrite,strong)	UMGSMMAP_PrepareGroupCallRes *prepareGroupCallRes;
@property(readwrite,strong)	UMGSMMAP_SendGroupCallEndSignalArg *sendGroupCallEndSignalArg;
@property(readwrite,strong)	UMGSMMAP_SendGroupCallEndSignalRes *sendGroupCallEndSignalRes;
@property(readwrite,strong)	UMGSMMAP_ProcessGroupCallSignallingArg *processGroupCallSignallingArg;
@property(readwrite,strong)	UMGSMMAP_ForwardGroupCallSignallingArg *forwardGroupCallSignallingArg;
@property(readwrite,strong)	UMGSMMAP_UpdateGprsLocationArg *updateGprsLocationArg;
@property(readwrite,strong)	UMGSMMAP_UpdateGprsLocationRes *updateGprsLocationRes;
@property(readwrite,strong)	UMGSMMAP_SendRoutingInfoForGprsArg *sendRoutingInfoForGprsArg;
@property(readwrite,strong)	UMGSMMAP_SendRoutingInfoForGprsRes *sendRoutingInfoForGprsRes;
@property(readwrite,strong)	UMGSMMAP_FailureReportArg *failureReportArg;
@property(readwrite,strong)	UMGSMMAP_FailureReportRes *failureReportRes;
@property(readwrite,strong)	UMGSMMAP_NoteMsPresentForGprsArg *noteMsPresentForGprsArg;
@property(readwrite,strong)	UMGSMMAP_NoteMsPresentForGprsRes *noteMsPresentForGprsRes;
@property(readwrite,strong)	UMGSMMAP_ProvideSubscriberLocation_Arg *provideSubscriberLocation_Arg;
@property(readwrite,strong)	UMGSMMAP_ProvideSubscriberLocation_Res *provideSubscriberLocation_Res;
@property(readwrite,strong)	UMGSMMAP_RoutingInfoForLCS_Arg *routingInfoForLCS_Arg;
@property(readwrite,strong)	UMGSMMAP_RoutingInfoForLCS_Res *routingInfoForLCS_Res;
@property(readwrite,strong)	UMGSMMAP_SubscriberLocationReport_Arg *subscriberLocationReport_Arg;
@property(readwrite,strong)	UMGSMMAP_SubscriberLocationReport_Res *subscriberLocationReport_Res;
@property(readwrite,strong)	UMGSMMAP_AuthenticationFailureReportArg *authenticationFailureReportArg;
@property(readwrite,strong)	UMGSMMAP_AuthenticationFailureReportRes *authenticationFailureReportRes;


- (void)processBeforeEncode;
- (UMGSMMAP_MAP_PDU *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end
