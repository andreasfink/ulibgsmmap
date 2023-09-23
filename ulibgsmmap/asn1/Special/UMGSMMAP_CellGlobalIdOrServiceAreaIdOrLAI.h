//
//  UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>


@interface UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMASN1OctetString *cellGlobalIdOrServiceAreaIdFixedLength;
	UMASN1OctetString *laiFixedLength;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMASN1OctetString *cellGlobalIdOrServiceAreaIdFixedLength;
@property(readwrite,strong)	UMASN1OctetString *laiFixedLength;


- (void)processBeforeEncode;
- (UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end
