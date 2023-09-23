//
//  UMGSMMAP_SendIdentificationArg.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_Tmsi.h>
#import <ulibgsmmap/UMGSMMAP_NumberOfRequestedVectors.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_ISDN_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_LAIFixedLength.h>

@interface UMGSMMAP_SendIdentificationArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_Tmsi *tmsi;
	UMGSMMAP_NumberOfRequestedVectors *numberOfRequestedVectors;
	BOOL segmentationProhibited;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_ISDN_AddressString *msc_Number;
	UMGSMMAP_LAIFixedLength *previous_LAI;
	UMASN1Integer *hopCounter;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_Tmsi *tmsi;
@property(readwrite,strong)	UMGSMMAP_NumberOfRequestedVectors *numberOfRequestedVectors;
@property(readwrite,assign)	BOOL segmentationProhibited;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msc_Number;
@property(readwrite,strong)	UMGSMMAP_LAIFixedLength *previous_LAI;
@property(readwrite,strong)	UMASN1Integer *hopCounter;


- (void)processBeforeEncode;
- (UMGSMMAP_SendIdentificationArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end
