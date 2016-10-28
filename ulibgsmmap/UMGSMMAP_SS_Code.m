//
//  UMGSMMAP_SS_Code.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_SS_Code.h"

@implementation UMGSMMAP_SS_Code

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_SS_Code";
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


- (UMGSMMAP_SS_Code *)initWithString:(NSString *)s
{
    if([s isEqualToString:@"allSS"])
    {
        s = @"00";
    }
    else if([s isEqualToString:@"allLineIdentificationSS"])
    {
        s = @"10";
    }
    else if([s isEqualToString:@"clip"])
    {
        s = @"11";
    }
    else if([s isEqualToString:@"clir"])
    {
        s = @"12";
    }
    else if([s isEqualToString:@"colp"])
    {
        s = @"13";
    }
    else if([s isEqualToString:@"colr"])
    {
        s = @"14";
    }
    else if([s isEqualToString:@"mci"])
    {
        s = @"15";
    }
    else if([s isEqualToString:@"allNameIdentificationSS"])
    {
        s = @"18";
    }
    else if([s isEqualToString:@"cnap"])
    {
        s = @"19";
    }
    else if([s isEqualToString:@"allForwardingSS"])
    {
        s = @"20";
    }
    else if([s isEqualToString:@"cfu"])
    {
        s = @"21";
    }
    else if([s isEqualToString:@"allCondForwardingSS"])
    {
        s = @"28";
    }
    else if([s isEqualToString:@"cfb"])
    {
        s = @"29";
    }
    else if([s isEqualToString:@"cfnry"])
    {
        s = @"2A";
    }
    else if([s isEqualToString:@"cfnrc"])
    {
        s = @"2B";
    }
    else if([s isEqualToString:@"cd"])
    {
        s = @"24";
    }
    else if([s isEqualToString:@"allCallOfferingsSS"])
    {
        s = @"30";
    }
    else if([s isEqualToString:@"ect"])
    {
        s = @"31";
    }
    else if([s isEqualToString:@"mah"])
    {
        s = @"32";
    }
    else if([s isEqualToString:@"allCallCompletionSS"])
    {
        s = @"40";
    }
    else if([s isEqualToString:@"cw"])
    {
        s = @"41";
    }
    else if([s isEqualToString:@"hold"])
    {
        s = @"42";
    }
    else if([s isEqualToString:@"ccbs-A"])
    {
        s = @"43";
    }
    else if([s isEqualToString:@"ccbs-B"])
    {
        s = @"44";
    }
    else if([s isEqualToString:@"mc"])
    {
        s = @"45";
    }
    else if([s isEqualToString:@"allMultiPartySS"])
    {
        s = @"50";
    }
    else if([s isEqualToString:@"multiPTY"])
    {
        s = @"51";
    }
    else if([s isEqualToString:@"allCommunityOfInterest-SS"])
    {
        s = @"60";
    }
    else if([s isEqualToString:@"cug"])
    {
        s = @"61";
    }
    else if([s isEqualToString:@"allChargingSS"])
    {
        s = @"70";
    }
    else if([s isEqualToString:@"aoci"])
    {
        s = @"71";
    }
    else if([s isEqualToString:@"aocc"])
    {
        s = @"72";
    }
    else if([s isEqualToString:@"allAdditionalInfoTransferSS"])
    {
        s = @"80";
    }
    else if([s isEqualToString:@"uus1"])
    {
        s = @"81";
    }
    else if([s isEqualToString:@"uus2"])
    {
        s = @"82";
    }
    else if([s isEqualToString:@"uus3"])
    {
        s = @"83";
    }
    else if([s isEqualToString:@"uus4"])
    {
        s = @"84";
    }
    else if([s isEqualToString:@"allBarringSS"])
    {
        s = @"90";
    }
    else if([s isEqualToString:@"barringOfOutgoingCalls"])
    {
        s = @"91";
    }
    else if([s isEqualToString:@"baoc"])
    {
        s = @"92";
    }
    else if([s isEqualToString:@"boic"])
    {
        s = @"93";
    }
    else if([s isEqualToString:@"boicExHC"])
    {
        s = @"94";
    }
    else if([s isEqualToString:@"barringOfIncomingCalls"])
    {
        s = @"99";
    }
    else if([s isEqualToString:@"baic"])
    {
        s = @"9A";
    }
    else if([s isEqualToString:@"bicRoam"])
    {
        s = @"9B";
    }
    else if([s isEqualToString:@"allPLMN-specificSS"])
    {
        s = @"F0";
    }
    else if([s isEqualToString:@"plmn-specificSS-1"])
    {
        s = @"F2";
    }
    else if([s isEqualToString:@"plmn-specificSS-2"])
    {
        s = @"91";
    }
    else if([s isEqualToString:@"plmn-specificSS-3"])
    {
        s = @"F3";
    }
    else if([s isEqualToString:@"plmn-specificSS-4"])
    {
        s = @"F4";
    }
    else if([s isEqualToString:@"plmn-specificSS-5"])
    {
        s = @"F5";
    }
    else if([s isEqualToString:@"plmn-specificSS-6"])
    {
        s = @"F6";
    }
    else if([s isEqualToString:@"plmn-specificSS-7"])
    {
        s = @"F7";
    }
    else if([s isEqualToString:@"plmn-specificSS-8"])
    {
        s = @"F8";
    }
    else if([s isEqualToString:@"plmn-specificSS-9"])
    {
        s = @"F9";
    }
    else if([s isEqualToString:@"plmn-specificSS-A"])
    {
        s = @"FA";
    }
    else if([s isEqualToString:@"plmn-specificSS-B"])
    {
        s = @"FB";
    }
    else if([s isEqualToString:@"plmn-specificSS-C"])
    {
        s = @"FC";
    }
    else if([s isEqualToString:@"plmn-specificSS-D"])
    {
        s = @"FD";
    }
    else if([s isEqualToString:@"plmn-specificSS-E"])
    {
        s = @"FE";
    }
    else if([s isEqualToString:@"plmn-specificSS-F"])
    {
        s = @"FF";
    }
    else if([s isEqualToString:@"allCallPrioritySS"])
    {
        s = @"A0";
    }
    else if([s isEqualToString:@"emlpp"])
    {
        s = @"A1";
    }
    else if([s isEqualToString:@"allLCSPrivacyException"])
    {
        s = @"B0";
    }
    else if([s isEqualToString:@"universal"])
    {
        s = @"B1";
    }
    else if([s isEqualToString:@"callSessionRelated"])
    {
        s = @"B2";
    }
    else if([s isEqualToString:@"callSessionUnrelated"])
    {
        s = @"B3";
    }
    else if([s isEqualToString:@"plmnoperator"])
    {
        s = @"B4";
    }
    else if([s isEqualToString:@"serviceType"])
    {
        s = @"B5";
    }
    
    else if([s isEqualToString:@"allMOLR-SS"])
    {
        s = @"C0";
    }
    else if([s isEqualToString:@"basicSelfLocation"])
    {
        s = @"C1";
    }
    else if([s isEqualToString:@"autonomousSelfLocation"])
    {
        s = @"C2";
    }
    else if([s isEqualToString:@"transferToThirdParty"])
    {
        s = @"C3";
    }
    
    self = [super initWithString:s];
    return self;
}
@end
