//
//  UMGSMMAP_Ss_Info.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_ForwardingInfo.h>
#import <ulibgsmmap/UMGSMMAP_CallBarringInfo.h>
#import <ulibgsmmap/UMGSMMAP_SS_Data.h>

@interface UMGSMMAP_Ss_Info : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_ForwardingInfo *forwardingInfo;
	UMGSMMAP_CallBarringInfo *callBarringInfo;
	UMGSMMAP_SS_Data *ss_Data;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_ForwardingInfo *forwardingInfo;
@property(readwrite,strong)	UMGSMMAP_CallBarringInfo *callBarringInfo;
@property(readwrite,strong)	UMGSMMAP_SS_Data *ss_Data;


- (void)processBeforeEncode;
- (UMGSMMAP_Ss_Info *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end
