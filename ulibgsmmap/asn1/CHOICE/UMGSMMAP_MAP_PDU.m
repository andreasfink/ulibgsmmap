//
//  UMGSMMAP_MAP_PDU.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_MAP_PDU.h>

@implementation UMGSMMAP_MAP_PDU


@synthesize	operationName;
@synthesize	updateLocationArg;
@synthesize	updateLocationRes;
@synthesize	cancelLocationArg;
@synthesize	cancelLocationRes;
@synthesize	purgeMS_Arg;
@synthesize	purgeMS_Res;
@synthesize	sendIdentificationArg;
@synthesize	sendIdentificationRes;
@synthesize	prepareHO_Arg;
@synthesize	prepareHO_Res;
@synthesize	bss_APDU;
@synthesize	prepareSubsequentHO_Arg;
@synthesize	sendAuthenticationInfoArg;
@synthesize	sendAuthenticationInfoRes;
@synthesize	imei;
@synthesize	equipmentStatus;
@synthesize	insertSubscriberDataArg;
@synthesize	insertSubscriberDataRes;
@synthesize	deleteSubscriberDataArg;
@synthesize	deleteSubscriberDataRes;
@synthesize	resetArg;
@synthesize	restoreDataArg;
@synthesize	restoreDataRes;
@synthesize	activateTraceModeArg;
@synthesize	activateTraceModeRes;
@synthesize	deactivateTraceModeArg;
@synthesize	deactivateTraceModeRes;
@synthesize	msisdn;
@synthesize	imsi;
@synthesize	sendRoutingInfoArg;
@synthesize	sendRoutingInfoRes;
@synthesize	provideRoamingNumberArg;
@synthesize	provideRoamingNumberRes;
@synthesize	resumeCallHandlingArg;
@synthesize	resumeCallHandlingRes;
@synthesize	provideSIWFSNumberArg;
@synthesize	provideSIWFSNumberRes;
@synthesize	sIWFSSignallingModifyArg;
@synthesize	sIWFSSignallingModifyRes;
@synthesize	setReportingStateArg;
@synthesize	setReportingStateRes;
@synthesize	statusReportArg;
@synthesize	statusReportRes;
@synthesize	remoteUserFreeArg;
@synthesize	remoteUserFreeRes;
@synthesize	registerSS_Arg;
@synthesize	ss_Info;
@synthesize	ss_ForBS;
@synthesize	interrogateSS_Res;
@synthesize	ussd_Arg;
@synthesize	ussd_Res;
@synthesize	ss_Code;
@synthesize	newPassword;
@synthesize	guidanceInfo;
@synthesize	currentPassword;
@synthesize	registerCC_EntryArg;
@synthesize	registerCC_EntryRes;
@synthesize	eraseCC_EntryArg;
@synthesize	eraseCC_EntryRes;
@synthesize	routingInfoForSM_Arg;
@synthesize	routingInfoForSM_Res;
@synthesize	mo_ForwardSM_Arg;
@synthesize	mo_ForwardSM_Res;
@synthesize	mt_ForwardSM_Arg;
@synthesize	mt_ForwardSM_Res;
@synthesize	reportSM_DeliveryStatusArg;
@synthesize	reportSM_DeliveryStatusRes;
@synthesize	informServiceCentreArg;
@synthesize	alertServiceCentreArg;
@synthesize	readyForSM_Arg;
@synthesize	readyForSM_Res;
@synthesize	provideSubscriberInfoArg;
@synthesize	provideSubscriberInfoRes;
@synthesize	anyTimeInterrogationArg;
@synthesize	anyTimeInterrogationRes;
@synthesize	ss_InvocationNotificationArg;
@synthesize	ss_InvocationNotificationRes;
@synthesize	prepareGroupCallArg;
@synthesize	prepareGroupCallRes;
@synthesize	sendGroupCallEndSignalArg;
@synthesize	sendGroupCallEndSignalRes;
@synthesize	processGroupCallSignallingArg;
@synthesize	forwardGroupCallSignallingArg;
@synthesize	updateGprsLocationArg;
@synthesize	updateGprsLocationRes;
@synthesize	sendRoutingInfoForGprsArg;
@synthesize	sendRoutingInfoForGprsRes;
@synthesize	failureReportArg;
@synthesize	failureReportRes;
@synthesize	noteMsPresentForGprsArg;
@synthesize	noteMsPresentForGprsRes;
@synthesize	provideSubscriberLocation_Arg;
@synthesize	provideSubscriberLocation_Res;
@synthesize	routingInfoForLCS_Arg;
@synthesize	routingInfoForLCS_Res;
@synthesize	subscriberLocationReport_Arg;
@synthesize	subscriberLocationReport_Res;
@synthesize	authenticationFailureReportArg;
@synthesize	authenticationFailureReportRes;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(updateLocationArg)
	{
		updateLocationArg.asn1_tag.tagNumber = 0;
		updateLocationArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:updateLocationArg];
	}
	else if(updateLocationRes)
	{
		updateLocationRes.asn1_tag.tagNumber = 1;
		updateLocationRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:updateLocationRes];
	}
	else if(cancelLocationArg)
	{
		cancelLocationArg.asn1_tag.tagNumber = 2;
		cancelLocationArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:cancelLocationArg];
	}
	else if(cancelLocationRes)
	{
		cancelLocationRes.asn1_tag.tagNumber = 3;
		cancelLocationRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:cancelLocationRes];
	}
	else if(purgeMS_Arg)
	{
		purgeMS_Arg.asn1_tag.tagNumber = 4;
		purgeMS_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:purgeMS_Arg];
	}
	else if(purgeMS_Res)
	{
		purgeMS_Res.asn1_tag.tagNumber = 5;
		purgeMS_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:purgeMS_Res];
	}
	else if(sendIdentificationArg)
	{
		sendIdentificationArg.asn1_tag.tagNumber = 6;
		sendIdentificationArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sendIdentificationArg];
	}
	else if(sendIdentificationRes)
	{
		sendIdentificationRes.asn1_tag.tagNumber = 7;
		sendIdentificationRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sendIdentificationRes];
	}
	else if(prepareHO_Arg)
	{
		prepareHO_Arg.asn1_tag.tagNumber = 8;
		prepareHO_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:prepareHO_Arg];
	}
	else if(prepareHO_Res)
	{
		prepareHO_Res.asn1_tag.tagNumber = 9;
		prepareHO_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:prepareHO_Res];
	}
	else if(bss_APDU)
	{
		bss_APDU.asn1_tag.tagNumber = 10;
		bss_APDU.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:bss_APDU];
	}
	else if(prepareSubsequentHO_Arg)
	{
		prepareSubsequentHO_Arg.asn1_tag.tagNumber = 11;
		prepareSubsequentHO_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:prepareSubsequentHO_Arg];
	}
	else if(sendAuthenticationInfoArg)
	{
		sendAuthenticationInfoArg.asn1_tag.tagNumber = 12;
		sendAuthenticationInfoArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sendAuthenticationInfoArg];
	}
	else if(sendAuthenticationInfoRes)
	{
		sendAuthenticationInfoRes.asn1_tag.tagNumber = 13;
		sendAuthenticationInfoRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sendAuthenticationInfoRes];
	}
	else if(imei)
	{
		imei.asn1_tag.tagNumber = 14;
		imei.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:imei];
	}
	else if(equipmentStatus)
	{
		equipmentStatus.asn1_tag.tagNumber = 15;
		equipmentStatus.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:equipmentStatus];
	}
	else if(insertSubscriberDataArg)
	{
		insertSubscriberDataArg.asn1_tag.tagNumber = 16;
		insertSubscriberDataArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:insertSubscriberDataArg];
	}
	else if(insertSubscriberDataRes)
	{
		insertSubscriberDataRes.asn1_tag.tagNumber = 17;
		insertSubscriberDataRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:insertSubscriberDataRes];
	}
	else if(deleteSubscriberDataArg)
	{
		deleteSubscriberDataArg.asn1_tag.tagNumber = 18;
		deleteSubscriberDataArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:deleteSubscriberDataArg];
	}
	else if(deleteSubscriberDataRes)
	{
		deleteSubscriberDataRes.asn1_tag.tagNumber = 19;
		deleteSubscriberDataRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:deleteSubscriberDataRes];
	}
	else if(resetArg)
	{
		resetArg.asn1_tag.tagNumber = 20;
		resetArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:resetArg];
	}
	else if(restoreDataArg)
	{
		restoreDataArg.asn1_tag.tagNumber = 21;
		restoreDataArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:restoreDataArg];
	}
	else if(restoreDataRes)
	{
		restoreDataRes.asn1_tag.tagNumber = 22;
		restoreDataRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:restoreDataRes];
	}
	else if(activateTraceModeArg)
	{
		activateTraceModeArg.asn1_tag.tagNumber = 23;
		activateTraceModeArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:activateTraceModeArg];
	}
	else if(activateTraceModeRes)
	{
		activateTraceModeRes.asn1_tag.tagNumber = 24;
		activateTraceModeRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:activateTraceModeRes];
	}
	else if(deactivateTraceModeArg)
	{
		deactivateTraceModeArg.asn1_tag.tagNumber = 25;
		deactivateTraceModeArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:deactivateTraceModeArg];
	}
	else if(deactivateTraceModeRes)
	{
		deactivateTraceModeRes.asn1_tag.tagNumber = 26;
		deactivateTraceModeRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:deactivateTraceModeRes];
	}
	else if(msisdn)
	{
		msisdn.asn1_tag.tagNumber = 27;
		msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:msisdn];
	}
	else if(imsi)
	{
		imsi.asn1_tag.tagNumber = 28;
		imsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:imsi];
	}
	else if(sendRoutingInfoArg)
	{
		sendRoutingInfoArg.asn1_tag.tagNumber = 29;
		sendRoutingInfoArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sendRoutingInfoArg];
	}
	else if(sendRoutingInfoRes)
	{
		sendRoutingInfoRes.asn1_tag.tagNumber = 30;
		sendRoutingInfoRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sendRoutingInfoRes];
	}
	else if(provideRoamingNumberArg)
	{
		provideRoamingNumberArg.asn1_tag.tagNumber = 31;
		provideRoamingNumberArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:provideRoamingNumberArg];
	}
	else if(provideRoamingNumberRes)
	{
		provideRoamingNumberRes.asn1_tag.tagNumber = 32;
		provideRoamingNumberRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:provideRoamingNumberRes];
	}
	else if(resumeCallHandlingArg)
	{
		resumeCallHandlingArg.asn1_tag.tagNumber = 33;
		resumeCallHandlingArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:resumeCallHandlingArg];
	}
	else if(resumeCallHandlingRes)
	{
		resumeCallHandlingRes.asn1_tag.tagNumber = 34;
		resumeCallHandlingRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:resumeCallHandlingRes];
	}
	else if(provideSIWFSNumberArg)
	{
		provideSIWFSNumberArg.asn1_tag.tagNumber = 35;
		provideSIWFSNumberArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:provideSIWFSNumberArg];
	}
	else if(provideSIWFSNumberRes)
	{
		provideSIWFSNumberRes.asn1_tag.tagNumber = 36;
		provideSIWFSNumberRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:provideSIWFSNumberRes];
	}
	else if(sIWFSSignallingModifyArg)
	{
		sIWFSSignallingModifyArg.asn1_tag.tagNumber = 37;
		sIWFSSignallingModifyArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sIWFSSignallingModifyArg];
	}
	else if(sIWFSSignallingModifyRes)
	{
		sIWFSSignallingModifyRes.asn1_tag.tagNumber = 38;
		sIWFSSignallingModifyRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sIWFSSignallingModifyRes];
	}
	else if(setReportingStateArg)
	{
		setReportingStateArg.asn1_tag.tagNumber = 39;
		setReportingStateArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:setReportingStateArg];
	}
	else if(setReportingStateRes)
	{
		setReportingStateRes.asn1_tag.tagNumber = 40;
		setReportingStateRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:setReportingStateRes];
	}
	else if(statusReportArg)
	{
		statusReportArg.asn1_tag.tagNumber = 41;
		statusReportArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:statusReportArg];
	}
	else if(statusReportRes)
	{
		statusReportRes.asn1_tag.tagNumber = 42;
		statusReportRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:statusReportRes];
	}
	else if(remoteUserFreeArg)
	{
		remoteUserFreeArg.asn1_tag.tagNumber = 43;
		remoteUserFreeArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:remoteUserFreeArg];
	}
	else if(remoteUserFreeRes)
	{
		remoteUserFreeRes.asn1_tag.tagNumber = 44;
		remoteUserFreeRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:remoteUserFreeRes];
	}
	else if(registerSS_Arg)
	{
		registerSS_Arg.asn1_tag.tagNumber = 45;
		registerSS_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:registerSS_Arg];
	}
	else if(ss_Info)
	{
		ss_Info.asn1_tag.tagNumber = 46;
		ss_Info.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ss_Info];
	}
	else if(ss_ForBS)
	{
		ss_ForBS.asn1_tag.tagNumber = 47;
		ss_ForBS.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ss_ForBS];
	}
	else if(interrogateSS_Res)
	{
		interrogateSS_Res.asn1_tag.tagNumber = 48;
		interrogateSS_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:interrogateSS_Res];
	}
	else if(ussd_Arg)
	{
		ussd_Arg.asn1_tag.tagNumber = 49;
		ussd_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ussd_Arg];
	}
	else if(ussd_Res)
	{
		ussd_Res.asn1_tag.tagNumber = 50;
		ussd_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ussd_Res];
	}
	else if(ss_Code)
	{
		ss_Code.asn1_tag.tagNumber = 51;
		ss_Code.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ss_Code];
	}
	else if(newPassword)
	{
		newPassword.asn1_tag.tagNumber = 52;
		newPassword.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:newPassword];
	}
	else if(guidanceInfo)
	{
		guidanceInfo.asn1_tag.tagNumber = 53;
		guidanceInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:guidanceInfo];
	}
	else if(currentPassword)
	{
		currentPassword.asn1_tag.tagNumber = 54;
		currentPassword.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:currentPassword];
	}
	else if(registerCC_EntryArg)
	{
		registerCC_EntryArg.asn1_tag.tagNumber = 55;
		registerCC_EntryArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:registerCC_EntryArg];
	}
	else if(registerCC_EntryRes)
	{
		registerCC_EntryRes.asn1_tag.tagNumber = 56;
		registerCC_EntryRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:registerCC_EntryRes];
	}
	else if(eraseCC_EntryArg)
	{
		eraseCC_EntryArg.asn1_tag.tagNumber = 57;
		eraseCC_EntryArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:eraseCC_EntryArg];
	}
	else if(eraseCC_EntryRes)
	{
		eraseCC_EntryRes.asn1_tag.tagNumber = 58;
		eraseCC_EntryRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:eraseCC_EntryRes];
	}
	else if(routingInfoForSM_Arg)
	{
		routingInfoForSM_Arg.asn1_tag.tagNumber = 59;
		routingInfoForSM_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:routingInfoForSM_Arg];
	}
	else if(routingInfoForSM_Res)
	{
		routingInfoForSM_Res.asn1_tag.tagNumber = 60;
		routingInfoForSM_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:routingInfoForSM_Res];
	}
	else if(mo_ForwardSM_Arg)
	{
		mo_ForwardSM_Arg.asn1_tag.tagNumber = 61;
		mo_ForwardSM_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:mo_ForwardSM_Arg];
	}
	else if(mo_ForwardSM_Res)
	{
		mo_ForwardSM_Res.asn1_tag.tagNumber = 62;
		mo_ForwardSM_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:mo_ForwardSM_Res];
	}
	else if(mt_ForwardSM_Arg)
	{
		mt_ForwardSM_Arg.asn1_tag.tagNumber = 63;
		mt_ForwardSM_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:mt_ForwardSM_Arg];
	}
	else if(mt_ForwardSM_Res)
	{
		mt_ForwardSM_Res.asn1_tag.tagNumber = 64;
		mt_ForwardSM_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:mt_ForwardSM_Res];
	}
	else if(reportSM_DeliveryStatusArg)
	{
		reportSM_DeliveryStatusArg.asn1_tag.tagNumber = 65;
		reportSM_DeliveryStatusArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:reportSM_DeliveryStatusArg];
	}
	else if(reportSM_DeliveryStatusRes)
	{
		reportSM_DeliveryStatusRes.asn1_tag.tagNumber = 66;
		reportSM_DeliveryStatusRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:reportSM_DeliveryStatusRes];
	}
	else if(informServiceCentreArg)
	{
		informServiceCentreArg.asn1_tag.tagNumber = 67;
		informServiceCentreArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:informServiceCentreArg];
	}
	else if(alertServiceCentreArg)
	{
		alertServiceCentreArg.asn1_tag.tagNumber = 68;
		alertServiceCentreArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:alertServiceCentreArg];
	}
	else if(readyForSM_Arg)
	{
		readyForSM_Arg.asn1_tag.tagNumber = 69;
		readyForSM_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:readyForSM_Arg];
	}
	else if(readyForSM_Res)
	{
		readyForSM_Res.asn1_tag.tagNumber = 70;
		readyForSM_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:readyForSM_Res];
	}
	else if(provideSubscriberInfoArg)
	{
		provideSubscriberInfoArg.asn1_tag.tagNumber = 71;
		provideSubscriberInfoArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:provideSubscriberInfoArg];
	}
	else if(provideSubscriberInfoRes)
	{
		provideSubscriberInfoRes.asn1_tag.tagNumber = 72;
		provideSubscriberInfoRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:provideSubscriberInfoRes];
	}
	else if(anyTimeInterrogationArg)
	{
		anyTimeInterrogationArg.asn1_tag.tagNumber = 73;
		anyTimeInterrogationArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:anyTimeInterrogationArg];
	}
	else if(anyTimeInterrogationRes)
	{
		anyTimeInterrogationRes.asn1_tag.tagNumber = 74;
		anyTimeInterrogationRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:anyTimeInterrogationRes];
	}
	else if(ss_InvocationNotificationArg)
	{
		ss_InvocationNotificationArg.asn1_tag.tagNumber = 75;
		ss_InvocationNotificationArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ss_InvocationNotificationArg];
	}
	else if(ss_InvocationNotificationRes)
	{
		ss_InvocationNotificationRes.asn1_tag.tagNumber = 76;
		ss_InvocationNotificationRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ss_InvocationNotificationRes];
	}
	else if(prepareGroupCallArg)
	{
		prepareGroupCallArg.asn1_tag.tagNumber = 77;
		prepareGroupCallArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:prepareGroupCallArg];
	}
	else if(prepareGroupCallRes)
	{
		prepareGroupCallRes.asn1_tag.tagNumber = 78;
		prepareGroupCallRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:prepareGroupCallRes];
	}
	else if(sendGroupCallEndSignalArg)
	{
		sendGroupCallEndSignalArg.asn1_tag.tagNumber = 79;
		sendGroupCallEndSignalArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sendGroupCallEndSignalArg];
	}
	else if(sendGroupCallEndSignalRes)
	{
		sendGroupCallEndSignalRes.asn1_tag.tagNumber = 80;
		sendGroupCallEndSignalRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sendGroupCallEndSignalRes];
	}
	else if(processGroupCallSignallingArg)
	{
		processGroupCallSignallingArg.asn1_tag.tagNumber = 81;
		processGroupCallSignallingArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:processGroupCallSignallingArg];
	}
	else if(forwardGroupCallSignallingArg)
	{
		forwardGroupCallSignallingArg.asn1_tag.tagNumber = 82;
		forwardGroupCallSignallingArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:forwardGroupCallSignallingArg];
	}
	else if(updateGprsLocationArg)
	{
		updateGprsLocationArg.asn1_tag.tagNumber = 83;
		updateGprsLocationArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:updateGprsLocationArg];
	}
	else if(updateGprsLocationRes)
	{
		updateGprsLocationRes.asn1_tag.tagNumber = 84;
		updateGprsLocationRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:updateGprsLocationRes];
	}
	else if(sendRoutingInfoForGprsArg)
	{
		sendRoutingInfoForGprsArg.asn1_tag.tagNumber = 85;
		sendRoutingInfoForGprsArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sendRoutingInfoForGprsArg];
	}
	else if(sendRoutingInfoForGprsRes)
	{
		sendRoutingInfoForGprsRes.asn1_tag.tagNumber = 86;
		sendRoutingInfoForGprsRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sendRoutingInfoForGprsRes];
	}
	else if(failureReportArg)
	{
		failureReportArg.asn1_tag.tagNumber = 87;
		failureReportArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:failureReportArg];
	}
	else if(failureReportRes)
	{
		failureReportRes.asn1_tag.tagNumber = 88;
		failureReportRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:failureReportRes];
	}
	else if(noteMsPresentForGprsArg)
	{
		noteMsPresentForGprsArg.asn1_tag.tagNumber = 89;
		noteMsPresentForGprsArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:noteMsPresentForGprsArg];
	}
	else if(noteMsPresentForGprsRes)
	{
		noteMsPresentForGprsRes.asn1_tag.tagNumber = 90;
		noteMsPresentForGprsRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:noteMsPresentForGprsRes];
	}
	else if(provideSubscriberLocation_Arg)
	{
		provideSubscriberLocation_Arg.asn1_tag.tagNumber = 91;
		provideSubscriberLocation_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:provideSubscriberLocation_Arg];
	}
	else if(provideSubscriberLocation_Res)
	{
		provideSubscriberLocation_Res.asn1_tag.tagNumber = 92;
		provideSubscriberLocation_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:provideSubscriberLocation_Res];
	}
	else if(routingInfoForLCS_Arg)
	{
		routingInfoForLCS_Arg.asn1_tag.tagNumber = 93;
		routingInfoForLCS_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:routingInfoForLCS_Arg];
	}
	else if(routingInfoForLCS_Res)
	{
		routingInfoForLCS_Res.asn1_tag.tagNumber = 94;
		routingInfoForLCS_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:routingInfoForLCS_Res];
	}
	else if(subscriberLocationReport_Arg)
	{
		subscriberLocationReport_Arg.asn1_tag.tagNumber = 95;
		subscriberLocationReport_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:subscriberLocationReport_Arg];
	}
	else if(subscriberLocationReport_Res)
	{
		subscriberLocationReport_Res.asn1_tag.tagNumber = 96;
		subscriberLocationReport_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:subscriberLocationReport_Res];
	}
	else if(authenticationFailureReportArg)
	{
		authenticationFailureReportArg.asn1_tag.tagNumber = 97;
		authenticationFailureReportArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:authenticationFailureReportArg];
	}
	else if(authenticationFailureReportRes)
	{
		authenticationFailureReportRes.asn1_tag.tagNumber = 98;
		authenticationFailureReportRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:authenticationFailureReportRes];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_MAP_PDU choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_MAP_PDU *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_MAP_PDU"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		updateLocationArg = [[UMGSMMAP_UpdateLocationArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		updateLocationRes = [[UMGSMMAP_UpdateLocationRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		cancelLocationArg = [[UMGSMMAP_CancelLocationArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		cancelLocationRes = [[UMGSMMAP_CancelLocationRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		purgeMS_Arg = [[UMGSMMAP_PurgeMS_Arg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		purgeMS_Res = [[UMGSMMAP_PurgeMS_Res alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sendIdentificationArg = [[UMGSMMAP_SendIdentificationArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sendIdentificationRes = [[UMGSMMAP_SendIdentificationRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		prepareHO_Arg = [[UMGSMMAP_PrepareHO_Arg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		prepareHO_Res = [[UMGSMMAP_PrepareHO_Res alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		bss_APDU = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 11) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		prepareSubsequentHO_Arg = [[UMGSMMAP_PrepareSubsequentHO_Arg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 12) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sendAuthenticationInfoArg = [[UMGSMMAP_SendAuthenticationInfoArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 13) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sendAuthenticationInfoRes = [[UMGSMMAP_SendAuthenticationInfoRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 14) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imei = [[UMGSMMAP_IMEI alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 15) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		equipmentStatus = [[UMGSMMAP_EquipmentStatus alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 16) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		insertSubscriberDataArg = [[UMGSMMAP_InsertSubscriberDataArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 17) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		insertSubscriberDataRes = [[UMGSMMAP_InsertSubscriberDataRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 18) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		deleteSubscriberDataArg = [[UMGSMMAP_DeleteSubscriberDataArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 19) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		deleteSubscriberDataRes = [[UMGSMMAP_DeleteSubscriberDataRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 20) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		resetArg = [[UMGSMMAP_ResetArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 21) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		restoreDataArg = [[UMGSMMAP_RestoreDataArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 22) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		restoreDataRes = [[UMGSMMAP_RestoreDataRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 23) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		activateTraceModeArg = [[UMGSMMAP_ActivateTraceModeArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 24) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		activateTraceModeRes = [[UMGSMMAP_ActivateTraceModeRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 25) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		deactivateTraceModeArg = [[UMGSMMAP_DeactivateTraceModeArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 26) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		deactivateTraceModeRes = [[UMGSMMAP_DeactivateTraceModeRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 27) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		msisdn = [[UMGSMMAP_Msisdn alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 28) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 29) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sendRoutingInfoArg = [[UMGSMMAP_SendRoutingInfoArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 30) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sendRoutingInfoRes = [[UMGSMMAP_SendRoutingInfoRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 31) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		provideRoamingNumberArg = [[UMGSMMAP_ProvideRoamingNumberArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 32) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		provideRoamingNumberRes = [[UMGSMMAP_ProvideRoamingNumberRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 33) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		resumeCallHandlingArg = [[UMGSMMAP_ResumeCallHandlingArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 34) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		resumeCallHandlingRes = [[UMGSMMAP_ResumeCallHandlingRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 35) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		provideSIWFSNumberArg = [[UMGSMMAP_ProvideSIWFSNumberArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 36) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		provideSIWFSNumberRes = [[UMGSMMAP_ProvideSIWFSNumberRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 37) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sIWFSSignallingModifyArg = [[UMGSMMAP_SIWFSSignallingModifyArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 38) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sIWFSSignallingModifyRes = [[UMGSMMAP_SIWFSSignallingModifyRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 39) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		setReportingStateArg = [[UMGSMMAP_SetReportingStateArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 40) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		setReportingStateRes = [[UMGSMMAP_SetReportingStateRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 41) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		statusReportArg = [[UMGSMMAP_StatusReportArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 42) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		statusReportRes = [[UMGSMMAP_StatusReportRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 43) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		remoteUserFreeArg = [[UMGSMMAP_RemoteUserFreeArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 44) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		remoteUserFreeRes = [[UMGSMMAP_RemoteUserFreeRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 45) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		registerSS_Arg = [[UMGSMMAP_RegisterSS_Arg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 46) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_Info = [[UMGSMMAP_Ss_Info alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 47) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_ForBS = [[UMGSMMAP_Ss_ForBS alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 48) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		interrogateSS_Res = [[UMGSMMAP_InterrogateSS_Res alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 49) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ussd_Arg = [[UMGSMMAP_Ussd_Arg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 50) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ussd_Res = [[UMGSMMAP_Ussd_Res alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 51) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_Code = [[UMGSMMAP_SS_Code alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 52) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		newPassword = [[UMGSMMAP_NewPassword alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 53) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		guidanceInfo = [[UMGSMMAP_GuidanceInfo alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 54) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		currentPassword = [[UMGSMMAP_CurrentPassword alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 55) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		registerCC_EntryArg = [[UMGSMMAP_RegisterCC_EntryArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 56) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		registerCC_EntryRes = [[UMGSMMAP_RegisterCC_EntryRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 57) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		eraseCC_EntryArg = [[UMGSMMAP_EraseCC_EntryArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 58) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		eraseCC_EntryRes = [[UMGSMMAP_EraseCC_EntryRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 59) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		routingInfoForSM_Arg = [[UMGSMMAP_RoutingInfoForSM_Arg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 60) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		routingInfoForSM_Res = [[UMGSMMAP_RoutingInfoForSM_Res alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 61) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		mo_ForwardSM_Arg = [[UMGSMMAP_MO_ForwardSM_Arg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 62) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		mo_ForwardSM_Res = [[UMGSMMAP_MO_ForwardSM_Res alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 63) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		mt_ForwardSM_Arg = [[UMGSMMAP_MT_ForwardSM_Arg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 64) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		mt_ForwardSM_Res = [[UMGSMMAP_MT_ForwardSM_Res alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 65) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		reportSM_DeliveryStatusArg = [[UMGSMMAP_ReportSM_DeliveryStatusArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 66) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		reportSM_DeliveryStatusRes = [[UMGSMMAP_ReportSM_DeliveryStatusRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 67) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		informServiceCentreArg = [[UMGSMMAP_InformServiceCentreArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 68) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		alertServiceCentreArg = [[UMGSMMAP_AlertServiceCentreArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 69) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		readyForSM_Arg = [[UMGSMMAP_ReadyForSM_Arg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 70) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		readyForSM_Res = [[UMGSMMAP_ReadyForSM_Res alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 71) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		provideSubscriberInfoArg = [[UMGSMMAP_ProvideSubscriberInfoArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 72) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		provideSubscriberInfoRes = [[UMGSMMAP_ProvideSubscriberInfoRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 73) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		anyTimeInterrogationArg = [[UMGSMMAP_AnyTimeInterrogationArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 74) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		anyTimeInterrogationRes = [[UMGSMMAP_AnyTimeInterrogationRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 75) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_InvocationNotificationArg = [[UMGSMMAP_Ss_InvocationNotificationArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 76) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_InvocationNotificationRes = [[UMGSMMAP_Ss_InvocationNotificationRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 77) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		prepareGroupCallArg = [[UMGSMMAP_PrepareGroupCallArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 78) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		prepareGroupCallRes = [[UMGSMMAP_PrepareGroupCallRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 79) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sendGroupCallEndSignalArg = [[UMGSMMAP_SendGroupCallEndSignalArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 80) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sendGroupCallEndSignalRes = [[UMGSMMAP_SendGroupCallEndSignalRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 81) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		processGroupCallSignallingArg = [[UMGSMMAP_ProcessGroupCallSignallingArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 82) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardGroupCallSignallingArg = [[UMGSMMAP_ForwardGroupCallSignallingArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 83) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		updateGprsLocationArg = [[UMGSMMAP_UpdateGprsLocationArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 84) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		updateGprsLocationRes = [[UMGSMMAP_UpdateGprsLocationRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 85) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sendRoutingInfoForGprsArg = [[UMGSMMAP_SendRoutingInfoForGprsArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 86) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sendRoutingInfoForGprsRes = [[UMGSMMAP_SendRoutingInfoForGprsRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 87) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		failureReportArg = [[UMGSMMAP_FailureReportArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 88) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		failureReportRes = [[UMGSMMAP_FailureReportRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 89) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		noteMsPresentForGprsArg = [[UMGSMMAP_NoteMsPresentForGprsArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 90) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		noteMsPresentForGprsRes = [[UMGSMMAP_NoteMsPresentForGprsRes alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 91) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		provideSubscriberLocation_Arg = [[UMGSMMAP_ProvideSubscriberLocation_Arg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 92) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		provideSubscriberLocation_Res = [[UMGSMMAP_ProvideSubscriberLocation_Res alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 93) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		routingInfoForLCS_Arg = [[UMGSMMAP_RoutingInfoForLCS_Arg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 94) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		routingInfoForLCS_Res = [[UMGSMMAP_RoutingInfoForLCS_Res alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 95) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		subscriberLocationReport_Arg = [[UMGSMMAP_SubscriberLocationReport_Arg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 96) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		subscriberLocationReport_Res = [[UMGSMMAP_SubscriberLocationReport_Res alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 97) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		authenticationFailureReportArg = [[UMGSMMAP_AuthenticationFailureReportArg alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 98) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		authenticationFailureReportRes = [[UMGSMMAP_AuthenticationFailureReportRes alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"MAP-PDU";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(updateLocationArg)
	{
		dict[@"updateLocationArg"] = updateLocationArg.objectValue;
	}
	if(updateLocationRes)
	{
		dict[@"updateLocationRes"] = updateLocationRes.objectValue;
	}
	if(cancelLocationArg)
	{
		dict[@"cancelLocationArg"] = cancelLocationArg.objectValue;
	}
	if(cancelLocationRes)
	{
		dict[@"cancelLocationRes"] = cancelLocationRes.objectValue;
	}
	if(purgeMS_Arg)
	{
		dict[@"purgeMS-Arg"] = purgeMS_Arg.objectValue;
	}
	if(purgeMS_Res)
	{
		dict[@"purgeMS-Res"] = purgeMS_Res.objectValue;
	}
	if(sendIdentificationArg)
	{
		dict[@"sendIdentificationArg"] = sendIdentificationArg.objectValue;
	}
	if(sendIdentificationRes)
	{
		dict[@"sendIdentificationRes"] = sendIdentificationRes.objectValue;
	}
	if(prepareHO_Arg)
	{
		dict[@"prepareHO-Arg"] = prepareHO_Arg.objectValue;
	}
	if(prepareHO_Res)
	{
		dict[@"prepareHO-Res"] = prepareHO_Res.objectValue;
	}
	if(bss_APDU)
	{
		dict[@"bss-APDU"] = bss_APDU.objectValue;
	}
	if(prepareSubsequentHO_Arg)
	{
		dict[@"prepareSubsequentHO-Arg"] = prepareSubsequentHO_Arg.objectValue;
	}
	if(sendAuthenticationInfoArg)
	{
		dict[@"sendAuthenticationInfoArg"] = sendAuthenticationInfoArg.objectValue;
	}
	if(sendAuthenticationInfoRes)
	{
		dict[@"sendAuthenticationInfoRes"] = sendAuthenticationInfoRes.objectValue;
	}
	if(imei)
	{
		dict[@"imei"] = imei.objectValue;
	}
	if(equipmentStatus)
	{
		dict[@"equipmentStatus"] = equipmentStatus.objectValue;
	}
	if(insertSubscriberDataArg)
	{
		dict[@"insertSubscriberDataArg"] = insertSubscriberDataArg.objectValue;
	}
	if(insertSubscriberDataRes)
	{
		dict[@"insertSubscriberDataRes"] = insertSubscriberDataRes.objectValue;
	}
	if(deleteSubscriberDataArg)
	{
		dict[@"deleteSubscriberDataArg"] = deleteSubscriberDataArg.objectValue;
	}
	if(deleteSubscriberDataRes)
	{
		dict[@"deleteSubscriberDataRes"] = deleteSubscriberDataRes.objectValue;
	}
	if(resetArg)
	{
		dict[@"resetArg"] = resetArg.objectValue;
	}
	if(restoreDataArg)
	{
		dict[@"restoreDataArg"] = restoreDataArg.objectValue;
	}
	if(restoreDataRes)
	{
		dict[@"restoreDataRes"] = restoreDataRes.objectValue;
	}
	if(activateTraceModeArg)
	{
		dict[@"activateTraceModeArg"] = activateTraceModeArg.objectValue;
	}
	if(activateTraceModeRes)
	{
		dict[@"activateTraceModeRes"] = activateTraceModeRes.objectValue;
	}
	if(deactivateTraceModeArg)
	{
		dict[@"deactivateTraceModeArg"] = deactivateTraceModeArg.objectValue;
	}
	if(deactivateTraceModeRes)
	{
		dict[@"deactivateTraceModeRes"] = deactivateTraceModeRes.objectValue;
	}
	if(msisdn)
	{
		dict[@"msisdn"] = msisdn.objectValue;
	}
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(sendRoutingInfoArg)
	{
		dict[@"sendRoutingInfoArg"] = sendRoutingInfoArg.objectValue;
	}
	if(sendRoutingInfoRes)
	{
		dict[@"sendRoutingInfoRes"] = sendRoutingInfoRes.objectValue;
	}
	if(provideRoamingNumberArg)
	{
		dict[@"provideRoamingNumberArg"] = provideRoamingNumberArg.objectValue;
	}
	if(provideRoamingNumberRes)
	{
		dict[@"provideRoamingNumberRes"] = provideRoamingNumberRes.objectValue;
	}
	if(resumeCallHandlingArg)
	{
		dict[@"resumeCallHandlingArg"] = resumeCallHandlingArg.objectValue;
	}
	if(resumeCallHandlingRes)
	{
		dict[@"resumeCallHandlingRes"] = resumeCallHandlingRes.objectValue;
	}
	if(provideSIWFSNumberArg)
	{
		dict[@"provideSIWFSNumberArg"] = provideSIWFSNumberArg.objectValue;
	}
	if(provideSIWFSNumberRes)
	{
		dict[@"provideSIWFSNumberRes"] = provideSIWFSNumberRes.objectValue;
	}
	if(sIWFSSignallingModifyArg)
	{
		dict[@"sIWFSSignallingModifyArg"] = sIWFSSignallingModifyArg.objectValue;
	}
	if(sIWFSSignallingModifyRes)
	{
		dict[@"sIWFSSignallingModifyRes"] = sIWFSSignallingModifyRes.objectValue;
	}
	if(setReportingStateArg)
	{
		dict[@"setReportingStateArg"] = setReportingStateArg.objectValue;
	}
	if(setReportingStateRes)
	{
		dict[@"setReportingStateRes"] = setReportingStateRes.objectValue;
	}
	if(statusReportArg)
	{
		dict[@"statusReportArg"] = statusReportArg.objectValue;
	}
	if(statusReportRes)
	{
		dict[@"statusReportRes"] = statusReportRes.objectValue;
	}
	if(remoteUserFreeArg)
	{
		dict[@"remoteUserFreeArg"] = remoteUserFreeArg.objectValue;
	}
	if(remoteUserFreeRes)
	{
		dict[@"remoteUserFreeRes"] = remoteUserFreeRes.objectValue;
	}
	if(registerSS_Arg)
	{
		dict[@"registerSS-Arg"] = registerSS_Arg.objectValue;
	}
	if(ss_Info)
	{
		dict[@"ss-Info"] = ss_Info.objectValue;
	}
	if(ss_ForBS)
	{
		dict[@"ss-ForBS"] = ss_ForBS.objectValue;
	}
	if(interrogateSS_Res)
	{
		dict[@"interrogateSS-Res"] = interrogateSS_Res.objectValue;
	}
	if(ussd_Arg)
	{
		dict[@"ussd-Arg"] = ussd_Arg.objectValue;
	}
	if(ussd_Res)
	{
		dict[@"ussd-Res"] = ussd_Res.objectValue;
	}
	if(ss_Code)
	{
		dict[@"ss-Code"] = ss_Code.objectValue;
	}
	if(newPassword)
	{
		dict[@"newPassword"] = newPassword.objectValue;
	}
	if(guidanceInfo)
	{
		dict[@"guidanceInfo"] = guidanceInfo.objectValue;
	}
	if(currentPassword)
	{
		dict[@"currentPassword"] = currentPassword.objectValue;
	}
	if(registerCC_EntryArg)
	{
		dict[@"registerCC-EntryArg"] = registerCC_EntryArg.objectValue;
	}
	if(registerCC_EntryRes)
	{
		dict[@"registerCC-EntryRes"] = registerCC_EntryRes.objectValue;
	}
	if(eraseCC_EntryArg)
	{
		dict[@"eraseCC-EntryArg"] = eraseCC_EntryArg.objectValue;
	}
	if(eraseCC_EntryRes)
	{
		dict[@"eraseCC-EntryRes"] = eraseCC_EntryRes.objectValue;
	}
	if(routingInfoForSM_Arg)
	{
		dict[@"routingInfoForSM-Arg"] = routingInfoForSM_Arg.objectValue;
	}
	if(routingInfoForSM_Res)
	{
		dict[@"routingInfoForSM-Res"] = routingInfoForSM_Res.objectValue;
	}
	if(mo_ForwardSM_Arg)
	{
		dict[@"mo-ForwardSM-Arg"] = mo_ForwardSM_Arg.objectValue;
	}
	if(mo_ForwardSM_Res)
	{
		dict[@"mo-ForwardSM-Res"] = mo_ForwardSM_Res.objectValue;
	}
	if(mt_ForwardSM_Arg)
	{
		dict[@"mt-ForwardSM-Arg"] = mt_ForwardSM_Arg.objectValue;
	}
	if(mt_ForwardSM_Res)
	{
		dict[@"mt-ForwardSM-Res"] = mt_ForwardSM_Res.objectValue;
	}
	if(reportSM_DeliveryStatusArg)
	{
		dict[@"reportSM-DeliveryStatusArg"] = reportSM_DeliveryStatusArg.objectValue;
	}
	if(reportSM_DeliveryStatusRes)
	{
		dict[@"reportSM-DeliveryStatusRes"] = reportSM_DeliveryStatusRes.objectValue;
	}
	if(informServiceCentreArg)
	{
		dict[@"informServiceCentreArg"] = informServiceCentreArg.objectValue;
	}
	if(alertServiceCentreArg)
	{
		dict[@"alertServiceCentreArg"] = alertServiceCentreArg.objectValue;
	}
	if(readyForSM_Arg)
	{
		dict[@"readyForSM-Arg"] = readyForSM_Arg.objectValue;
	}
	if(readyForSM_Res)
	{
		dict[@"readyForSM-Res"] = readyForSM_Res.objectValue;
	}
	if(provideSubscriberInfoArg)
	{
		dict[@"provideSubscriberInfoArg"] = provideSubscriberInfoArg.objectValue;
	}
	if(provideSubscriberInfoRes)
	{
		dict[@"provideSubscriberInfoRes"] = provideSubscriberInfoRes.objectValue;
	}
	if(anyTimeInterrogationArg)
	{
		dict[@"anyTimeInterrogationArg"] = anyTimeInterrogationArg.objectValue;
	}
	if(anyTimeInterrogationRes)
	{
		dict[@"anyTimeInterrogationRes"] = anyTimeInterrogationRes.objectValue;
	}
	if(ss_InvocationNotificationArg)
	{
		dict[@"ss-InvocationNotificationArg"] = ss_InvocationNotificationArg.objectValue;
	}
	if(ss_InvocationNotificationRes)
	{
		dict[@"ss-InvocationNotificationRes"] = ss_InvocationNotificationRes.objectValue;
	}
	if(prepareGroupCallArg)
	{
		dict[@"prepareGroupCallArg"] = prepareGroupCallArg.objectValue;
	}
	if(prepareGroupCallRes)
	{
		dict[@"prepareGroupCallRes"] = prepareGroupCallRes.objectValue;
	}
	if(sendGroupCallEndSignalArg)
	{
		dict[@"sendGroupCallEndSignalArg"] = sendGroupCallEndSignalArg.objectValue;
	}
	if(sendGroupCallEndSignalRes)
	{
		dict[@"sendGroupCallEndSignalRes"] = sendGroupCallEndSignalRes.objectValue;
	}
	if(processGroupCallSignallingArg)
	{
		dict[@"processGroupCallSignallingArg"] = processGroupCallSignallingArg.objectValue;
	}
	if(forwardGroupCallSignallingArg)
	{
		dict[@"forwardGroupCallSignallingArg"] = forwardGroupCallSignallingArg.objectValue;
	}
	if(updateGprsLocationArg)
	{
		dict[@"updateGprsLocationArg"] = updateGprsLocationArg.objectValue;
	}
	if(updateGprsLocationRes)
	{
		dict[@"updateGprsLocationRes"] = updateGprsLocationRes.objectValue;
	}
	if(sendRoutingInfoForGprsArg)
	{
		dict[@"sendRoutingInfoForGprsArg"] = sendRoutingInfoForGprsArg.objectValue;
	}
	if(sendRoutingInfoForGprsRes)
	{
		dict[@"sendRoutingInfoForGprsRes"] = sendRoutingInfoForGprsRes.objectValue;
	}
	if(failureReportArg)
	{
		dict[@"failureReportArg"] = failureReportArg.objectValue;
	}
	if(failureReportRes)
	{
		dict[@"failureReportRes"] = failureReportRes.objectValue;
	}
	if(noteMsPresentForGprsArg)
	{
		dict[@"noteMsPresentForGprsArg"] = noteMsPresentForGprsArg.objectValue;
	}
	if(noteMsPresentForGprsRes)
	{
		dict[@"noteMsPresentForGprsRes"] = noteMsPresentForGprsRes.objectValue;
	}
	if(provideSubscriberLocation_Arg)
	{
		dict[@"provideSubscriberLocation-Arg"] = provideSubscriberLocation_Arg.objectValue;
	}
	if(provideSubscriberLocation_Res)
	{
		dict[@"provideSubscriberLocation-Res"] = provideSubscriberLocation_Res.objectValue;
	}
	if(routingInfoForLCS_Arg)
	{
		dict[@"routingInfoForLCS-Arg"] = routingInfoForLCS_Arg.objectValue;
	}
	if(routingInfoForLCS_Res)
	{
		dict[@"routingInfoForLCS-Res"] = routingInfoForLCS_Res.objectValue;
	}
	if(subscriberLocationReport_Arg)
	{
		dict[@"subscriberLocationReport-Arg"] = subscriberLocationReport_Arg.objectValue;
	}
	if(subscriberLocationReport_Res)
	{
		dict[@"subscriberLocationReport-Res"] = subscriberLocationReport_Res.objectValue;
	}
	if(authenticationFailureReportArg)
	{
		dict[@"authenticationFailureReportArg"] = authenticationFailureReportArg.objectValue;
	}
	if(authenticationFailureReportRes)
	{
		dict[@"authenticationFailureReportRes"] = authenticationFailureReportRes.objectValue;
	}
	return dict;
}



@end

