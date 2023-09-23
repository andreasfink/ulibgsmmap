//
//  UMGSMMAP_LocationInformationGPRS.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI.h>
#import <ulibgsmmap/UMGSMMAP_RAIdentity.h>
#import <ulibgsmmap/UMGSMMAP_GeographicalInformation.h>
#import <ulibgsmmap/UMGSMMAP_ISDN_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_LSAIdentity.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_GeodeticInformation.h>
#import <ulibgsmmap/UMGSMMAP_AgeOfLocationInformation.h>
#import <ulibgsmmap/UMGSMMAP_UserCSGInformation.h>

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
