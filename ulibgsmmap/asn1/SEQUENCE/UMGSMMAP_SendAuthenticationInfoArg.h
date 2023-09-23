//
//  UMGSMMAP_SendAuthenticationInfoArg.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_IMSI.h>
#import <ulibgsmmap/UMGSMMAP_NumberOfRequestedVectors.h>
#import <ulibgsmmap/UMGSMMAP_Re_SynchronisationInfo.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_SendAuthenticationInfoArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_IMSI *imsi;
	UMGSMMAP_NumberOfRequestedVectors *numberOfRequestedVectors;
	BOOL segmentationProhibited;
	BOOL immediateResponsePreferred;
	UMGSMMAP_Re_SynchronisationInfo *re_synchronisationInfo;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMASN1Boolean *requestingNodeType;
	UMASN1OctetString *requestingPLMN_Id;
	UMGSMMAP_NumberOfRequestedVectors *numberOfRequestedAdditional_Vectors;
	BOOL additionalVectorsAreForEPS;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMGSMMAP_NumberOfRequestedVectors *numberOfRequestedVectors;
@property(readwrite,assign)	BOOL segmentationProhibited;
@property(readwrite,assign)	BOOL immediateResponsePreferred;
@property(readwrite,strong)	UMGSMMAP_Re_SynchronisationInfo *re_synchronisationInfo;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMASN1Boolean *requestingNodeType;
@property(readwrite,strong)	UMASN1OctetString *requestingPLMN_Id;
@property(readwrite,strong)	UMGSMMAP_NumberOfRequestedVectors *numberOfRequestedAdditional_Vectors;
@property(readwrite,assign)	BOOL additionalVectorsAreForEPS;


- (void)processBeforeEncode;
- (UMGSMMAP_SendAuthenticationInfoArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end
