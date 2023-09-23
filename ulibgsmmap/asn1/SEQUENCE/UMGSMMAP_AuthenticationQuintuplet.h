//
//  UMGSMMAP_AuthenticationQuintuplet.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_RAND.h>
#import <ulibgsmmap/UMGSMMAP_XRES.h>
#import <ulibgsmmap/UMGSMMAP_CK.h>
#import <ulibgsmmap/UMGSMMAP_IK.h>
#import <ulibgsmmap/UMGSMMAP_AUTN.h>

@interface UMGSMMAP_AuthenticationQuintuplet : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_RAND *rand;
	UMGSMMAP_XRES *xres;
	UMGSMMAP_CK *ck;
	UMGSMMAP_IK *ik;
	UMGSMMAP_AUTN *autn;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_RAND *rand;
@property(readwrite,strong)	UMGSMMAP_XRES *xres;
@property(readwrite,strong)	UMGSMMAP_CK *ck;
@property(readwrite,strong)	UMGSMMAP_IK *ik;
@property(readwrite,strong)	UMGSMMAP_AUTN *autn;


- (void)processBeforeEncode;
- (UMGSMMAP_AuthenticationQuintuplet *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end
