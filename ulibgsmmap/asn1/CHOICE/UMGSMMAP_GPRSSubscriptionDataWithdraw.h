//
//  UMGSMMAP_GPRSSubscriptionDataWithdraw.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_ContextIdList.h"

@interface UMGSMMAP_GPRSSubscriptionDataWithdraw : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	BOOL allGPRSData;
	UMGSMMAP_ContextIdList *contextIdList;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,assign)	BOOL allGPRSData;
@property(readwrite,strong)	UMGSMMAP_ContextIdList *contextIdList;


- (void)processBeforeEncode;
- (UMGSMMAP_GPRSSubscriptionDataWithdraw *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end
