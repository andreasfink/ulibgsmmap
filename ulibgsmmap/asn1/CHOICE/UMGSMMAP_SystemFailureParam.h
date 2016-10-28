//
//  UMGSMMAP_SystemFailureParam.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_NetworkResource.h"
#import "UMGSMMAP_ExtensibleSystemFailureParam.h"

@interface UMGSMMAP_SystemFailureParam : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_NetworkResource *networkResource;
	UMGSMMAP_ExtensibleSystemFailureParam *extensibleSystemFailureParam;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_NetworkResource *networkResource;
@property(readwrite,strong)	UMGSMMAP_ExtensibleSystemFailureParam *extensibleSystemFailureParam;


- (void)processBeforeEncode;
- (UMGSMMAP_SystemFailureParam *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end
