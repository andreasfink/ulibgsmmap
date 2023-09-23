//
//  UMGSMMAP_CallBarredParam.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_CallBarringCause.h>
#import <ulibgsmmap/UMGSMMAP_ExtensibleCallBarredParam.h>

@interface UMGSMMAP_CallBarredParam : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_CallBarringCause *callBarringCause;
	UMGSMMAP_ExtensibleCallBarredParam *extensibleCallBarredParam;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_CallBarringCause *callBarringCause;
@property(readwrite,strong)	UMGSMMAP_ExtensibleCallBarredParam *extensibleCallBarredParam;


- (void)processBeforeEncode;
- (UMGSMMAP_CallBarredParam *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end
