//
//  UMGSMMAP_CellIdOrLAI.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_CellIdFixedLength.h"
#import "UMGSMMAP_LAIFixedLength.h"

@interface UMGSMMAP_CellIdOrLAI : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_CellIdFixedLength *cellIdFixedLength;
	UMGSMMAP_LAIFixedLength *laiFixedLength;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_CellIdFixedLength *cellIdFixedLength;
@property(readwrite,strong)	UMGSMMAP_LAIFixedLength *laiFixedLength;


- (void)processBeforeEncode;
- (UMGSMMAP_CellIdOrLAI *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end
