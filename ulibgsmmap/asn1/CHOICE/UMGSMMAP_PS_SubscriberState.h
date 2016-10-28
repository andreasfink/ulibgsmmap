//
//  UMGSMMAP_PS_SubscriberState.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_PDP_ContextInfoList.h"
#import "UMGSMMAP_NotReachableReason.h"

@interface UMGSMMAP_PS_SubscriberState : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	BOOL notProvidedFromSGSNorMME;
	BOOL ps_Detached;
	BOOL ps_AttachedNotReachableForPaging;
	BOOL ps_AttachedReachableForPaging;
	UMGSMMAP_PDP_ContextInfoList *ps_PDP_ActiveNotReachableForPaging;
	UMGSMMAP_PDP_ContextInfoList *ps_PDP_ActiveReachableForPaging;
	UMGSMMAP_NotReachableReason *netDetNotReachable;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,assign)	BOOL notProvidedFromSGSNorMME;
@property(readwrite,assign)	BOOL ps_Detached;
@property(readwrite,assign)	BOOL ps_AttachedNotReachableForPaging;
@property(readwrite,assign)	BOOL ps_AttachedReachableForPaging;
@property(readwrite,strong)	UMGSMMAP_PDP_ContextInfoList *ps_PDP_ActiveNotReachableForPaging;
@property(readwrite,strong)	UMGSMMAP_PDP_ContextInfoList *ps_PDP_ActiveReachableForPaging;
@property(readwrite,strong)	UMGSMMAP_NotReachableReason *netDetNotReachable;


- (void)processBeforeEncode;
- (UMGSMMAP_PS_SubscriberState *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end
