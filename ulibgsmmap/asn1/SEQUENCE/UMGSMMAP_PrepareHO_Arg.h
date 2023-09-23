//
//  UMGSMMAP_PrepareHO_Arg.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_GlobalCellId.h>
#import <ulibgsmmap/UMGSMMAP_ExternalSignalInfo.h>

@interface UMGSMMAP_PrepareHO_Arg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_GlobalCellId *targetCellId;
	BOOL ho_NumberNotRequired;
	UMGSMMAP_ExternalSignalInfo *bss_APDU;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_GlobalCellId *targetCellId;
@property(readwrite,assign)	BOOL ho_NumberNotRequired;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *bss_APDU;


- (void)processBeforeEncode;
- (UMGSMMAP_PrepareHO_Arg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end
