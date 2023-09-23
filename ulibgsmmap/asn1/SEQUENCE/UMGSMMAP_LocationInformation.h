//
//  UMGSMMAP_LocationInformation.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_GeographicalInformation.h>
#import <ulibgsmmap/UMGSMMAP_ISDN_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_LocationNumber.h>
#import <ulibgsmmap/UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_LSAIdentity.h>
#import <ulibgsmmap/UMGSMMAP_GeodeticInformation.h>
#import <ulibgsmmap/UMGSMMAP_LocationInformationEPS.h>
#import <ulibgsmmap/UMGSMMAP_UserCSGInformation.h>

@interface UMGSMMAP_LocationInformation : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMASN1Integer *ageOfLocationInformation;
	UMGSMMAP_GeographicalInformation *geographicalInformation;
	UMGSMMAP_ISDN_AddressString *vlr_number;
	UMGSMMAP_LocationNumber *locationNumber;
	UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI *cellGlobalIdOrServiceAreaIdOrLAI;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_LSAIdentity *selectedLSA_Id;
	UMGSMMAP_ISDN_AddressString *msc_Number;
	UMGSMMAP_GeodeticInformation *geodeticInformation;
	BOOL currentLocationRetrieved;
	BOOL sai_Present;
	UMGSMMAP_LocationInformationEPS *locationInformationEPS;
	UMGSMMAP_UserCSGInformation *userCSGInformation;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMASN1Integer *ageOfLocationInformation;
@property(readwrite,strong)	UMGSMMAP_GeographicalInformation *geographicalInformation;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *vlr_number;
@property(readwrite,strong)	UMGSMMAP_LocationNumber *locationNumber;
@property(readwrite,strong)	UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI *cellGlobalIdOrServiceAreaIdOrLAI;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_LSAIdentity *selectedLSA_Id;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msc_Number;
@property(readwrite,strong)	UMGSMMAP_GeodeticInformation *geodeticInformation;
@property(readwrite,assign)	BOOL currentLocationRetrieved;
@property(readwrite,assign)	BOOL sai_Present;
@property(readwrite,strong)	UMGSMMAP_LocationInformationEPS *locationInformationEPS;
@property(readwrite,strong)	UMGSMMAP_UserCSGInformation *userCSGInformation;


- (void)processBeforeEncode;
- (UMGSMMAP_LocationInformation *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end
