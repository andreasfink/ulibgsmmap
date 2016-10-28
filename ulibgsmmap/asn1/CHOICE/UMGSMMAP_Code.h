//
//  UMGSMMAP_Code.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_OBJECT IDENTIFIER.h"

@interface UMGSMMAP_Code : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMASN1Integer *local;
	UMGSMMAP_OBJECT IDENTIFIER *global;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMASN1Integer *local;
@property(readwrite,strong)	UMGSMMAP_OBJECT IDENTIFIER *global;


- (void)processBeforeEncode;
- (UMGSMMAP_Code *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end
