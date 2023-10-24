//
//  ulibgsmmap.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//

#import <ulibtcap/ulibtcap.h>

#import <ulibgsmmap/GsmCharSet.h>
#import <ulibgsmmap/NSString+map.h>
#import <ulibgsmmap/NSData+map.h>
#import <ulibgsmmap/UMLayerGSMMAP.h>
#import <ulibgsmmap/UMLayerGSMMAPApplicationContextProtocol.h>

#import <ulibgsmmap/UMLayerGSMMAP_Dialog.h>
#import <ulibgsmmap/UMLayerGSMMAP_UserProtocol.h>
#import <ulibgsmmap/UMLayerGSMMAP_ProviderProtocol.h>
#import <ulibgsmmap/UMLayerGSMMAP_OpCode.h>
#import <ulibgsmmap/UMLayerGSMMAP_ErrorCode.h>
#import <ulibgsmmap/UMGSMMAP_DialogIdentifier.h>
#import <ulibgsmmap/UMGSMMAP_UserIdentifier.h>

#import <ulibgsmmap/UMGSMMAP_APN.h>
#import <ulibgsmmap/UMGSMMAP_ASCI_CallReference.h>
#import <ulibgsmmap/UMGSMMAP_ASNTime.h>
#import <ulibgsmmap/UMGSMMAP_ASNTimeZone.h>
#import <ulibgsmmap/UMGSMMAP_AUTN.h>
#import <ulibgsmmap/UMGSMMAP_AbsentSubscriberDiagnosticSM.h>
#import <ulibgsmmap/UMGSMMAP_AbsentSubscriberParam.h>
#import <ulibgsmmap/UMGSMMAP_AbsentSubscriberReason.h>
#import <ulibgsmmap/UMGSMMAP_AbsentSubscriberSM_Param.h>
#import <ulibgsmmap/UMGSMMAP_ActivateTraceModeArg.h>
#import <ulibgsmmap/UMGSMMAP_ActivateTraceModeRes.h>
#import <ulibgsmmap/UMGSMMAP_Additional_Number.h>
#import <ulibgsmmap/UMGSMMAP_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_AgeOfLocationInformation.h>
#import <ulibgsmmap/UMGSMMAP_AlertReason.h>
#import <ulibgsmmap/UMGSMMAP_AlertServiceCentreArg.h>
#import <ulibgsmmap/UMGSMMAP_AlertingPattern.h>
#import <ulibgsmmap/UMGSMMAP_AnyTimeInterrogationArg.h>
#import <ulibgsmmap/UMGSMMAP_AnyTimeInterrogationRes.h>
#import <ulibgsmmap/UMGSMMAP_ApplicationContexts.h>
#import <ulibgsmmap/UMGSMMAP_Ati_NotAllowedParam.h>
#import <ulibgsmmap/UMGSMMAP_AuthenticationFailureReportArg.h>
#import <ulibgsmmap/UMGSMMAP_AuthenticationFailureReportRes.h>
#import <ulibgsmmap/UMGSMMAP_AuthenticationQuintuplet.h>
#import <ulibgsmmap/UMGSMMAP_AuthenticationQuintupletList.h>
#import <ulibgsmmap/UMGSMMAP_AuthenticationSetList.h>
#import <ulibgsmmap/UMGSMMAP_AuthenticationTriplet.h>
#import <ulibgsmmap/UMGSMMAP_AuthenticationTripletList.h>
#import <ulibgsmmap/UMGSMMAP_BasicServiceCode.h>
#import <ulibgsmmap/UMGSMMAP_BasicServiceCriteria.h>
#import <ulibgsmmap/UMGSMMAP_BasicServiceGroupList.h>
#import <ulibgsmmap/UMGSMMAP_BasicServiceList.h>
#import <ulibgsmmap/UMGSMMAP_BearerServNotProvParam.h>
#import <ulibgsmmap/UMGSMMAP_BearerServiceCode.h>
#import <ulibgsmmap/UMGSMMAP_BearerServiceList.h>
#import <ulibgsmmap/UMGSMMAP_BusySubscriberParam.h>
#import <ulibgsmmap/UMGSMMAP_CCBS_Data.h>
#import <ulibgsmmap/UMGSMMAP_CCBS_Feature.h>
#import <ulibgsmmap/UMGSMMAP_CCBS_FeatureList.h>
#import <ulibgsmmap/UMGSMMAP_CCBS_Index.h>
#import <ulibgsmmap/UMGSMMAP_CCBS_Indicators.h>
#import <ulibgsmmap/UMGSMMAP_CCBS_SubscriberStatus.h>
#import <ulibgsmmap/UMGSMMAP_CK.h>
#import <ulibgsmmap/UMGSMMAP_CKSN.h>
#import <ulibgsmmap/UMGSMMAP_CODEC_Info.h>
#import <ulibgsmmap/UMGSMMAP_CSG_Id.h>
#import <ulibgsmmap/UMGSMMAP_CUG_CheckInfo.h>
#import <ulibgsmmap/UMGSMMAP_CUG_Feature.h>
#import <ulibgsmmap/UMGSMMAP_CUG_FeatureList.h>
#import <ulibgsmmap/UMGSMMAP_CUG_Index.h>
#import <ulibgsmmap/UMGSMMAP_CUG_Info.h>
#import <ulibgsmmap/UMGSMMAP_CUG_Interlock.h>
#import <ulibgsmmap/UMGSMMAP_CUG_RejectCause.h>
#import <ulibgsmmap/UMGSMMAP_CUG_Subscription.h>
#import <ulibgsmmap/UMGSMMAP_CUG_SubscriptionList.h>
#import <ulibgsmmap/UMGSMMAP_CallBarredParam.h>
#import <ulibgsmmap/UMGSMMAP_CallBarringCause.h>
#import <ulibgsmmap/UMGSMMAP_CallBarringFeature.h>
#import <ulibgsmmap/UMGSMMAP_CallBarringFeatureList.h>
#import <ulibgsmmap/UMGSMMAP_CallBarringInfo.h>
#import <ulibgsmmap/UMGSMMAP_CallDirection.h>
#import <ulibgsmmap/UMGSMMAP_CallOutcome.h>
#import <ulibgsmmap/UMGSMMAP_CallReferenceNumber.h>
#import <ulibgsmmap/UMGSMMAP_CallReportData.h>
#import <ulibgsmmap/UMGSMMAP_CallTypeCriteria.h>
#import <ulibgsmmap/UMGSMMAP_CamelCapabilityHandling.h>
#import <ulibgsmmap/UMGSMMAP_CamelInfo.h>
#import <ulibgsmmap/UMGSMMAP_CamelRoutingInfo.h>
#import <ulibgsmmap/UMGSMMAP_CancelLocationArg.h>
#import <ulibgsmmap/UMGSMMAP_CancelLocationRes.h>
#import <ulibgsmmap/UMGSMMAP_CancellationType.h>
#import <ulibgsmmap/UMGSMMAP_Category.h>
#import <ulibgsmmap/UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI.h>
#import <ulibgsmmap/UMGSMMAP_CellIdFixedLength.h>
#import <ulibgsmmap/UMGSMMAP_CellIdOrLAI.h>
#import <ulibgsmmap/UMGSMMAP_ChargingCharacteristics.h>
#import <ulibgsmmap/UMGSMMAP_CipheringAlgorithm.h>
#import <ulibgsmmap/UMGSMMAP_CliRestrictionOption.h>
#import <ulibgsmmap/UMGSMMAP_Code.h>
#import <ulibgsmmap/UMGSMMAP_Constants.h>
#import <ulibgsmmap/UMGSMMAP_ContextId.h>
#import <ulibgsmmap/UMGSMMAP_ContextIdList.h>
#import <ulibgsmmap/UMGSMMAP_Cug_RejectParam.h>
#import <ulibgsmmap/UMGSMMAP_CurrentPassword.h>
#import <ulibgsmmap/UMGSMMAP_CurrentSecurityContext.h>
#import <ulibgsmmap/UMGSMMAP_DataMissingParam.h>
#import <ulibgsmmap/UMGSMMAP_DaylightSavingTime.h>
#import <ulibgsmmap/UMGSMMAP_DeactivateTraceModeArg.h>
#import <ulibgsmmap/UMGSMMAP_DeactivateTraceModeRes.h>
#import <ulibgsmmap/UMGSMMAP_DefaultCallHandling.h>
#import <ulibgsmmap/UMGSMMAP_DeferredLocationEventType.h>
#import <ulibgsmmap/UMGSMMAP_DeleteSubscriberDataArg.h>
#import <ulibgsmmap/UMGSMMAP_DeleteSubscriberDataRes.h>
#import <ulibgsmmap/UMGSMMAP_DestinationNumberCriteria.h>
#import <ulibgsmmap/UMGSMMAP_DestinationNumberLengthList.h>
#import <ulibgsmmap/UMGSMMAP_DestinationNumberList.h>
#import <ulibgsmmap/UMLayerGSMMAP_Dialog.h>
#import <ulibgsmmap/UMGSMMAP_DiameterIdentity.h>
#import <ulibgsmmap/UMGSMMAP_EMLPP_Info.h>
#import <ulibgsmmap/UMGSMMAP_EMLPP_Priority.h>
#import <ulibgsmmap/UMGSMMAP_E_UTRAN_CGI.h>
#import <ulibgsmmap/UMGSMMAP_Eps_AuthenticationSet.h>
#import <ulibgsmmap/UMGSMMAP_Eps_AuthenticationSetList.h>
#import <ulibgsmmap/UMGSMMAP_EquipmentStatus.h>
#import <ulibgsmmap/UMGSMMAP_EraseCC_EntryArg.h>
#import <ulibgsmmap/UMGSMMAP_EraseCC_EntryRes.h>
#import <ulibgsmmap/UMGSMMAP_EventReportData.h>
#import <ulibgsmmap/UMGSMMAP_Ext2_QoS_Subscribed.h>
#import <ulibgsmmap/UMGSMMAP_Ext3_QoS_Subscribed.h>
#import <ulibgsmmap/UMGSMMAP_Ext4_QoS_Subscribed.h>
#import <ulibgsmmap/UMGSMMAP_Ext_BasicServiceCode.h>
#import <ulibgsmmap/UMGSMMAP_Ext_BasicServiceGroupList.h>
#import <ulibgsmmap/UMGSMMAP_Ext_BearerServiceCode.h>
#import <ulibgsmmap/UMGSMMAP_Ext_CallBarFeatureList.h>
#import <ulibgsmmap/UMGSMMAP_Ext_CallBarInfo.h>
#import <ulibgsmmap/UMGSMMAP_Ext_CallBarringFeature.h>
#import <ulibgsmmap/UMGSMMAP_Ext_ExternalSignalInfo.h>
#import <ulibgsmmap/UMGSMMAP_Ext_ForwFeature.h>
#import <ulibgsmmap/UMGSMMAP_Ext_ForwFeatureList.h>
#import <ulibgsmmap/UMGSMMAP_Ext_ForwInfo.h>
#import <ulibgsmmap/UMGSMMAP_Ext_ForwOptions.h>
#import <ulibgsmmap/UMGSMMAP_Ext_GeographicalInformation.h>
#import <ulibgsmmap/UMGSMMAP_Ext_NoRepCondTime.h>
#import <ulibgsmmap/UMGSMMAP_Ext_PDP_Type.h>
#import <ulibgsmmap/UMGSMMAP_Ext_ProtocolId.h>
#import <ulibgsmmap/UMGSMMAP_Ext_QoS_Subscribed.h>
#import <ulibgsmmap/UMGSMMAP_Ext_SS_Data.h>
#import <ulibgsmmap/UMGSMMAP_Ext_SS_Info.h>
#import <ulibgsmmap/UMGSMMAP_Ext_SS_InfoList.h>
#import <ulibgsmmap/UMGSMMAP_Ext_SS_Status.h>
#import <ulibgsmmap/UMGSMMAP_Ext_TeleserviceCode.h>
#import <ulibgsmmap/UMGSMMAP_ExtendedRoutingInfo.h>
#import <ulibgsmmap/UMGSMMAP_ExtensibleCallBarredParam.h>
#import <ulibgsmmap/UMGSMMAP_ExtensibleSystemFailureParam.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_ExternalClient.h>
#import <ulibgsmmap/UMGSMMAP_ExternalClientList.h>
#import <ulibgsmmap/UMGSMMAP_ExternalSignalInfo.h>
#import <ulibgsmmap/UMGSMMAP_FacilityNotSupParam.h>
#import <ulibgsmmap/UMGSMMAP_FailureReportArg.h>
#import <ulibgsmmap/UMGSMMAP_FailureReportRes.h>
#import <ulibgsmmap/UMGSMMAP_ForwardGroupCallSignallingArg.h>
#import <ulibgsmmap/UMGSMMAP_ForwardingData.h>
#import <ulibgsmmap/UMGSMMAP_ForwardingFailedParam.h>
#import <ulibgsmmap/UMGSMMAP_ForwardingFeature.h>
#import <ulibgsmmap/UMGSMMAP_ForwardingFeatureList.h>
#import <ulibgsmmap/UMGSMMAP_ForwardingInfo.h>
#import <ulibgsmmap/UMGSMMAP_ForwardingOptions.h>
#import <ulibgsmmap/UMGSMMAP_ForwardingReason.h>
#import <ulibgsmmap/UMGSMMAP_ForwardingViolationParam.h>
#import <ulibgsmmap/UMGSMMAP_GMLC_List.h>
#import <ulibgsmmap/UMGSMMAP_GMLC_Restriction.h>
#import <ulibgsmmap/UMGSMMAP_GPRSChargingID.h>
#import <ulibgsmmap/UMGSMMAP_GPRSDataList.h>
#import <ulibgsmmap/UMGSMMAP_GPRSMSClass.h>
#import <ulibgsmmap/UMGSMMAP_GPRSSubscriptionData.h>
#import <ulibgsmmap/UMGSMMAP_GPRSSubscriptionDataWithdraw.h>
#import <ulibgsmmap/UMGSMMAP_GSM_SecurityContextData.h>
#import <ulibgsmmap/UMGSMMAP_GSN_Address.h>
#import <ulibgsmmap/UMGSMMAP_GenericServiceInfo.h>
#import <ulibgsmmap/UMGSMMAP_GeodeticInformation.h>
#import <ulibgsmmap/UMGSMMAP_GeographicalInformation.h>
#import <ulibgsmmap/UMGSMMAP_GlobalCellId.h>
#import <ulibgsmmap/UMGSMMAP_GmscCamelSubscriptionInfo.h>
#import <ulibgsmmap/UMGSMMAP_GroupId.h>
#import <ulibgsmmap/UMGSMMAP_GroupKeyNumber.h>
#import <ulibgsmmap/UMGSMMAP_GuidanceInfo.h>
#import <ulibgsmmap/UMGSMMAP_HLR_Id.h>
#import <ulibgsmmap/UMGSMMAP_HLR_List.h>
#import <ulibgsmmap/UMGSMMAP_Horizontal_Accuracy.h>
#import <ulibgsmmap/UMGSMMAP_IK.h>
#import <ulibgsmmap/UMGSMMAP_IMEI.h>
#import <ulibgsmmap/UMGSMMAP_IMSI.h>
#import <ulibgsmmap/UMGSMMAP_IMSI_WithLMSI.h>
#import <ulibgsmmap/UMGSMMAP_IMS_VoiceOverPS_SessionsInd.h>
#import <ulibgsmmap/UMGSMMAP_ISDN_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_ISDN_SubaddressString.h>
#import <ulibgsmmap/UMGSMMAP_IST_AlertArg.h>
#import <ulibgsmmap/UMGSMMAP_IST_AlertRes.h>
#import <ulibgsmmap/UMGSMMAP_IST_CommandArg.h>
#import <ulibgsmmap/UMGSMMAP_IST_CommandRes.h>
#import <ulibgsmmap/UMGSMMAP_Identity.h>
#import <ulibgsmmap/UMGSMMAP_IllegalEquipmentParam.h>
#import <ulibgsmmap/UMGSMMAP_IllegalSubscriberParam.h>
#import <ulibgsmmap/UMGSMMAP_IncompatibleTerminalParam.h>
#import <ulibgsmmap/UMGSMMAP_InformServiceCentreArg.h>
#import <ulibgsmmap/UMGSMMAP_InsertSubscriberDataArg.h>
#import <ulibgsmmap/UMGSMMAP_InsertSubscriberDataRes.h>
#import <ulibgsmmap/UMGSMMAP_InterCUG_Restrictions.h>
#import <ulibgsmmap/UMGSMMAP_InterrogateSS_Res.h>
#import <ulibgsmmap/UMGSMMAP_InterrogationType.h>
#import <ulibgsmmap/UMGSMMAP_IntraCUG_Options.h>
#import <ulibgsmmap/UMGSMMAP_KSI.h>
#import <ulibgsmmap/UMGSMMAP_Kc.h>
#import <ulibgsmmap/UMGSMMAP_LAIFixedLength.h>
#import <ulibgsmmap/UMGSMMAP_LCSClientExternalID.h>
#import <ulibgsmmap/UMGSMMAP_LCSClientInternalID.h>
#import <ulibgsmmap/UMGSMMAP_LCSClientName.h>
#import <ulibgsmmap/UMGSMMAP_LCSClientType.h>
#import <ulibgsmmap/UMGSMMAP_LCSCodeword.h>
#import <ulibgsmmap/UMGSMMAP_LCSInformation.h>
#import <ulibgsmmap/UMGSMMAP_LCSLocationInfo.h>
#import <ulibgsmmap/UMGSMMAP_LCSRequestorID.h>
#import <ulibgsmmap/UMGSMMAP_LCSServiceTypeID.h>
#import <ulibgsmmap/UMGSMMAP_LCS_ClientID.h>
#import <ulibgsmmap/UMGSMMAP_LCS_Event.h>
#import <ulibgsmmap/UMGSMMAP_LCS_Priority.h>
#import <ulibgsmmap/UMGSMMAP_LCS_PrivacyCheck.h>
#import <ulibgsmmap/UMGSMMAP_LCS_PrivacyClass.h>
#import <ulibgsmmap/UMGSMMAP_LCS_PrivacyExceptionList.h>
#import <ulibgsmmap/UMGSMMAP_LCS_QoS.h>
#import <ulibgsmmap/UMGSMMAP_LCS_ReferenceNumber.h>
#import <ulibgsmmap/UMGSMMAP_LMSI.h>
#import <ulibgsmmap/UMGSMMAP_LSAAttributes.h>
#import <ulibgsmmap/UMGSMMAP_LSAData.h>
#import <ulibgsmmap/UMGSMMAP_LSADataList.h>
#import <ulibgsmmap/UMGSMMAP_LSAIdentity.h>
#import <ulibgsmmap/UMGSMMAP_LSAIdentityList.h>
#import <ulibgsmmap/UMGSMMAP_LSAInformation.h>
#import <ulibgsmmap/UMGSMMAP_LSAInformationWithdraw.h>
#import <ulibgsmmap/UMGSMMAP_LSAOnlyAccessIndicator.h>
#import <ulibgsmmap/UMGSMMAP_LocationEstimateType.h>
#import <ulibgsmmap/UMGSMMAP_LocationInfoWithLMSI.h>
#import <ulibgsmmap/UMGSMMAP_LocationInformation.h>
#import <ulibgsmmap/UMGSMMAP_LocationInformationEPS.h>
#import <ulibgsmmap/UMGSMMAP_LocationInformationGPRS.h>
#import <ulibgsmmap/UMGSMMAP_LocationNumber.h>
#import <ulibgsmmap/UMGSMMAP_LocationType.h>
#import <ulibgsmmap/UMGSMMAP_LongTermDenialParam.h>
#import <ulibgsmmap/UMGSMMAP_MAP_PDU.h>
#import <ulibgsmmap/UMGSMMAP_MNPInfoRes.h>
#import <ulibgsmmap/UMGSMMAP_MOLR_Class.h>
#import <ulibgsmmap/UMGSMMAP_MOLR_List.h>
#import <ulibgsmmap/UMGSMMAP_MO_ForwardSM_Arg.h>
#import <ulibgsmmap/UMGSMMAP_MO_ForwardSM_Res.h>
#import <ulibgsmmap/UMGSMMAP_MSNetworkCapability.h>
#import <ulibgsmmap/UMGSMMAP_MSRadioAccessCapability.h>
#import <ulibgsmmap/UMGSMMAP_MS_Classmark2.h>
#import <ulibgsmmap/UMGSMMAP_MT_ForwardSM_Arg.h>
#import <ulibgsmmap/UMGSMMAP_MT_ForwardSM_Res.h>
#import <ulibgsmmap/UMGSMMAP_MW_Status.h>
#import <ulibgsmmap/UMGSMMAP_Macros.h>
#import <ulibgsmmap/UMGSMMAP_MatchType.h>
#import <ulibgsmmap/UMGSMMAP_MessageWaitListFullParam.h>
#import <ulibgsmmap/UMGSMMAP_MonitoringMode.h>
#import <ulibgsmmap/UMGSMMAP_Msisdn.h>
#import <ulibgsmmap/UMGSMMAP_NAEA_CIC.h>
#import <ulibgsmmap/UMGSMMAP_NAEA_PreferredCI.h>
#import <ulibgsmmap/UMGSMMAP_NSAPI.h>
#import <ulibgsmmap/UMGSMMAP_NameString.h>
#import <ulibgsmmap/UMGSMMAP_NetDetNotReachable.h>
#import <ulibgsmmap/UMGSMMAP_NetworkAccessMode.h>
#import <ulibgsmmap/UMGSMMAP_NetworkResource.h>
#import <ulibgsmmap/UMGSMMAP_NewPassword.h>
#import <ulibgsmmap/UMGSMMAP_NoGroupCallNbParam.h>
#import <ulibgsmmap/UMGSMMAP_NoReplyConditionTime.h>
#import <ulibgsmmap/UMGSMMAP_NoRoamingNbParam.h>
#import <ulibgsmmap/UMGSMMAP_NoSubscriberReplyParam.h>
#import <ulibgsmmap/UMGSMMAP_NotReachableReason.h>
#import <ulibgsmmap/UMGSMMAP_NoteMsPresentForGprsArg.h>
#import <ulibgsmmap/UMGSMMAP_NoteMsPresentForGprsRes.h>
#import <ulibgsmmap/UMGSMMAP_NotificationToMSUser.h>
#import <ulibgsmmap/UMGSMMAP_NumberChangedParam.h>
#import <ulibgsmmap/UMGSMMAP_NumberOfForwarding.h>
#import <ulibgsmmap/UMGSMMAP_NumberOfRequestedVectors.h>
#import <ulibgsmmap/UMGSMMAP_NumberPortabilityStatus.h>
#import <ulibgsmmap/UMGSMMAP_ODB_Data.h>
#import <ulibgsmmap/UMGSMMAP_ODB_GeneralData.h>
#import <ulibgsmmap/UMGSMMAP_ODB_HPLMN_Data.h>
#import <ulibgsmmap/UMGSMMAP_OR_Phase.h>
#import <ulibgsmmap/UMGSMMAP_O_BcsmCamelTDPCriteriaList.h>
#import <ulibgsmmap/UMGSMMAP_O_BcsmCamelTDPData.h>
#import <ulibgsmmap/UMGSMMAP_O_BcsmCamelTDPDataList.h>
#import <ulibgsmmap/UMGSMMAP_O_BcsmCamelTDP_Criteria.h>
#import <ulibgsmmap/UMGSMMAP_O_BcsmTriggerDetectionPoint.h>
#import <ulibgsmmap/UMGSMMAP_O_CSI.h>
#import <ulibgsmmap/UMGSMMAP_OldRoutingInfoForSM_Arg.h>
#import <ulibgsmmap/UMGSMMAP_Opcodes.h>
#import <ulibgsmmap/UMGSMMAP_Or_NotAllowedParam.h>
#import <ulibgsmmap/UMGSMMAP_OverrideCategory.h>
#import <ulibgsmmap/UMGSMMAP_PCS_Extensions.h>
#import <ulibgsmmap/UMGSMMAP_PDP_Address.h>
#import <ulibgsmmap/UMGSMMAP_PDP_Context.h>
#import <ulibgsmmap/UMGSMMAP_PDP_ContextInfo.h>
#import <ulibgsmmap/UMGSMMAP_PDP_ContextInfoList.h>
#import <ulibgsmmap/UMGSMMAP_PDP_Type.h>
#import <ulibgsmmap/UMGSMMAP_PLMNClientList.h>
#import <ulibgsmmap/UMGSMMAP_PS_SubscriberState.h>
#import <ulibgsmmap/UMGSMMAP_PeriodicLDRInfo.h>
#import <ulibgsmmap/UMGSMMAP_PositionMethodFailure_Diagnostic.h>
#import <ulibgsmmap/UMGSMMAP_PositionMethodFailure_Param.h>
#import <ulibgsmmap/UMGSMMAP_PrepareGroupCallArg.h>
#import <ulibgsmmap/UMGSMMAP_PrepareGroupCallRes.h>
#import <ulibgsmmap/UMGSMMAP_PrepareHO_Arg.h>
#import <ulibgsmmap/UMGSMMAP_PrepareHO_Res.h>
#import <ulibgsmmap/UMGSMMAP_PrepareSubsequentHO_Arg.h>
#import <ulibgsmmap/UMGSMMAP_Priority.h>
#import <ulibgsmmap/UMGSMMAP_PrivateExtension.h>
#import <ulibgsmmap/UMGSMMAP_PrivateExtensionList.h>
#import <ulibgsmmap/UMGSMMAP_ProcessGroupCallSignallingArg.h>
#import <ulibgsmmap/UMGSMMAP_ProtocolId.h>
#import <ulibgsmmap/UMGSMMAP_ProvideRoamingNumberArg.h>
#import <ulibgsmmap/UMGSMMAP_ProvideRoamingNumberRes.h>
#import <ulibgsmmap/UMGSMMAP_ProvideSIWFSNumberArg.h>
#import <ulibgsmmap/UMGSMMAP_ProvideSIWFSNumberRes.h>
#import <ulibgsmmap/UMGSMMAP_ProvideSubscriberInfoArg.h>
#import <ulibgsmmap/UMGSMMAP_ProvideSubscriberInfoRes.h>
#import <ulibgsmmap/UMGSMMAP_ProvideSubscriberLocation_Arg.h>
#import <ulibgsmmap/UMGSMMAP_ProvideSubscriberLocation_Res.h>
#import <ulibgsmmap/UMGSMMAP_PurgeMS_Arg.h>
#import <ulibgsmmap/UMGSMMAP_PurgeMS_Res.h>
#import <ulibgsmmap/UMGSMMAP_Pw_RegistrationFailureCause.h>
#import <ulibgsmmap/UMGSMMAP_QoS_Subscribed.h>
#import <ulibgsmmap/UMGSMMAP_RAIdentity.h>
#import <ulibgsmmap/UMGSMMAP_RAND.h>
#import <ulibgsmmap/UMGSMMAP_RUF_Outcome.h>
#import <ulibgsmmap/UMGSMMAP_Re_SynchronisationInfo.h>
#import <ulibgsmmap/UMGSMMAP_ReadyForSM_Arg.h>
#import <ulibgsmmap/UMGSMMAP_ReadyForSM_Res.h>
#import <ulibgsmmap/UMGSMMAP_RegionalSubscriptionResponse.h>
#import <ulibgsmmap/UMGSMMAP_RegisterCC_EntryArg.h>
#import <ulibgsmmap/UMGSMMAP_RegisterCC_EntryRes.h>
#import <ulibgsmmap/UMGSMMAP_RegisterSS_Arg.h>
#import <ulibgsmmap/UMGSMMAP_RemoteUserFreeArg.h>
#import <ulibgsmmap/UMGSMMAP_RemoteUserFreeRes.h>
#import <ulibgsmmap/UMGSMMAP_ReportSM_DeliveryStatusArg.h>
#import <ulibgsmmap/UMGSMMAP_ReportSM_DeliveryStatusRes.h>
#import <ulibgsmmap/UMGSMMAP_ReportingPLMNList.h>
#import <ulibgsmmap/UMGSMMAP_ReportingState.h>
#import <ulibgsmmap/UMGSMMAP_RequestedInfo.h>
#import <ulibgsmmap/UMGSMMAP_ResetArg.h>
#import <ulibgsmmap/UMGSMMAP_ResourceLimitationParam.h>
#import <ulibgsmmap/UMGSMMAP_ResponseTime.h>
#import <ulibgsmmap/UMGSMMAP_ResponseTimeCategory.h>
#import <ulibgsmmap/UMGSMMAP_RestoreDataArg.h>
#import <ulibgsmmap/UMGSMMAP_RestoreDataRes.h>
#import <ulibgsmmap/UMGSMMAP_ResumeCallHandlingArg.h>
#import <ulibgsmmap/UMGSMMAP_ResumeCallHandlingRes.h>
#import <ulibgsmmap/UMGSMMAP_RoamingNotAllowedCause.h>
#import <ulibgsmmap/UMGSMMAP_RoamingNotAllowedParam.h>
#import <ulibgsmmap/UMGSMMAP_RouteingNumber.h>
#import <ulibgsmmap/UMGSMMAP_RoutingInfo.h>
#import <ulibgsmmap/UMGSMMAP_RoutingInfoForLCSArg.h>
#import <ulibgsmmap/UMGSMMAP_RoutingInfoForLCSRes.h>
#import <ulibgsmmap/UMGSMMAP_RoutingInfoForLCS_Arg.h>
#import <ulibgsmmap/UMGSMMAP_RoutingInfoForLCS_Res.h>
#import <ulibgsmmap/UMGSMMAP_RoutingInfoForSM_Arg.h>
#import <ulibgsmmap/UMGSMMAP_RoutingInfoForSM_Res.h>
#import <ulibgsmmap/UMGSMMAP_SGSN_Capability.h>
#import <ulibgsmmap/UMGSMMAP_SIWFSSignallingModifyArg.h>
#import <ulibgsmmap/UMGSMMAP_SIWFSSignallingModifyRes.h>
#import <ulibgsmmap/UMGSMMAP_SM_DeliveryOutcome.h>
#import <ulibgsmmap/UMGSMMAP_SM_EnumeratedDeliveryFailureCause.h>
#import <ulibgsmmap/UMGSMMAP_SM_RP_DA.h>
#import <ulibgsmmap/UMGSMMAP_SM_RP_OA.h>
#import <ulibgsmmap/UMGSMMAP_SRES.h>
#import <ulibgsmmap/UMGSMMAP_SS_CSI.h>
#import <ulibgsmmap/UMGSMMAP_SS_CamelData.h>
#import <ulibgsmmap/UMGSMMAP_SS_Code.h>
#import <ulibgsmmap/UMGSMMAP_SS_Data.h>
#import <ulibgsmmap/UMGSMMAP_SS_EventList.h>
#import <ulibgsmmap/UMGSMMAP_SS_EventSpecification.h>
#import <ulibgsmmap/UMGSMMAP_SS_List.h>
#import <ulibgsmmap/UMGSMMAP_SS_Status.h>
#import <ulibgsmmap/UMGSMMAP_SS_SubscriptionOption.h>
#import <ulibgsmmap/UMGSMMAP_SendAuthenticationInfoArg.h>
#import <ulibgsmmap/UMGSMMAP_SendAuthenticationInfoRes.h>
#import <ulibgsmmap/UMGSMMAP_SendGroupCallEndSignalArg.h>
#import <ulibgsmmap/UMGSMMAP_SendGroupCallEndSignalRes.h>
#import <ulibgsmmap/UMGSMMAP_SendIdentificationArg.h>
#import <ulibgsmmap/UMGSMMAP_SendIdentificationRes.h>
#import <ulibgsmmap/UMGSMMAP_SendRoutingInfoArg.h>
#import <ulibgsmmap/UMGSMMAP_SendRoutingInfoForGprsArg.h>
#import <ulibgsmmap/UMGSMMAP_SendRoutingInfoForGprsRes.h>
#import <ulibgsmmap/UMGSMMAP_SendRoutingInfoRes.h>
#import <ulibgsmmap/UMGSMMAP_ServiceIndicator.h>
#import <ulibgsmmap/UMGSMMAP_ServiceKey.h>
#import <ulibgsmmap/UMGSMMAP_SetReportingStateArg.h>
#import <ulibgsmmap/UMGSMMAP_SetReportingStateRes.h>
#import <ulibgsmmap/UMGSMMAP_ShortTermDenialParam.h>
#import <ulibgsmmap/UMGSMMAP_SignalInfo.h>
#import <ulibgsmmap/UMGSMMAP_Sm_DeliveryFailureCause.h>
#import <ulibgsmmap/UMGSMMAP_Ss_ForBS.h>
#import <ulibgsmmap/UMGSMMAP_Ss_IncompatibilityCause.h>
#import <ulibgsmmap/UMGSMMAP_Ss_Info.h>
#import <ulibgsmmap/UMGSMMAP_Ss_InvocationNotificationArg.h>
#import <ulibgsmmap/UMGSMMAP_Ss_InvocationNotificationRes.h>
#import <ulibgsmmap/UMGSMMAP_StatusReportArg.h>
#import <ulibgsmmap/UMGSMMAP_StatusReportRes.h>
#import <ulibgsmmap/UMGSMMAP_SubBusyForMT_SMS_Param.h>
#import <ulibgsmmap/UMGSMMAP_SubscriberData.h>
#import <ulibgsmmap/UMGSMMAP_SubscriberIdentity.h>
#import <ulibgsmmap/UMGSMMAP_SubscriberInfo.h>
#import <ulibgsmmap/UMGSMMAP_SubscriberLocationReport_Arg.h>
#import <ulibgsmmap/UMGSMMAP_SubscriberLocationReport_Res.h>
#import <ulibgsmmap/UMGSMMAP_SubscriberState.h>
#import <ulibgsmmap/UMGSMMAP_SubscriberStatus.h>
#import <ulibgsmmap/UMGSMMAP_SupportedCCBS_Phase.h>
#import <ulibgsmmap/UMGSMMAP_SupportedCamelPhases.h>
#import <ulibgsmmap/UMGSMMAP_SupportedGADShapes.h>
#import <ulibgsmmap/UMGSMMAP_SystemFailureParam.h>
#import <ulibgsmmap/UMGSMMAP_TA_Id.h>
#import <ulibgsmmap/UMGSMMAP_TBCD_STRING.h>
#import <ulibgsmmap/UMGSMMAP_TEID.h>
#import <ulibgsmmap/UMGSMMAP_T_BcsmCamelTDPData.h>
#import <ulibgsmmap/UMGSMMAP_T_BcsmCamelTDPDataList.h>
#import <ulibgsmmap/UMGSMMAP_T_BcsmTriggerDetectionPoint.h>
#import <ulibgsmmap/UMGSMMAP_T_CSI.h>
#import <ulibgsmmap/UMGSMMAP_TeleservNotProvParam.h>
#import <ulibgsmmap/UMGSMMAP_TeleserviceCode.h>
#import <ulibgsmmap/UMGSMMAP_TeleserviceList.h>
#import <ulibgsmmap/UMGSMMAP_Tmsi.h>
#import <ulibgsmmap/UMGSMMAP_TraceReference.h>
#import <ulibgsmmap/UMGSMMAP_TraceType.h>
#import <ulibgsmmap/UMGSMMAP_TracingBufferFullParam.h>
#import <ulibgsmmap/UMGSMMAP_TransactionId.h>
#import <ulibgsmmap/UMGSMMAP_UMTS_SecurityContextData.h>
#import <ulibgsmmap/UMGSMMAP_USSD_DataCodingScheme.h>
#import <ulibgsmmap/UMGSMMAP_USSD_String.h>
#import <ulibgsmmap/UMGSMMAP_UUI.h>
#import <ulibgsmmap/UMGSMMAP_UUIndicator.h>
#import <ulibgsmmap/UMGSMMAP_UU_Data.h>
#import <ulibgsmmap/UMGSMMAP_UnauthorizedLCSClient_Diagnostic.h>
#import <ulibgsmmap/UMGSMMAP_UnauthorizedLCSClient_Param.h>
#import <ulibgsmmap/UMGSMMAP_UnauthorizedRequestingNetwork_Param.h>
#import <ulibgsmmap/UMGSMMAP_UnexpectedDataParam.h>
#import <ulibgsmmap/UMGSMMAP_UnidentifiedSubParam.h>
#import <ulibgsmmap/UMGSMMAP_UnknownOrUnreachableLCSClient_Param.h>
#import <ulibgsmmap/UMGSMMAP_UnknownSubscriberDiagnostic.h>
#import <ulibgsmmap/UMGSMMAP_UnknownSubscriberParam.h>
#import <ulibgsmmap/UMGSMMAP_UpdateGprsLocationArg.h>
#import <ulibgsmmap/UMGSMMAP_UpdateGprsLocationRes.h>
#import <ulibgsmmap/UMGSMMAP_UpdateLocationArg.h>
#import <ulibgsmmap/UMGSMMAP_UpdateLocationRes.h>
#import <ulibgsmmap/UMGSMMAP_Used_RAT_Type.h>
#import <ulibgsmmap/UMGSMMAP_UserCSGInformation.h>
#import <ulibgsmmap/UMGSMMAP_Ussd_Arg.h>
#import <ulibgsmmap/UMGSMMAP_Ussd_Res.h>
#import <ulibgsmmap/UMGSMMAP_VBSDataList.h>
#import <ulibgsmmap/UMGSMMAP_VGCSDataList.h>
#import <ulibgsmmap/UMGSMMAP_VLR_Capability.h>
#import <ulibgsmmap/UMGSMMAP_Vertical_Accuracy.h>
#import <ulibgsmmap/UMGSMMAP_VlrCamelSubscriptionInfo.h>
#import <ulibgsmmap/UMGSMMAP_VoiceBroadcastData.h>
#import <ulibgsmmap/UMGSMMAP_VoiceGroupCallData.h>
#import <ulibgsmmap/UMGSMMAP_XRES.h>
#import <ulibgsmmap/UMGSMMAP_ZoneCode.h>
#import <ulibgsmmap/UMGSMMAP_ZoneCodeList.h>
#import <ulibgsmmap/UMGSMMAP_asn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>
#import <ulibgsmmap/UMGSMMAP_gprsSupportIndicator.h>
#import <ulibgsmmap/UMGSMMAP_SM_RP_MTI.h>
#import <ulibgsmmap/UMGSMMAP_SM_RP_SMEA.h>
#import <ulibgsmmap/UMGSMMAP_MAP_DialoguePDU.h>

#import <ulibgsmmap/UMGSMMAP_IST_SupportIndicator.h>
#import <ulibgsmmap/UMGSMMAP_CallDiversionTreatmentIndicator.h>
#import <ulibgsmmap/UMGSMMAP_SuppressMTSS.h>
#import <ulibgsmmap/UMGSMMAP_AnyTimeSubscriptionInterrogationArg.h>
#import <ulibgsmmap/UMGSMMAP_AnyTimeSubscriptionInterrogationRes.h>

#import <ulibgsmmap/UMGSMMAP_CheckIMEIArg.h>
#import <ulibgsmmap/UMGSMMAP_CheckIMEIRes.h>

#import <ulibgsmmap/UMGSMMAP_UESBI_Iu.h>
#import <ulibgsmmap/UMGSMMAP_UESBI_IuA.h>
#import <ulibgsmmap/UMGSMMAP_UESBI_IuB.h>
#import <ulibgsmmap/UMGSMMAP_RequestedEquipmentInfo.h>
#import <ulibgsmmap/UMGSMMAP_SendParametersArg.h>
#import <ulibgsmmap/UMGSMMAP_RequestParameterList.h>
#import <ulibgsmmap/UMGSMMAP_RequestParameter.h>
#import <ulibgsmmap/UMGSMMAP_SentParameterList.h>
#import <ulibgsmmap/UMGSMMAP_SentParameter.h>
#import <ulibgsmmap/UMGSMMAP_Ki.h>

#import <ulibgsmmap/UMGSMMAP_FTSExtension.h>
#import <ulibgsmmap/UMGSMMAP_FTSExtensionList.h>

#import <ulibgsmmap/UMGSMMAP_StatisticDb.h>
#import <ulibgsmmap/UMGSMMAP_StatisticDbRecord.h>

