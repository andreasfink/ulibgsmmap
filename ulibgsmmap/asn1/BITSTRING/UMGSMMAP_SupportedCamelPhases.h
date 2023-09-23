//
//  UMGSMMAP_SupportedCamelPhases.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

@interface UMGSMMAP_SupportedCamelPhases : UMASN1BitString<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
}
@property(readwrite,strong)    NSString *operationName;

@end
