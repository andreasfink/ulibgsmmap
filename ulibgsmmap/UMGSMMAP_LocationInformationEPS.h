//
//  UMGSMMAP_LocationInformationEPS.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_E_UTRAN_CGI.h"
#import "UMGSMMAP_TA_Id.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_GeographicalInformation.h"
#import "UMGSMMAP_GeodeticInformation.h"
#import "UMGSMMAP_AgeOfLocationInformation.h"
#import "UMGSMMAP_DiameterIdentity.h"

@interface UMGSMMAP_LocationInformationEPS : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_E_UTRAN_CGI *e_utranCellGlobalIdentity;
	UMGSMMAP_TA_Id *trackingAreaIdentity;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_GeographicalInformation *geographicalInformation;
	UMGSMMAP_GeodeticInformation *geodeticInformation;
	BOOL currentLocationRetrieved;
	UMGSMMAP_AgeOfLocationInformation *ageOfLocationInformation;
	UMGSMMAP_DiameterIdentity *mme_Name;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_E_UTRAN_CGI *e_utranCellGlobalIdentity;
@property(readwrite,strong)	UMGSMMAP_TA_Id *trackingAreaIdentity;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_GeographicalInformation *geographicalInformation;
@property(readwrite,strong)	UMGSMMAP_GeodeticInformation *geodeticInformation;
@property(readwrite,assign)	BOOL currentLocationRetrieved;
@property(readwrite,strong)	UMGSMMAP_AgeOfLocationInformation *ageOfLocationInformation;
@property(readwrite,strong)	UMGSMMAP_DiameterIdentity *mme_Name;


- (void)processBeforeEncode;
- (UMGSMMAP_LocationInformationEPS *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end
