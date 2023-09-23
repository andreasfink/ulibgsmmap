//
//  UMGSMMAP_BasicServiceCode.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_BearerServiceCode.h>
#import <ulibgsmmap/UMGSMMAP_TeleserviceCode.h>

@interface UMGSMMAP_BasicServiceCode : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_BearerServiceCode *bearerService;
	UMGSMMAP_TeleserviceCode *teleservice;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_BearerServiceCode *bearerService;
@property(readwrite,strong)	UMGSMMAP_TeleserviceCode *teleservice;


- (void)processBeforeEncode;
- (UMGSMMAP_BasicServiceCode *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end
