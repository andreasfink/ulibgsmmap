//
//  UMGSMMAP_AnyTimeInterrogationArg.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_SubscriberIdentity.h>
#import <ulibgsmmap/UMGSMMAP_RequestedInfo.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_AnyTimeInterrogationArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_SubscriberIdentity *subscriberIdentity;
	UMGSMMAP_RequestedInfo *requestedInfo;
	UMASN1OctetString *gsmSCF_Address;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_SubscriberIdentity *subscriberIdentity;
@property(readwrite,strong)	UMGSMMAP_RequestedInfo *requestedInfo;
@property(readwrite,strong)	UMASN1OctetString *gsmSCF_Address;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_AnyTimeInterrogationArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end
