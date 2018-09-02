//
//  UMGSMMAP_MAP_PDU.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_MAP_PDU.h"

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
@synthesize	theNewPassword;
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
	BOOL isImplicit = YES;
	if(self.asn1_tag.tagClass == UMASN1Class_ContextSpecific)
	{
		isImplicit = NO;
		_asn1_tag.isConstructed=YES;
		_asn1_list = [[NSMutableArray alloc]init];
	}
	if(updateLocationArg)
	{
		[updateLocationArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 0;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = updateLocationArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [updateLocationArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [updateLocationArg.asn1_data copy];
			}
		}
		else
		{
			updateLocationArg.asn1_tag.tagNumber = 0;
			updateLocationArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:updateLocationArg];
		}
	}
	else if(updateLocationRes)
	{
		[updateLocationRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 1;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = updateLocationRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [updateLocationRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [updateLocationRes.asn1_data copy];
			}
		}
		else
		{
			updateLocationRes.asn1_tag.tagNumber = 1;
			updateLocationRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:updateLocationRes];
		}
	}
	else if(cancelLocationArg)
	{
		[cancelLocationArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 2;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = cancelLocationArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [cancelLocationArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [cancelLocationArg.asn1_data copy];
			}
		}
		else
		{
			cancelLocationArg.asn1_tag.tagNumber = 2;
			cancelLocationArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:cancelLocationArg];
		}
	}
	else if(cancelLocationRes)
	{
		[cancelLocationRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 3;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = cancelLocationRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [cancelLocationRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [cancelLocationRes.asn1_data copy];
			}
		}
		else
		{
			cancelLocationRes.asn1_tag.tagNumber = 3;
			cancelLocationRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:cancelLocationRes];
		}
	}
	else if(purgeMS_Arg)
	{
		[purgeMS_Arg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 4;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = purgeMS_Arg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [purgeMS_Arg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [purgeMS_Arg.asn1_data copy];
			}
		}
		else
		{
			purgeMS_Arg.asn1_tag.tagNumber = 4;
			purgeMS_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:purgeMS_Arg];
		}
	}
	else if(purgeMS_Res)
	{
		[purgeMS_Res processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 5;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = purgeMS_Res.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [purgeMS_Res.asn1_list copy];
			}
			else
			{
				self.asn1_data = [purgeMS_Res.asn1_data copy];
			}
		}
		else
		{
			purgeMS_Res.asn1_tag.tagNumber = 5;
			purgeMS_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:purgeMS_Res];
		}
	}
	else if(sendIdentificationArg)
	{
		[sendIdentificationArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 6;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = sendIdentificationArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [sendIdentificationArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [sendIdentificationArg.asn1_data copy];
			}
		}
		else
		{
			sendIdentificationArg.asn1_tag.tagNumber = 6;
			sendIdentificationArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:sendIdentificationArg];
		}
	}
	else if(sendIdentificationRes)
	{
		[sendIdentificationRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 7;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = sendIdentificationRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [sendIdentificationRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [sendIdentificationRes.asn1_data copy];
			}
		}
		else
		{
			sendIdentificationRes.asn1_tag.tagNumber = 7;
			sendIdentificationRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:sendIdentificationRes];
		}
	}
	else if(prepareHO_Arg)
	{
		[prepareHO_Arg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 8;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = prepareHO_Arg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [prepareHO_Arg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [prepareHO_Arg.asn1_data copy];
			}
		}
		else
		{
			prepareHO_Arg.asn1_tag.tagNumber = 8;
			prepareHO_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:prepareHO_Arg];
		}
	}
	else if(prepareHO_Res)
	{
		[prepareHO_Res processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 9;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = prepareHO_Res.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [prepareHO_Res.asn1_list copy];
			}
			else
			{
				self.asn1_data = [prepareHO_Res.asn1_data copy];
			}
		}
		else
		{
			prepareHO_Res.asn1_tag.tagNumber = 9;
			prepareHO_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:prepareHO_Res];
		}
	}
	else if(bss_APDU)
	{
		[bss_APDU processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 10;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = bss_APDU.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [bss_APDU.asn1_list copy];
			}
			else
			{
				self.asn1_data = [bss_APDU.asn1_data copy];
			}
		}
		else
		{
			bss_APDU.asn1_tag.tagNumber = 10;
			bss_APDU.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:bss_APDU];
		}
	}
	else if(prepareSubsequentHO_Arg)
	{
		[prepareSubsequentHO_Arg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 11;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = prepareSubsequentHO_Arg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [prepareSubsequentHO_Arg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [prepareSubsequentHO_Arg.asn1_data copy];
			}
		}
		else
		{
			prepareSubsequentHO_Arg.asn1_tag.tagNumber = 11;
			prepareSubsequentHO_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:prepareSubsequentHO_Arg];
		}
	}
	else if(sendAuthenticationInfoArg)
	{
		[sendAuthenticationInfoArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 12;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = sendAuthenticationInfoArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [sendAuthenticationInfoArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [sendAuthenticationInfoArg.asn1_data copy];
			}
		}
		else
		{
			sendAuthenticationInfoArg.asn1_tag.tagNumber = 12;
			sendAuthenticationInfoArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:sendAuthenticationInfoArg];
		}
	}
	else if(sendAuthenticationInfoRes)
	{
		[sendAuthenticationInfoRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 13;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = sendAuthenticationInfoRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [sendAuthenticationInfoRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [sendAuthenticationInfoRes.asn1_data copy];
			}
		}
		else
		{
			sendAuthenticationInfoRes.asn1_tag.tagNumber = 13;
			sendAuthenticationInfoRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:sendAuthenticationInfoRes];
		}
	}
	else if(imei)
	{
		[imei processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 14;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = imei.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [imei.asn1_list copy];
			}
			else
			{
				self.asn1_data = [imei.asn1_data copy];
			}
		}
		else
		{
			imei.asn1_tag.tagNumber = 14;
			imei.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:imei];
		}
	}
	else if(equipmentStatus)
	{
		[equipmentStatus processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 15;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = equipmentStatus.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [equipmentStatus.asn1_list copy];
			}
			else
			{
				self.asn1_data = [equipmentStatus.asn1_data copy];
			}
		}
		else
		{
			equipmentStatus.asn1_tag.tagNumber = 15;
			equipmentStatus.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:equipmentStatus];
		}
	}
	else if(insertSubscriberDataArg)
	{
		[insertSubscriberDataArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 16;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = insertSubscriberDataArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [insertSubscriberDataArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [insertSubscriberDataArg.asn1_data copy];
			}
		}
		else
		{
			insertSubscriberDataArg.asn1_tag.tagNumber = 16;
			insertSubscriberDataArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:insertSubscriberDataArg];
		}
	}
	else if(insertSubscriberDataRes)
	{
		[insertSubscriberDataRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 17;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = insertSubscriberDataRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [insertSubscriberDataRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [insertSubscriberDataRes.asn1_data copy];
			}
		}
		else
		{
			insertSubscriberDataRes.asn1_tag.tagNumber = 17;
			insertSubscriberDataRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:insertSubscriberDataRes];
		}
	}
	else if(deleteSubscriberDataArg)
	{
		[deleteSubscriberDataArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 18;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = deleteSubscriberDataArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [deleteSubscriberDataArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [deleteSubscriberDataArg.asn1_data copy];
			}
		}
		else
		{
			deleteSubscriberDataArg.asn1_tag.tagNumber = 18;
			deleteSubscriberDataArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:deleteSubscriberDataArg];
		}
	}
	else if(deleteSubscriberDataRes)
	{
		[deleteSubscriberDataRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 19;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = deleteSubscriberDataRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [deleteSubscriberDataRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [deleteSubscriberDataRes.asn1_data copy];
			}
		}
		else
		{
			deleteSubscriberDataRes.asn1_tag.tagNumber = 19;
			deleteSubscriberDataRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:deleteSubscriberDataRes];
		}
	}
	else if(resetArg)
	{
		[resetArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 20;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = resetArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [resetArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [resetArg.asn1_data copy];
			}
		}
		else
		{
			resetArg.asn1_tag.tagNumber = 20;
			resetArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:resetArg];
		}
	}
	else if(restoreDataArg)
	{
		[restoreDataArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 21;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = restoreDataArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [restoreDataArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [restoreDataArg.asn1_data copy];
			}
		}
		else
		{
			restoreDataArg.asn1_tag.tagNumber = 21;
			restoreDataArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:restoreDataArg];
		}
	}
	else if(restoreDataRes)
	{
		[restoreDataRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 22;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = restoreDataRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [restoreDataRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [restoreDataRes.asn1_data copy];
			}
		}
		else
		{
			restoreDataRes.asn1_tag.tagNumber = 22;
			restoreDataRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:restoreDataRes];
		}
	}
	else if(activateTraceModeArg)
	{
		[activateTraceModeArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 23;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = activateTraceModeArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [activateTraceModeArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [activateTraceModeArg.asn1_data copy];
			}
		}
		else
		{
			activateTraceModeArg.asn1_tag.tagNumber = 23;
			activateTraceModeArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:activateTraceModeArg];
		}
	}
	else if(activateTraceModeRes)
	{
		[activateTraceModeRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 24;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = activateTraceModeRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [activateTraceModeRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [activateTraceModeRes.asn1_data copy];
			}
		}
		else
		{
			activateTraceModeRes.asn1_tag.tagNumber = 24;
			activateTraceModeRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:activateTraceModeRes];
		}
	}
	else if(deactivateTraceModeArg)
	{
		[deactivateTraceModeArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 25;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = deactivateTraceModeArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [deactivateTraceModeArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [deactivateTraceModeArg.asn1_data copy];
			}
		}
		else
		{
			deactivateTraceModeArg.asn1_tag.tagNumber = 25;
			deactivateTraceModeArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:deactivateTraceModeArg];
		}
	}
	else if(deactivateTraceModeRes)
	{
		[deactivateTraceModeRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 26;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = deactivateTraceModeRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [deactivateTraceModeRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [deactivateTraceModeRes.asn1_data copy];
			}
		}
		else
		{
			deactivateTraceModeRes.asn1_tag.tagNumber = 26;
			deactivateTraceModeRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:deactivateTraceModeRes];
		}
	}
	else if(msisdn)
	{
		[msisdn processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 27;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = msisdn.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [msisdn.asn1_list copy];
			}
			else
			{
				self.asn1_data = [msisdn.asn1_data copy];
			}
		}
		else
		{
			msisdn.asn1_tag.tagNumber = 27;
			msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:msisdn];
		}
	}
	else if(imsi)
	{
		[imsi processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 28;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = imsi.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [imsi.asn1_list copy];
			}
			else
			{
				self.asn1_data = [imsi.asn1_data copy];
			}
		}
		else
		{
			imsi.asn1_tag.tagNumber = 28;
			imsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:imsi];
		}
	}
	else if(sendRoutingInfoArg)
	{
		[sendRoutingInfoArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 29;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = sendRoutingInfoArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [sendRoutingInfoArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [sendRoutingInfoArg.asn1_data copy];
			}
		}
		else
		{
			sendRoutingInfoArg.asn1_tag.tagNumber = 29;
			sendRoutingInfoArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:sendRoutingInfoArg];
		}
	}
	else if(sendRoutingInfoRes)
	{
		[sendRoutingInfoRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 30;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = sendRoutingInfoRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [sendRoutingInfoRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [sendRoutingInfoRes.asn1_data copy];
			}
		}
		else
		{
			sendRoutingInfoRes.asn1_tag.tagNumber = 30;
			sendRoutingInfoRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:sendRoutingInfoRes];
		}
	}
	else if(provideRoamingNumberArg)
	{
		[provideRoamingNumberArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 31;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = provideRoamingNumberArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [provideRoamingNumberArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [provideRoamingNumberArg.asn1_data copy];
			}
		}
		else
		{
			provideRoamingNumberArg.asn1_tag.tagNumber = 31;
			provideRoamingNumberArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:provideRoamingNumberArg];
		}
	}
	else if(provideRoamingNumberRes)
	{
		[provideRoamingNumberRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 32;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = provideRoamingNumberRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [provideRoamingNumberRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [provideRoamingNumberRes.asn1_data copy];
			}
		}
		else
		{
			provideRoamingNumberRes.asn1_tag.tagNumber = 32;
			provideRoamingNumberRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:provideRoamingNumberRes];
		}
	}
	else if(resumeCallHandlingArg)
	{
		[resumeCallHandlingArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 33;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = resumeCallHandlingArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [resumeCallHandlingArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [resumeCallHandlingArg.asn1_data copy];
			}
		}
		else
		{
			resumeCallHandlingArg.asn1_tag.tagNumber = 33;
			resumeCallHandlingArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:resumeCallHandlingArg];
		}
	}
	else if(resumeCallHandlingRes)
	{
		[resumeCallHandlingRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 34;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = resumeCallHandlingRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [resumeCallHandlingRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [resumeCallHandlingRes.asn1_data copy];
			}
		}
		else
		{
			resumeCallHandlingRes.asn1_tag.tagNumber = 34;
			resumeCallHandlingRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:resumeCallHandlingRes];
		}
	}
	else if(provideSIWFSNumberArg)
	{
		[provideSIWFSNumberArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 35;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = provideSIWFSNumberArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [provideSIWFSNumberArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [provideSIWFSNumberArg.asn1_data copy];
			}
		}
		else
		{
			provideSIWFSNumberArg.asn1_tag.tagNumber = 35;
			provideSIWFSNumberArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:provideSIWFSNumberArg];
		}
	}
	else if(provideSIWFSNumberRes)
	{
		[provideSIWFSNumberRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 36;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = provideSIWFSNumberRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [provideSIWFSNumberRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [provideSIWFSNumberRes.asn1_data copy];
			}
		}
		else
		{
			provideSIWFSNumberRes.asn1_tag.tagNumber = 36;
			provideSIWFSNumberRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:provideSIWFSNumberRes];
		}
	}
	else if(sIWFSSignallingModifyArg)
	{
		[sIWFSSignallingModifyArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 37;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = sIWFSSignallingModifyArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [sIWFSSignallingModifyArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [sIWFSSignallingModifyArg.asn1_data copy];
			}
		}
		else
		{
			sIWFSSignallingModifyArg.asn1_tag.tagNumber = 37;
			sIWFSSignallingModifyArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:sIWFSSignallingModifyArg];
		}
	}
	else if(sIWFSSignallingModifyRes)
	{
		[sIWFSSignallingModifyRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 38;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = sIWFSSignallingModifyRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [sIWFSSignallingModifyRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [sIWFSSignallingModifyRes.asn1_data copy];
			}
		}
		else
		{
			sIWFSSignallingModifyRes.asn1_tag.tagNumber = 38;
			sIWFSSignallingModifyRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:sIWFSSignallingModifyRes];
		}
	}
	else if(setReportingStateArg)
	{
		[setReportingStateArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 39;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = setReportingStateArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [setReportingStateArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [setReportingStateArg.asn1_data copy];
			}
		}
		else
		{
			setReportingStateArg.asn1_tag.tagNumber = 39;
			setReportingStateArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:setReportingStateArg];
		}
	}
	else if(setReportingStateRes)
	{
		[setReportingStateRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 40;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = setReportingStateRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [setReportingStateRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [setReportingStateRes.asn1_data copy];
			}
		}
		else
		{
			setReportingStateRes.asn1_tag.tagNumber = 40;
			setReportingStateRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:setReportingStateRes];
		}
	}
	else if(statusReportArg)
	{
		[statusReportArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 41;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = statusReportArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [statusReportArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [statusReportArg.asn1_data copy];
			}
		}
		else
		{
			statusReportArg.asn1_tag.tagNumber = 41;
			statusReportArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:statusReportArg];
		}
	}
	else if(statusReportRes)
	{
		[statusReportRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 42;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = statusReportRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [statusReportRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [statusReportRes.asn1_data copy];
			}
		}
		else
		{
			statusReportRes.asn1_tag.tagNumber = 42;
			statusReportRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:statusReportRes];
		}
	}
	else if(remoteUserFreeArg)
	{
		[remoteUserFreeArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 43;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = remoteUserFreeArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [remoteUserFreeArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [remoteUserFreeArg.asn1_data copy];
			}
		}
		else
		{
			remoteUserFreeArg.asn1_tag.tagNumber = 43;
			remoteUserFreeArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:remoteUserFreeArg];
		}
	}
	else if(remoteUserFreeRes)
	{
		[remoteUserFreeRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 44;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = remoteUserFreeRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [remoteUserFreeRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [remoteUserFreeRes.asn1_data copy];
			}
		}
		else
		{
			remoteUserFreeRes.asn1_tag.tagNumber = 44;
			remoteUserFreeRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:remoteUserFreeRes];
		}
	}
	else if(registerSS_Arg)
	{
		[registerSS_Arg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 45;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = registerSS_Arg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [registerSS_Arg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [registerSS_Arg.asn1_data copy];
			}
		}
		else
		{
			registerSS_Arg.asn1_tag.tagNumber = 45;
			registerSS_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:registerSS_Arg];
		}
	}
	else if(ss_Info)
	{
		[ss_Info processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 46;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = ss_Info.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [ss_Info.asn1_list copy];
			}
			else
			{
				self.asn1_data = [ss_Info.asn1_data copy];
			}
		}
		else
		{
			ss_Info.asn1_tag.tagNumber = 46;
			ss_Info.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:ss_Info];
		}
	}
	else if(ss_ForBS)
	{
		[ss_ForBS processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 47;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = ss_ForBS.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [ss_ForBS.asn1_list copy];
			}
			else
			{
				self.asn1_data = [ss_ForBS.asn1_data copy];
			}
		}
		else
		{
			ss_ForBS.asn1_tag.tagNumber = 47;
			ss_ForBS.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:ss_ForBS];
		}
	}
	else if(interrogateSS_Res)
	{
		[interrogateSS_Res processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 48;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = interrogateSS_Res.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [interrogateSS_Res.asn1_list copy];
			}
			else
			{
				self.asn1_data = [interrogateSS_Res.asn1_data copy];
			}
		}
		else
		{
			interrogateSS_Res.asn1_tag.tagNumber = 48;
			interrogateSS_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:interrogateSS_Res];
		}
	}
	else if(ussd_Arg)
	{
		[ussd_Arg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 49;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = ussd_Arg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [ussd_Arg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [ussd_Arg.asn1_data copy];
			}
		}
		else
		{
			ussd_Arg.asn1_tag.tagNumber = 49;
			ussd_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:ussd_Arg];
		}
	}
	else if(ussd_Res)
	{
		[ussd_Res processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 50;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = ussd_Res.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [ussd_Res.asn1_list copy];
			}
			else
			{
				self.asn1_data = [ussd_Res.asn1_data copy];
			}
		}
		else
		{
			ussd_Res.asn1_tag.tagNumber = 50;
			ussd_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:ussd_Res];
		}
	}
	else if(ss_Code)
	{
		[ss_Code processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 51;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = ss_Code.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [ss_Code.asn1_list copy];
			}
			else
			{
				self.asn1_data = [ss_Code.asn1_data copy];
			}
		}
		else
		{
			ss_Code.asn1_tag.tagNumber = 51;
			ss_Code.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:ss_Code];
		}
	}
	else if(theNewPassword)
	{
		[theNewPassword processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 52;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = theNewPassword.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [theNewPassword.asn1_list copy];
			}
			else
			{
				self.asn1_data = [theNewPassword.asn1_data copy];
			}
		}
		else
		{
			theNewPassword.asn1_tag.tagNumber = 52;
			theNewPassword.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:theNewPassword];
		}
	}
	else if(guidanceInfo)
	{
		[guidanceInfo processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 53;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = guidanceInfo.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [guidanceInfo.asn1_list copy];
			}
			else
			{
				self.asn1_data = [guidanceInfo.asn1_data copy];
			}
		}
		else
		{
			guidanceInfo.asn1_tag.tagNumber = 53;
			guidanceInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:guidanceInfo];
		}
	}
	else if(currentPassword)
	{
		[currentPassword processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 54;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = currentPassword.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [currentPassword.asn1_list copy];
			}
			else
			{
				self.asn1_data = [currentPassword.asn1_data copy];
			}
		}
		else
		{
			currentPassword.asn1_tag.tagNumber = 54;
			currentPassword.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:currentPassword];
		}
	}
	else if(registerCC_EntryArg)
	{
		[registerCC_EntryArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 55;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = registerCC_EntryArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [registerCC_EntryArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [registerCC_EntryArg.asn1_data copy];
			}
		}
		else
		{
			registerCC_EntryArg.asn1_tag.tagNumber = 55;
			registerCC_EntryArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:registerCC_EntryArg];
		}
	}
	else if(registerCC_EntryRes)
	{
		[registerCC_EntryRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 56;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = registerCC_EntryRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [registerCC_EntryRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [registerCC_EntryRes.asn1_data copy];
			}
		}
		else
		{
			registerCC_EntryRes.asn1_tag.tagNumber = 56;
			registerCC_EntryRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:registerCC_EntryRes];
		}
	}
	else if(eraseCC_EntryArg)
	{
		[eraseCC_EntryArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 57;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = eraseCC_EntryArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [eraseCC_EntryArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [eraseCC_EntryArg.asn1_data copy];
			}
		}
		else
		{
			eraseCC_EntryArg.asn1_tag.tagNumber = 57;
			eraseCC_EntryArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:eraseCC_EntryArg];
		}
	}
	else if(eraseCC_EntryRes)
	{
		[eraseCC_EntryRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 58;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = eraseCC_EntryRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [eraseCC_EntryRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [eraseCC_EntryRes.asn1_data copy];
			}
		}
		else
		{
			eraseCC_EntryRes.asn1_tag.tagNumber = 58;
			eraseCC_EntryRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:eraseCC_EntryRes];
		}
	}
	else if(routingInfoForSM_Arg)
	{
		[routingInfoForSM_Arg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 59;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = routingInfoForSM_Arg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [routingInfoForSM_Arg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [routingInfoForSM_Arg.asn1_data copy];
			}
		}
		else
		{
			routingInfoForSM_Arg.asn1_tag.tagNumber = 59;
			routingInfoForSM_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:routingInfoForSM_Arg];
		}
	}
	else if(routingInfoForSM_Res)
	{
		[routingInfoForSM_Res processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 60;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = routingInfoForSM_Res.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [routingInfoForSM_Res.asn1_list copy];
			}
			else
			{
				self.asn1_data = [routingInfoForSM_Res.asn1_data copy];
			}
		}
		else
		{
			routingInfoForSM_Res.asn1_tag.tagNumber = 60;
			routingInfoForSM_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:routingInfoForSM_Res];
		}
	}
	else if(mo_ForwardSM_Arg)
	{
		[mo_ForwardSM_Arg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 61;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = mo_ForwardSM_Arg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [mo_ForwardSM_Arg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [mo_ForwardSM_Arg.asn1_data copy];
			}
		}
		else
		{
			mo_ForwardSM_Arg.asn1_tag.tagNumber = 61;
			mo_ForwardSM_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:mo_ForwardSM_Arg];
		}
	}
	else if(mo_ForwardSM_Res)
	{
		[mo_ForwardSM_Res processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 62;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = mo_ForwardSM_Res.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [mo_ForwardSM_Res.asn1_list copy];
			}
			else
			{
				self.asn1_data = [mo_ForwardSM_Res.asn1_data copy];
			}
		}
		else
		{
			mo_ForwardSM_Res.asn1_tag.tagNumber = 62;
			mo_ForwardSM_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:mo_ForwardSM_Res];
		}
	}
	else if(mt_ForwardSM_Arg)
	{
		[mt_ForwardSM_Arg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 63;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = mt_ForwardSM_Arg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [mt_ForwardSM_Arg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [mt_ForwardSM_Arg.asn1_data copy];
			}
		}
		else
		{
			mt_ForwardSM_Arg.asn1_tag.tagNumber = 63;
			mt_ForwardSM_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:mt_ForwardSM_Arg];
		}
	}
	else if(mt_ForwardSM_Res)
	{
		[mt_ForwardSM_Res processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 64;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = mt_ForwardSM_Res.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [mt_ForwardSM_Res.asn1_list copy];
			}
			else
			{
				self.asn1_data = [mt_ForwardSM_Res.asn1_data copy];
			}
		}
		else
		{
			mt_ForwardSM_Res.asn1_tag.tagNumber = 64;
			mt_ForwardSM_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:mt_ForwardSM_Res];
		}
	}
	else if(reportSM_DeliveryStatusArg)
	{
		[reportSM_DeliveryStatusArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 65;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = reportSM_DeliveryStatusArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [reportSM_DeliveryStatusArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [reportSM_DeliveryStatusArg.asn1_data copy];
			}
		}
		else
		{
			reportSM_DeliveryStatusArg.asn1_tag.tagNumber = 65;
			reportSM_DeliveryStatusArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:reportSM_DeliveryStatusArg];
		}
	}
	else if(reportSM_DeliveryStatusRes)
	{
		[reportSM_DeliveryStatusRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 66;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = reportSM_DeliveryStatusRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [reportSM_DeliveryStatusRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [reportSM_DeliveryStatusRes.asn1_data copy];
			}
		}
		else
		{
			reportSM_DeliveryStatusRes.asn1_tag.tagNumber = 66;
			reportSM_DeliveryStatusRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:reportSM_DeliveryStatusRes];
		}
	}
	else if(informServiceCentreArg)
	{
		[informServiceCentreArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 67;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = informServiceCentreArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [informServiceCentreArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [informServiceCentreArg.asn1_data copy];
			}
		}
		else
		{
			informServiceCentreArg.asn1_tag.tagNumber = 67;
			informServiceCentreArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:informServiceCentreArg];
		}
	}
	else if(alertServiceCentreArg)
	{
		[alertServiceCentreArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 68;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = alertServiceCentreArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [alertServiceCentreArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [alertServiceCentreArg.asn1_data copy];
			}
		}
		else
		{
			alertServiceCentreArg.asn1_tag.tagNumber = 68;
			alertServiceCentreArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:alertServiceCentreArg];
		}
	}
	else if(readyForSM_Arg)
	{
		[readyForSM_Arg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 69;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = readyForSM_Arg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [readyForSM_Arg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [readyForSM_Arg.asn1_data copy];
			}
		}
		else
		{
			readyForSM_Arg.asn1_tag.tagNumber = 69;
			readyForSM_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:readyForSM_Arg];
		}
	}
	else if(readyForSM_Res)
	{
		[readyForSM_Res processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 70;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = readyForSM_Res.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [readyForSM_Res.asn1_list copy];
			}
			else
			{
				self.asn1_data = [readyForSM_Res.asn1_data copy];
			}
		}
		else
		{
			readyForSM_Res.asn1_tag.tagNumber = 70;
			readyForSM_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:readyForSM_Res];
		}
	}
	else if(provideSubscriberInfoArg)
	{
		[provideSubscriberInfoArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 71;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = provideSubscriberInfoArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [provideSubscriberInfoArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [provideSubscriberInfoArg.asn1_data copy];
			}
		}
		else
		{
			provideSubscriberInfoArg.asn1_tag.tagNumber = 71;
			provideSubscriberInfoArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:provideSubscriberInfoArg];
		}
	}
	else if(provideSubscriberInfoRes)
	{
		[provideSubscriberInfoRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 72;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = provideSubscriberInfoRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [provideSubscriberInfoRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [provideSubscriberInfoRes.asn1_data copy];
			}
		}
		else
		{
			provideSubscriberInfoRes.asn1_tag.tagNumber = 72;
			provideSubscriberInfoRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:provideSubscriberInfoRes];
		}
	}
	else if(anyTimeInterrogationArg)
	{
		[anyTimeInterrogationArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 73;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = anyTimeInterrogationArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [anyTimeInterrogationArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [anyTimeInterrogationArg.asn1_data copy];
			}
		}
		else
		{
			anyTimeInterrogationArg.asn1_tag.tagNumber = 73;
			anyTimeInterrogationArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:anyTimeInterrogationArg];
		}
	}
	else if(anyTimeInterrogationRes)
	{
		[anyTimeInterrogationRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 74;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = anyTimeInterrogationRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [anyTimeInterrogationRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [anyTimeInterrogationRes.asn1_data copy];
			}
		}
		else
		{
			anyTimeInterrogationRes.asn1_tag.tagNumber = 74;
			anyTimeInterrogationRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:anyTimeInterrogationRes];
		}
	}
	else if(ss_InvocationNotificationArg)
	{
		[ss_InvocationNotificationArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 75;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = ss_InvocationNotificationArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [ss_InvocationNotificationArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [ss_InvocationNotificationArg.asn1_data copy];
			}
		}
		else
		{
			ss_InvocationNotificationArg.asn1_tag.tagNumber = 75;
			ss_InvocationNotificationArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:ss_InvocationNotificationArg];
		}
	}
	else if(ss_InvocationNotificationRes)
	{
		[ss_InvocationNotificationRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 76;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = ss_InvocationNotificationRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [ss_InvocationNotificationRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [ss_InvocationNotificationRes.asn1_data copy];
			}
		}
		else
		{
			ss_InvocationNotificationRes.asn1_tag.tagNumber = 76;
			ss_InvocationNotificationRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:ss_InvocationNotificationRes];
		}
	}
	else if(prepareGroupCallArg)
	{
		[prepareGroupCallArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 77;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = prepareGroupCallArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [prepareGroupCallArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [prepareGroupCallArg.asn1_data copy];
			}
		}
		else
		{
			prepareGroupCallArg.asn1_tag.tagNumber = 77;
			prepareGroupCallArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:prepareGroupCallArg];
		}
	}
	else if(prepareGroupCallRes)
	{
		[prepareGroupCallRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 78;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = prepareGroupCallRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [prepareGroupCallRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [prepareGroupCallRes.asn1_data copy];
			}
		}
		else
		{
			prepareGroupCallRes.asn1_tag.tagNumber = 78;
			prepareGroupCallRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:prepareGroupCallRes];
		}
	}
	else if(sendGroupCallEndSignalArg)
	{
		[sendGroupCallEndSignalArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 79;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = sendGroupCallEndSignalArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [sendGroupCallEndSignalArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [sendGroupCallEndSignalArg.asn1_data copy];
			}
		}
		else
		{
			sendGroupCallEndSignalArg.asn1_tag.tagNumber = 79;
			sendGroupCallEndSignalArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:sendGroupCallEndSignalArg];
		}
	}
	else if(sendGroupCallEndSignalRes)
	{
		[sendGroupCallEndSignalRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 80;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = sendGroupCallEndSignalRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [sendGroupCallEndSignalRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [sendGroupCallEndSignalRes.asn1_data copy];
			}
		}
		else
		{
			sendGroupCallEndSignalRes.asn1_tag.tagNumber = 80;
			sendGroupCallEndSignalRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:sendGroupCallEndSignalRes];
		}
	}
	else if(processGroupCallSignallingArg)
	{
		[processGroupCallSignallingArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 81;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = processGroupCallSignallingArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [processGroupCallSignallingArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [processGroupCallSignallingArg.asn1_data copy];
			}
		}
		else
		{
			processGroupCallSignallingArg.asn1_tag.tagNumber = 81;
			processGroupCallSignallingArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:processGroupCallSignallingArg];
		}
	}
	else if(forwardGroupCallSignallingArg)
	{
		[forwardGroupCallSignallingArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 82;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = forwardGroupCallSignallingArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [forwardGroupCallSignallingArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [forwardGroupCallSignallingArg.asn1_data copy];
			}
		}
		else
		{
			forwardGroupCallSignallingArg.asn1_tag.tagNumber = 82;
			forwardGroupCallSignallingArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:forwardGroupCallSignallingArg];
		}
	}
	else if(updateGprsLocationArg)
	{
		[updateGprsLocationArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 83;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = updateGprsLocationArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [updateGprsLocationArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [updateGprsLocationArg.asn1_data copy];
			}
		}
		else
		{
			updateGprsLocationArg.asn1_tag.tagNumber = 83;
			updateGprsLocationArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:updateGprsLocationArg];
		}
	}
	else if(updateGprsLocationRes)
	{
		[updateGprsLocationRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 84;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = updateGprsLocationRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [updateGprsLocationRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [updateGprsLocationRes.asn1_data copy];
			}
		}
		else
		{
			updateGprsLocationRes.asn1_tag.tagNumber = 84;
			updateGprsLocationRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:updateGprsLocationRes];
		}
	}
	else if(sendRoutingInfoForGprsArg)
	{
		[sendRoutingInfoForGprsArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 85;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = sendRoutingInfoForGprsArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [sendRoutingInfoForGprsArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [sendRoutingInfoForGprsArg.asn1_data copy];
			}
		}
		else
		{
			sendRoutingInfoForGprsArg.asn1_tag.tagNumber = 85;
			sendRoutingInfoForGprsArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:sendRoutingInfoForGprsArg];
		}
	}
	else if(sendRoutingInfoForGprsRes)
	{
		[sendRoutingInfoForGprsRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 86;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = sendRoutingInfoForGprsRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [sendRoutingInfoForGprsRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [sendRoutingInfoForGprsRes.asn1_data copy];
			}
		}
		else
		{
			sendRoutingInfoForGprsRes.asn1_tag.tagNumber = 86;
			sendRoutingInfoForGprsRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:sendRoutingInfoForGprsRes];
		}
	}
	else if(failureReportArg)
	{
		[failureReportArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 87;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = failureReportArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [failureReportArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [failureReportArg.asn1_data copy];
			}
		}
		else
		{
			failureReportArg.asn1_tag.tagNumber = 87;
			failureReportArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:failureReportArg];
		}
	}
	else if(failureReportRes)
	{
		[failureReportRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 88;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = failureReportRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [failureReportRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [failureReportRes.asn1_data copy];
			}
		}
		else
		{
			failureReportRes.asn1_tag.tagNumber = 88;
			failureReportRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:failureReportRes];
		}
	}
	else if(noteMsPresentForGprsArg)
	{
		[noteMsPresentForGprsArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 89;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = noteMsPresentForGprsArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [noteMsPresentForGprsArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [noteMsPresentForGprsArg.asn1_data copy];
			}
		}
		else
		{
			noteMsPresentForGprsArg.asn1_tag.tagNumber = 89;
			noteMsPresentForGprsArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:noteMsPresentForGprsArg];
		}
	}
	else if(noteMsPresentForGprsRes)
	{
		[noteMsPresentForGprsRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 90;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = noteMsPresentForGprsRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [noteMsPresentForGprsRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [noteMsPresentForGprsRes.asn1_data copy];
			}
		}
		else
		{
			noteMsPresentForGprsRes.asn1_tag.tagNumber = 90;
			noteMsPresentForGprsRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:noteMsPresentForGprsRes];
		}
	}
	else if(provideSubscriberLocation_Arg)
	{
		[provideSubscriberLocation_Arg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 91;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = provideSubscriberLocation_Arg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [provideSubscriberLocation_Arg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [provideSubscriberLocation_Arg.asn1_data copy];
			}
		}
		else
		{
			provideSubscriberLocation_Arg.asn1_tag.tagNumber = 91;
			provideSubscriberLocation_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:provideSubscriberLocation_Arg];
		}
	}
	else if(provideSubscriberLocation_Res)
	{
		[provideSubscriberLocation_Res processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 92;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = provideSubscriberLocation_Res.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [provideSubscriberLocation_Res.asn1_list copy];
			}
			else
			{
				self.asn1_data = [provideSubscriberLocation_Res.asn1_data copy];
			}
		}
		else
		{
			provideSubscriberLocation_Res.asn1_tag.tagNumber = 92;
			provideSubscriberLocation_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:provideSubscriberLocation_Res];
		}
	}
	else if(routingInfoForLCS_Arg)
	{
		[routingInfoForLCS_Arg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 93;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = routingInfoForLCS_Arg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [routingInfoForLCS_Arg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [routingInfoForLCS_Arg.asn1_data copy];
			}
		}
		else
		{
			routingInfoForLCS_Arg.asn1_tag.tagNumber = 93;
			routingInfoForLCS_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:routingInfoForLCS_Arg];
		}
	}
	else if(routingInfoForLCS_Res)
	{
		[routingInfoForLCS_Res processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 94;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = routingInfoForLCS_Res.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [routingInfoForLCS_Res.asn1_list copy];
			}
			else
			{
				self.asn1_data = [routingInfoForLCS_Res.asn1_data copy];
			}
		}
		else
		{
			routingInfoForLCS_Res.asn1_tag.tagNumber = 94;
			routingInfoForLCS_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:routingInfoForLCS_Res];
		}
	}
	else if(subscriberLocationReport_Arg)
	{
		[subscriberLocationReport_Arg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 95;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = subscriberLocationReport_Arg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [subscriberLocationReport_Arg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [subscriberLocationReport_Arg.asn1_data copy];
			}
		}
		else
		{
			subscriberLocationReport_Arg.asn1_tag.tagNumber = 95;
			subscriberLocationReport_Arg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:subscriberLocationReport_Arg];
		}
	}
	else if(subscriberLocationReport_Res)
	{
		[subscriberLocationReport_Res processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 96;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = subscriberLocationReport_Res.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [subscriberLocationReport_Res.asn1_list copy];
			}
			else
			{
				self.asn1_data = [subscriberLocationReport_Res.asn1_data copy];
			}
		}
		else
		{
			subscriberLocationReport_Res.asn1_tag.tagNumber = 96;
			subscriberLocationReport_Res.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:subscriberLocationReport_Res];
		}
	}
	else if(authenticationFailureReportArg)
	{
		[authenticationFailureReportArg processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 97;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = authenticationFailureReportArg.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [authenticationFailureReportArg.asn1_list copy];
			}
			else
			{
				self.asn1_data = [authenticationFailureReportArg.asn1_data copy];
			}
		}
		else
		{
			authenticationFailureReportArg.asn1_tag.tagNumber = 97;
			authenticationFailureReportArg.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:authenticationFailureReportArg];
		}
	}
	else if(authenticationFailureReportRes)
	{
		[authenticationFailureReportRes processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 98;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = authenticationFailureReportRes.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [authenticationFailureReportRes.asn1_list copy];
			}
			else
			{
				self.asn1_data = [authenticationFailureReportRes.asn1_data copy];
			}
		}
		else
		{
			authenticationFailureReportRes.asn1_tag.tagNumber = 98;
			authenticationFailureReportRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:authenticationFailureReportRes];
		}
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
	int p=0;
	UMASN1Object *o;
	BOOL isImplicit = YES;
	if(self.asn1_tag.tagClass == UMASN1Class_ContextSpecific)
	{
		isImplicit = NO;
		o = [self getObjectAtPosition:p++];
	}
	else
	{
		o = self;
	}
	
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
		theNewPassword = [[UMGSMMAP_NewPassword alloc]initWithASN1Object:o context:context];
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
	if(theNewPassword)
	{
		dict[@"theNewPassword"] = theNewPassword.objectValue;
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

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end

