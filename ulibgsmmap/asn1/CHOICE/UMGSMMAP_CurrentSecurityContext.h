//
//  UMGSMMAP_CurrentSecurityContext.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_GSM_SecurityContextData.h"
#import "UMGSMMAP_UMTS_SecurityContextData.h"

@interface UMGSMMAP_CurrentSecurityContext : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_GSM_SecurityContextData *gsm_SecurityContextData;
	UMGSMMAP_UMTS_SecurityContextData *umts_SecurityContextData;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_GSM_SecurityContextData *gsm_SecurityContextData;
@property(readwrite,strong)	UMGSMMAP_UMTS_SecurityContextData *umts_SecurityContextData;


- (void)processBeforeEncode;
- (UMGSMMAP_CurrentSecurityContext *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end
