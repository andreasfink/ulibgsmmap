//
//  UMGSMMAP_LocationInformationGPRS.h
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

#import "UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI.h"
#import "UMGSMMAP_RAIdentity.h"
#import "UMGSMMAP_GeographicalInformation.h"
#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_LSAIdentity.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_GeodeticInformation.h"
#import "UMGSMMAP_AgeOfLocationInformation.h"
#import "UMGSMMAP_UserCSGInformation.h"

@interface UMGSMMAP_LocationInformationGPRS : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI *cellGlobalIdOrServiceAreaIdOrLAI;
	UMGSMMAP_RAIdentity *routeingAreaIdentity;
	UMGSMMAP_GeographicalInformation *geographicalInformation;
	UMGSMMAP_ISDN_AddressString *sgsn_Number;
	UMGSMMAP_LSAIdentity *selectedLSAIdentity;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	BOOL sai_Present;
	UMGSMMAP_GeodeticInformation *geodeticInformation;
	BOOL currentLocationRetrieved;
	UMGSMMAP_AgeOfLocationInformation *ageOfLocationInformation;
	UMGSMMAP_UserCSGInformation *userCSGInformation;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI *cellGlobalIdOrServiceAreaIdOrLAI;
@property(readwrite,strong)	UMGSMMAP_RAIdentity *routeingAreaIdentity;
@property(readwrite,strong)	UMGSMMAP_GeographicalInformation *geographicalInformation;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *sgsn_Number;
@property(readwrite,strong)	UMGSMMAP_LSAIdentity *selectedLSAIdentity;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,assign)	BOOL sai_Present;
@property(readwrite,strong)	UMGSMMAP_GeodeticInformation *geodeticInformation;
@property(readwrite,assign)	BOOL currentLocationRetrieved;
@property(readwrite,strong)	UMGSMMAP_AgeOfLocationInformation *ageOfLocationInformation;
@property(readwrite,strong)	UMGSMMAP_UserCSGInformation *userCSGInformation;


- (void)processBeforeEncode;
- (UMGSMMAP_LocationInformationGPRS *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end
