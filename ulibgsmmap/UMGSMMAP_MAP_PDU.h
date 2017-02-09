//
//  UMGSMMAP_MAP_PDU.h
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

#import "UMGSMMAP_UpdateLocationArg.h"
#import "UMGSMMAP_UpdateLocationRes.h"
#import "UMGSMMAP_CancelLocationArg.h"
#import "UMGSMMAP_CancelLocationRes.h"
#import "UMGSMMAP_PurgeMS_Arg.h"
#import "UMGSMMAP_PurgeMS_Res.h"
#import "UMGSMMAP_SendIdentificationArg.h"
#import "UMGSMMAP_SendIdentificationRes.h"
#import "UMGSMMAP_PrepareHO_Arg.h"
#import "UMGSMMAP_PrepareHO_Res.h"
#import "UMGSMMAP_ExternalSignalInfo.h"
#import "UMGSMMAP_PrepareSubsequentHO_Arg.h"
#import "UMGSMMAP_SendAuthenticationInfoArg.h"
#import "UMGSMMAP_SendAuthenticationInfoRes.h"
#import "UMGSMMAP_IMEI.h"
#import "UMGSMMAP_EquipmentStatus.h"
#import "UMGSMMAP_InsertSubscriberDataArg.h"
#import "UMGSMMAP_InsertSubscriberDataRes.h"
#import "UMGSMMAP_DeleteSubscriberDataArg.h"
#import "UMGSMMAP_DeleteSubscriberDataRes.h"
#import "UMGSMMAP_ResetArg.h"
#import "UMGSMMAP_RestoreDataArg.h"
#import "UMGSMMAP_RestoreDataRes.h"
#import "UMGSMMAP_ActivateTraceModeArg.h"
#import "UMGSMMAP_ActivateTraceModeRes.h"
#import "UMGSMMAP_DeactivateTraceModeArg.h"
#import "UMGSMMAP_DeactivateTraceModeRes.h"
#import "UMGSMMAP_Msisdn.h"
#import "UMGSMMAP_IMSI.h"
#import "UMGSMMAP_SendRoutingInfoArg.h"
#import "UMGSMMAP_SendRoutingInfoRes.h"
#import "UMGSMMAP_ProvideRoamingNumberArg.h"
#import "UMGSMMAP_ProvideRoamingNumberRes.h"
#import "UMGSMMAP_ResumeCallHandlingArg.h"
#import "UMGSMMAP_ResumeCallHandlingRes.h"
#import "UMGSMMAP_ProvideSIWFSNumberArg.h"
#import "UMGSMMAP_ProvideSIWFSNumberRes.h"
#import "UMGSMMAP_SIWFSSignallingModifyArg.h"
#import "UMGSMMAP_SIWFSSignallingModifyRes.h"
#import "UMGSMMAP_SetReportingStateArg.h"
#import "UMGSMMAP_SetReportingStateRes.h"
#import "UMGSMMAP_StatusReportArg.h"
#import "UMGSMMAP_StatusReportRes.h"
#import "UMGSMMAP_RemoteUserFreeArg.h"
#import "UMGSMMAP_RemoteUserFreeRes.h"
#import "UMGSMMAP_RegisterSS_Arg.h"
#import "UMGSMMAP_Ss_Info.h"
#import "UMGSMMAP_Ss_ForBS.h"
#import "UMGSMMAP_InterrogateSS_Res.h"
#import "UMGSMMAP_Ussd_Arg.h"
#import "UMGSMMAP_Ussd_Res.h"
#import "UMGSMMAP_SS_Code.h"
#import "UMGSMMAP_NewPassword.h"
#import "UMGSMMAP_GuidanceInfo.h"
#import "UMGSMMAP_CurrentPassword.h"
#import "UMGSMMAP_RegisterCC_EntryArg.h"
#import "UMGSMMAP_RegisterCC_EntryRes.h"
#import "UMGSMMAP_EraseCC_EntryArg.h"
#import "UMGSMMAP_EraseCC_EntryRes.h"
#import "UMGSMMAP_RoutingInfoForSM_Arg.h"
#import "UMGSMMAP_RoutingInfoForSM_Res.h"
#import "UMGSMMAP_MO_ForwardSM_Arg.h"
#import "UMGSMMAP_MO_ForwardSM_Res.h"
#import "UMGSMMAP_MT_ForwardSM_Arg.h"
#import "UMGSMMAP_MT_ForwardSM_Res.h"
#import "UMGSMMAP_ReportSM_DeliveryStatusArg.h"
#import "UMGSMMAP_ReportSM_DeliveryStatusRes.h"
#import "UMGSMMAP_InformServiceCentreArg.h"
#import "UMGSMMAP_AlertServiceCentreArg.h"
#import "UMGSMMAP_ReadyForSM_Arg.h"
#import "UMGSMMAP_ReadyForSM_Res.h"
#import "UMGSMMAP_ProvideSubscriberInfoArg.h"
#import "UMGSMMAP_ProvideSubscriberInfoRes.h"
#import "UMGSMMAP_AnyTimeInterrogationArg.h"
#import "UMGSMMAP_AnyTimeInterrogationRes.h"
#import "UMGSMMAP_Ss_InvocationNotificationArg.h"
#import "UMGSMMAP_Ss_InvocationNotificationRes.h"
#import "UMGSMMAP_PrepareGroupCallArg.h"
#import "UMGSMMAP_PrepareGroupCallRes.h"
#import "UMGSMMAP_SendGroupCallEndSignalArg.h"
#import "UMGSMMAP_SendGroupCallEndSignalRes.h"
#import "UMGSMMAP_ProcessGroupCallSignallingArg.h"
#import "UMGSMMAP_ForwardGroupCallSignallingArg.h"
#import "UMGSMMAP_UpdateGprsLocationArg.h"
#import "UMGSMMAP_UpdateGprsLocationRes.h"
#import "UMGSMMAP_SendRoutingInfoForGprsArg.h"
#import "UMGSMMAP_SendRoutingInfoForGprsRes.h"
#import "UMGSMMAP_FailureReportArg.h"
#import "UMGSMMAP_FailureReportRes.h"
#import "UMGSMMAP_NoteMsPresentForGprsArg.h"
#import "UMGSMMAP_NoteMsPresentForGprsRes.h"
#import "UMGSMMAP_ProvideSubscriberLocation_Arg.h"
#import "UMGSMMAP_ProvideSubscriberLocation_Res.h"
#import "UMGSMMAP_RoutingInfoForLCS_Arg.h"
#import "UMGSMMAP_RoutingInfoForLCS_Res.h"
#import "UMGSMMAP_SubscriberLocationReport_Arg.h"
#import "UMGSMMAP_SubscriberLocationReport_Res.h"
#import "UMGSMMAP_AuthenticationFailureReportArg.h"
#import "UMGSMMAP_AuthenticationFailureReportRes.h"

@interface UMGSMMAP_MAP_PDU : UMASN1Choice<UMGSMMAP_asn1_protocol>
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
	UMGSMMAP_NewPassword *theNewPassword;
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
@property(readwrite,strong)	UMGSMMAP_NewPassword *theNewPassword;
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
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end
